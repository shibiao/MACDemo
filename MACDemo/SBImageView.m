//
//  SBImageView.m
//  MACDemo
//
//  Created by sycf_ios on 2017/6/20.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import "SBImageView.h"
#import "SBView.h"
#import <Masonry.h>
@implementation SBImageView
-(NSTextField *)textField{
    if (!_textField) {
        _textField = [[NSTextField alloc]init];
        _textField.bordered = NO;
//        _textField.bezeled = NO;
        _textField.editable = NO;
        _textField.selectable = NO;
        _textField.stringValue = @"HHHHHH";
        
        [_textField unregisterDraggedTypes];
    }
    return _textField;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.focusRingType = NSFocusRingTypeNone;
        self.wantsLayer = YES;
        self.layer.backgroundColor = [NSColor whiteColor].CGColor;
        self.layer.borderWidth = 2;
        self.layer.borderColor = [NSColor redColor].CGColor;
        self.layer.cornerRadius = 10;
        [self setHighlighted:NO];
    }
    return self;
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    [self addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self).insets(NSEdgeInsetsMake(padding, padding, padding, padding));
        make.height.mas_equalTo(self).offset(20);
    }];
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
