//
//  SBImageView.h
//  MACDemo
//
//  Created by sycf_ios on 2017/6/20.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SBImageView : NSImageView<NSPasteboardItemDataProvider,NSDraggingSource>



@end
@interface NSView (SnapShot)
-(NSImage *)snapShot;
@end
