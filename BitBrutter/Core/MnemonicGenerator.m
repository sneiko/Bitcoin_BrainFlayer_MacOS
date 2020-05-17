//
//  MnemonicGenerator.m
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/12/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import "MnemonicGenerator.h"
#import "MnemonicDelegate.h"

@implementation MnemonicGenerator

- (instancetype) initWithDictinaryPath: (NSString *) path
                            wordsCount: (NSInteger *) wordsCount
                           logDelegate: (id<LogDelegate>) logDelegate
                              delegate: (id<MnemonicDelegate>) delegate {
    self = [super init];
    if(self) {
        self.dictinaryPath = path;
        self.wordsCount = wordsCount;
        self.logDelegate = logDelegate;
        self.delegate = delegate;

        [logDelegate printToLog:LogMessageTypeSuccess message:@"Start reading dictionary file"];

        self.fileData = [NSString stringWithContentsOfFile:path encoding:NSStringEncodingConversionAllowLossy error:nil];

        [logDelegate printToLog:LogMessageTypeSuccess message:@"Dictionary file reading success"];
    }
    return self;
}

- (NSMutableArray<NSString *> *) generate {
    NSMutableArray *privateKeys = [[NSMutableArray alloc] init];
    NSInteger *wordsCount = self.wordsCount;

    if(self.fileData != nil) {
        NSArray<NSString *> *byLines = [self.fileData componentsSeparatedByCharactersInSet: NSCharacterSet.newlineCharacterSet];

        [self.delegate wordsInDictionary:[byLines count]];

        for(int word = 0; word < 100; word++) {
            NSMutableString *sentence = [[NSMutableString alloc] init];
            for(int i = 0; i < *wordsCount; i++) {
                NSUInteger randomIndex = arc4random() % byLines.count;
                NSString *randomWord = byLines[randomIndex];

                if(i == *wordsCount - 1) {
                    [sentence appendString: randomWord];
                } else {
                    [sentence appendString:[NSString stringWithFormat:@"%@ ", randomWord]];
                }
            }
            NSString *key = [self generatePrivateKey: sentence];
            [privateKeys addObject: key];
            [self.logDelegate printToLog:LogMessageTypeSuccess message: [NSString stringWithFormat:@"[Mnemonic] %@", key]];
        }
    } else {
        NSLog(@"[ERROR]: fileData is nil");
    }
    return privateKeys;
}


- (NSString *) generatePrivateKey: (NSString *) textData {
    const char* utf8chars = [textData UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(utf8chars, (CC_LONG)strlen(utf8chars), result);

    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}
@end
