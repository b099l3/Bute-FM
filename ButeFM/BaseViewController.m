//
//  BaseViewController.m
//  RaisedCenterTabBar
//
//  Created by Iain Smith on 03/01/2012.
//  Copyright (c) 2012 b099l3. All rights reserved.
//


#import "BaseViewController.h"

@implementation BaseViewController

@synthesize centreButton = _centreButton;

- (void)viewDidLoad{
    [super viewDidLoad];
    [self addCenterButtonWithImage:[UIImage imageNamed:@"buteFMButton.png"] highlightImage:[UIImage imageNamed:@"buteFMButtonH.png"] selectedImage:[UIImage imageNamed:@"buteFMButtonH.png"]];
    self.tabBar.selectedImageTintColor = [UIColor colorWithRed:0.956 green:0.5725 blue:0.0 alpha:1.0];     // 241 106 35 //	242	145	0	//244	146	0	244	146	0	
}

// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage selectedImage:(UIImage*)selectedImage
{
    //UIButton* button
    _centreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _centreButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    _centreButton.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [_centreButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [_centreButton setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [_centreButton setBackgroundImage:selectedImage forState:UIControlStateSelected];
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        _centreButton.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        _centreButton.center = center;
    }
    
    [_centreButton addTarget:self action:@selector(centreButtonPressed:) forControlEvents:UIControlEventTouchDown];    
    [self.view addSubview:_centreButton];
}

- (void)centreButtonPressed:(UIButton *)sender {
    [self setSelectedIndex:1];
    sender.highlighted = YES;
    sender.selected = YES;   
    [_centreButton setBackgroundImage:[UIImage imageNamed:@"buteFMButtonH.png"] forState:UIControlStateNormal];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (item.tag != 2) {
        _centreButton.highlighted = NO;
        _centreButton.selected = NO;
        [_centreButton setBackgroundImage:[UIImage imageNamed:@"buteFMButton.png"] forState:UIControlStateNormal];
    }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
