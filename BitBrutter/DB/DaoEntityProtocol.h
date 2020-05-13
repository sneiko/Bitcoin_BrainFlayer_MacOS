//
//  DaoEntityProtocol.h
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/13/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DaoEntityProtocol <NSObject>

@property(weak, nonatomic) FMDatabase *database;

- (instancetype) initWithDatabase: (FMDatabase *) database;

- (NSArray *) all;
- (NSObject *) getById: (NSInteger *) _id;
- (BOOL) add: (NSObject *) data;
- (BOOL) update: (NSObject *) data;
@end
