//
//  DBManager.m
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/12/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import "DBManager.h"

@implementation DBManager

- (id)init {
    self = [super init];
    if(self) {
        [self openDatabase];
        [self makeTablesInterface];
    }
    return self;
}

- (void)openDatabase {
    NSString *dbname = [InfoPlistHelpers dbName];
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: dbname];
    self.database = [FMDatabase databaseWithPath:path];
    self.database.traceExecution = true;
    [self.database open];
}

- (void) makeTablesInterface {
    self.btcTable = [[BTCTable alloc] initWithDatabase:self.database];
    self.txsTable = [[TXSTable alloc] initWithDatabase:self.database];
}

- (void)dealloc {
    [self.database close];
}

@end
