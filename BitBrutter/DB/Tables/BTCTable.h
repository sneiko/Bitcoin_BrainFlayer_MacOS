//
//  BTCTable.h
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/13/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WalletEntity.h"
#import "DaoEntityProtocol.h"
#import "DBManager.h"

@interface BTCTable<WalletEntity> : NSObject<DaoEntityProtocol>

@end
