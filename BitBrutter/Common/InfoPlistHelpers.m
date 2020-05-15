//
//  InfoPlistHelpers.m
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/13/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

#import "InfoPlistHelpers.h"

@implementation InfoPlistHelpers

+ (NSString *) dbName {
    NSString *path = [[NSBundle mainBundle] pathForResource: @"info" ofType: @"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile: path];
    return [dict objectForKey: @"DB_Name"];
}

+ (NSString *) massCheckURL {
    NSString *path = [[NSBundle mainBundle] pathForResource: @"urls" ofType: @"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile: path];
    return [dict objectForKey: @"mass_check"];
}
@end
