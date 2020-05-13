//
//  MnemonicGenerator.h
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/12/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <CommonCrypto/CommonDigest.h>

NS_ASSUME_NONNULL_BEGIN

@interface MnemonicGenerator : NSObject

// Helpers
- (NSString *) generatePrivateKey: (NSString *) textData;

@end

NS_ASSUME_NONNULL_END
