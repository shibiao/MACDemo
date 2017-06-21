//
//  SBImageView.m
//  MACDemo
//
//  Created by sycf_ios on 2017/6/20.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import "SBImageView.h"
#import "SBView.h"
@implementation SBImageView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    self.focusRingType = NSFocusRingTypeNone;
    [self setHighlighted:NO];
    // Drawing code here.
}
-(void)mouseDown:(NSEvent *)event{
    NSPasteboardItem *pasteboardItem = [[NSPasteboardItem alloc]init];
    [pasteboardItem setDataProvider:self forTypes:@[NSPasteboardTypeTIFF]];
    NSDraggingItem *draggingItem = [[NSDraggingItem alloc]initWithPasteboardWriter:pasteboardItem];
    [draggingItem setDraggingFrame:self.bounds contents: [self snapShot]];
    [self beginDraggingSessionWithItems:@[draggingItem] event:event source:self];
}

//MARK: NSDraggingSource
-(NSDragOperation)draggingSession:(NSDraggingSession *)session sourceOperationMaskForDraggingContext:(NSDraggingContext)context{
    return NSDragOperationMove;
}
- (void)draggingSession:(NSDraggingSession *)session willBeginAtPoint:(NSPoint)screenPoint{
    
}
- (void)draggingSession:(NSDraggingSession *)session movedToPoint:(NSPoint)screenPoint{
//    [self removeFromSuperview];
}
- (void)draggingSession:(NSDraggingSession *)session endedAtPoint:(NSPoint)screenPoint operation:(NSDragOperation)operation{

    
}

//MARK: NSPasteboardItemDataProvider
-(void)pasteboard:(NSPasteboard *)pasteboard item:(NSPasteboardItem *)item provideDataForType:(NSString *)type{
    if ([type isEqualToString:NSPasteboardTypeTIFF]) {
        NSData *tiffData = [self.image TIFFRepresentation];
        [pasteboard setData:tiffData forType:type];
    }
}
@end

@implementation NSView(SnapShot)

-(NSImage *)snapShot{
    NSData *pdfData = [self dataWithPDFInsideRect:self.bounds];
    NSImage *image = [[NSImage alloc]initWithData:pdfData];
    return image;
}

@end
