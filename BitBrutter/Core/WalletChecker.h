//
//  WalletChecker.h
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/15/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WalletEntity.h"
#import "InfoPlistHelpers.h"
#import "WalletCheckerDelegate.h"

@interface WalletChecker : NSObject

@property(weak, nonatomic) id<WalletCheckerDelegate> delegate;

-(instancetype) initWithDelegate: (id<WalletCheckerDelegate>) delegate;

- (void) massCheck: (NSMutableArray<WalletEntity *> *) wallets;

@end
