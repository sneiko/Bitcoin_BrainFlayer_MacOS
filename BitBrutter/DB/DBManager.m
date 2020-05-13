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
    }
    return self;
}

- (void)openDatabase {
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Base.db"];
    self.database = [FMDatabase databaseWithPath:path];
    self.database.traceExecution = true;
    [self.database open];
}

- (void)dealloc {
    [self.database close];
}

@end
