//
//  MnemonicGenerator.h
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/12/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#include <CommonCrypto/CommonDigest.h>

@interface MnemonicGenerator : NSObject

@property(strong, nonatomic) NSString *dictinaryPath;
@property(assign, nonatomic) NSInteger *wordsCount;
@property(strong, nonatomic) NSData *fileData;

// Helpers
- (NSString *) generatePrivateKey: (NSString *) textData;
- (NSMutableArray<NSString *> *) generate;

@end
