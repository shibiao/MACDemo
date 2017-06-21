//
//  CustomView.h
//  MACDemo
//
//  Created by sycf_ios on 2017/6/20.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SBImageView.h"
@interface CustomView : NSView<NSDraggingDestination>
@property (nonatomic,strong) SBImageView *imageView;


@end
