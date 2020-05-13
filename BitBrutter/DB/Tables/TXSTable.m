//
//  TXSTable.m
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/13/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import "TXSTable.h"

@implementation TXSTable
@synthesize database;

- (instancetype) initWithDatabase: (FMDatabase *) database {
    self = [super init];
    if(self) {
        self.database = database;
    }
    return self;
}

- (BOOL)add:(WalletEntity *)data {
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO txs(btc, txs, address, private, public) VALUES (%@, %@, %@, %@, %@);",
                       data.btc, data.txs, data.address, data.privateKey, data.publicKey];
    [self.database executeQuery: query];
    return YES;
}

- (NSArray<WalletEntity *> *)all {
    NSMutableArray<WalletEntity *> *_items = [[NSMutableArray alloc] init];
    FMResultSet *results = [self.database executeQuery:@"SELECT * FROM txs"];
    while([results next]) {
        WalletEntity *obj = [[WalletEntity alloc] initFromFMResultSet:results];
        [_items insertObject:obj atIndex:[_items count]];
    }
    return _items;
}

- (WalletEntity *)getById: (NSInteger *) _id {
    FMResultSet *results = [self.database executeQuery:@"SELECT * FROM txs WHERE id=%d", _id];
    WalletEntity *obj = [[WalletEntity alloc] initFromFMResultSet:results];
    return obj;
}

- (BOOL)update:(WalletEntity *)data {
    NSString *query = [NSString stringWithFormat:
                       @"UPDATE txs SET btc=%@, txs=%@, address=%@, private=%@, public=%@ WHERE id=%@",
                       data.btc, data.txs, data.address, data.privateKey, data.publicKey, data._id];
    return [self.database executeUpdate: query];
}

@end
