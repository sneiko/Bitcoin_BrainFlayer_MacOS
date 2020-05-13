//
//  BTCEntity.m
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/13/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import "BTCEntity.h"

@implementation BTCEntity

@synthesize btc;
@synthesize txs;

- (instancetype)initFromFMResultSet: (FMResultSet *) data {
    self = [super init];
    if(self) {
        self._id = [data intForColumn:@"id"];
        self.btc = [data intForColumn:@"btc"];
        self.txs = [data intForColumn:@"txs"];
        self.address = [data stringForColumn:@"address"];
        self.privateKey = [data stringForColumn:@"privateKey"];
        self.publicKey = [data stringForColumn:@"publicKey"];
    }
    return self;
}
@end
