//
//  DBManagerProtocol.h
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/13/20.
//  Copyright © 2020 F Developers. All rights reserved.
//
#import <FMDB/FMDB.h>
#import "WalletEntity.h"

@protocol DBManagerProtocol

- (void)getAllBtc: (NSMutableArray<WalletEntity *> *) result;
- (void)getAllTxs: (NSMutableArray<WalletEntity *> *) result;

@end
