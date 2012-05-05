//
//  BaseViewController.h
//  RaisedCenterTabBar
//
//  Created by Iain Smith on 03/01/2012.
//  Copyright (c) 2012 b099l3. All rights reserved.
//


@interface BaseViewController : NSObject <UIApplicationDelegate, UINavigationControllerDelegate, UITabBarControllerDelegate>
{
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (weak, nonatomic) IBOutlet UIButton *centreButton;

// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage selectedImage:(UIImage*)selectedImage;

-(IBAction)centreButtonPressed:(UIButton *)sender;

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item;

@end