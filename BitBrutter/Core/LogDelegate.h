//
//  LogDelegate.h
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/15/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LogMessageType) {
    LogMessageTypeSuccess, LogMessageTypeWarning, LogMessageTypeError
};

@protocol LogDelegate
- (void) printToLog: (enum LogMessageType) type
            message: (NSString*) message;
@end
