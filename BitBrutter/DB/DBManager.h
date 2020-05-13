//
//  DBManager.h
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/12/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import <FMDB/FMDB.h>
#import "DBManagerProtocol.h"
#import "WalletEntity.h"
#import "InfoPlistHelpers.h"
#import "BTCTable.h"
#import "TXSTable.h"

@class BTCTable;
@class TXSTable;

@interface DBManager : NSObject

@property(weak, nonatomic) id<DBManagerProtocol> delegate;
@property(strong, nonatomic) FMDatabase *database;

// Tables
@property(strong, nonatomic) BTCTable *btcTable;
@property(strong, nonatomic) TXSTable *txsTable;

@end
