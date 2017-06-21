//
//  CustomView.m
//  MACDemo
//
//  Created by sycf_ios on 2017/6/20.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
-(void)awakeFromNib{
    [super awakeFromNib];
    NSString *UTTypeString =  (__bridge NSString *)kUTTypeContent;
    [self registerForDraggedTypes:[NSArray arrayWithObject:UTTypeString]];
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    self.wantsLayer = YES;
//    self.layer.backgroundColor = [NSColor redColor].CGColor;

    
}
-(NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender{

    return NSDragOperationMove;
}
-(BOOL)performDragOperation:(id<NSDraggingInfo>)sender{
//    NSData *imageData = [[sender draggingPasteboard]dataForType:NSTIFFPboardType];
//    self.imageView = [[SBImageView alloc]initWithFrame:NSMakeRect(0, 0, 50, 100)];
//    [self addSubview:self.imageView];
//    self.imageView.focusRingType = NSFocusRingTypeNone;
//    self.imageView.image = [[NSImage alloc]initWithData:imageData];
//    NSLog(@"imageData: %@",imageData);
//    self.imageView = [[SBImageView alloc]initWithFrame:NSMakeRect(0, 0, 50, 100)];
//    [self addSubview:self.imageView];
//    self.imageView.image = image;

    
    self.imageView = [sender draggingSource];
    NSPoint point = [sender draggingLocation];
    point = [self convertPoint:point fromView:nil];

    self.imageView.frame = CGRectMake(point.x-25, point.y-50, 50, 100);

    return YES;
}
- (NSDragOperation)draggingUpdated:(id <NSDraggingInfo>)sender{
    
    return NSDragOperationGeneric;
}
- (void)draggingExited:(nullable id <NSDraggingInfo>)sender{

}
- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender{
    return YES;
}

- (void)concludeDragOperation:(nullable id <NSDraggingInfo>)sender{

}
/* draggingEnded: is implemented as of Mac OS 10.5 */
- (void)draggingEnded:(nullable id <NSDraggingInfo>)sender{

}
@end
