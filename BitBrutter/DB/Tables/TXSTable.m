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

- (void) addRowBtc: (WalletEntity *) data {
    
}

- (BOOL)add:(WalletEntity *)data {
    NSString *query = @"de";
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

- (BOOL)update:(NSObject *)data {
    return [self.database executeUpdate: @"SELECT * FROM txs WHERE id=%d", 0];
}

@end
