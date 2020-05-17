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
#include "LogDelegate.h"

@protocol MnemonicDelegate;


@interface MnemonicGenerator : NSObject

- (instancetype) initWithDictinaryPath: (NSString *) path
                            wordsCount: (NSInteger *) wordsCount
                           logDelegate: (id<LogDelegate>) logDelegate
                           delegate: (id<MnemonicDelegate>) delegate;

@property(weak, nonatomic) id<LogDelegate> logDelegate;
@property(weak, nonatomic) id<MnemonicDelegate> delegate;
@property(strong, nonatomic) NSString *dictinaryPath;
@property(assign, nonatomic) NSInteger *wordsCount;
@property(strong, nonatomic) NSString *fileData;

// Helpers
- (NSString *) generatePrivateKey: (NSString *) textData;
- (NSMutableArray<NSString *> *) generate;

@end
