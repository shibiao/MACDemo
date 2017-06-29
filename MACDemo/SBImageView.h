//
//  SBImageView.h
//  MACDemo
//
//  Created by sycf_ios on 2017/6/20.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import <Cocoa/Cocoa.h>
//上下左右间距
static CGFloat padding = 10;
@interface SBImageView : NSImageView<NSPasteboardItemDataProvider,NSDraggingSource>

@property (nonatomic,strong) NSTextField *textField;

@end
@interface NSView (SnapShot)
-(NSImage *)snapShot;
@end
