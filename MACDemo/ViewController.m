//
//  ViewController.m
//  MACDemo
//
//  Created by sycf_ios on 2017/6/20.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import "ViewController.h"
#import "SBView.h"
#import "SBImageView.h"
@interface ViewController ()
@property (weak) IBOutlet SBImageView *imageView;
@property (weak) IBOutlet SBView *customView;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

-(void)mouseDown:(NSEvent *)event{
    
}
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
