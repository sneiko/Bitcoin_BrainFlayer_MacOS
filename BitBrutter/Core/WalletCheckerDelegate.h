//
//  WalletCheckerDelegate.h
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/15/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WalletCheckerDelegate <NSObject>
- (void) massCheckCallback: (NSMutableArray<WalletEntity *> *) wallets;
@end
