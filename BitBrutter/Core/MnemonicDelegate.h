//
// Created by Sergey Neikovich on 5/17/20.
// Copyright (c) 2020 F Developers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MnemonicDelegate <NSObject>
    -(void) wordsInDictionary:(NSUInteger) count;
@end
