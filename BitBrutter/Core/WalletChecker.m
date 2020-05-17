//
//  WalletChecker.m
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/15/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import "WalletChecker.h"

@implementation WalletChecker

-(instancetype) initWithDelegate: (id<WalletCheckerDelegate>) delegate {
    self = [super init];
    if(self) {
        self.delegate = delegate;
    }
    return self;
}

- (void) massCheck: (NSMutableArray<WalletEntity *> *) wallets {

    NSURL *url = [NSURL URLWithString: [InfoPlistHelpers massCheckURL]];

    NSMutableString *addressesRow = [[NSMutableString alloc] init];
    for(WalletEntity *wallet in wallets) {
        [addressesRow appendString: wallet.address];
        [addressesRow appendString: @"|"];
    }

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url
                                       completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSString *address = jsonDic
        WalletEntity *wallet = [self findInArray:wallets by:@""];
        
    }];
    [task resume];
}

- (WalletEntity *) findInArray: (NSArray<WalletEntity *> *) wallets
                          by: (NSString *) address {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"type == %@", @"standard"];
    NSArray *filteredArray = [wallets filteredArrayUsingPredicate:predicate];
    id firstFoundObject = nil;
    firstFoundObject =  filteredArray.count > 0 ? filteredArray.firstObject : nil;
    return firstFoundObject;
}

@end
