//
//  SBView.m
//  MACDemo
//
//  Created by sycf_ios on 2017/6/20.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import "SBView.h"

@implementation SBView
- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    self.wantsLayer = YES;
    self.layer.backgroundColor = [NSColor redColor].CGColor;
    
    // Drawing code here.
}

@end
