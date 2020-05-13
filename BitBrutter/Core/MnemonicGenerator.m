//
//  MnemonicGenerator.m
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/12/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import "MnemonicGenerator.h"

@implementation MnemonicGenerator

- (instancetype) initWithDictinaryPath: (NSString *) path charInWord: (NSInteger *) wordsCount {
    self = [super init];
    if(self) {
        self.dictinaryPath = path;
        self.wordsCount = wordsCount;
        
        NSFileHandle * fileHandle = [NSFileHandle fileHandleForReadingAtPath:path];
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter addObserver:self
                            selector:@selector(fileDataNotification:)
                            name:NSFileHandleReadCompletionNotification
                            object:fileHandle];
        
        [fileHandle readInBackgroundAndNotify];
        NSLog(@"Start read file");
        
    }
    return self;
}

- (void) fileDataNotification: (NSNotification *)aNotification {
    self.fileData = [aNotification object];
    NSLog(@"Reading file notification");
}

- (NSMutableArray<NSString *> *) generate {
    NSMutableArray *sentenceArray = [[NSMutableArray alloc] init];
    NSInteger *wordsCount = self.wordsCount;
    
    if(self.fileData != nil) {
        NSString* newStr = [NSString stringWithUTF8String:[self.fileData bytes]];
        NSArray<NSString *> *byLines = [newStr componentsSeparatedByCharactersInSet: NSCharacterSet.newlineCharacterSet];
        
        for(int word = 0; word < 100; word++) {
            NSString *sentence = @"";
            for(int i = 0; i < *wordsCount; i++) {
                NSUInteger randomIndex = arc4random() % byLines.count;
                NSString *randomWord = [byLines objectAtIndex: randomIndex];
                
                if(i == *wordsCount - 1) {
                    [NSString stringWithFormat: @"%@%@", sentence, randomWord];
                } else {
                    [NSString stringWithFormat: @"%@%@ ", sentence, randomWord];
                }
            }
            [sentenceArray addObject: sentence];
        }
    }
    return sentenceArray;
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
