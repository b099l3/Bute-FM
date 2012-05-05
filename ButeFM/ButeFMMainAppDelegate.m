//
//  ButeFMMainAppDelegate.m
//  ButeFM
//
//  Created by Iain Smith on 03/01/2012.
//  Copyright (c) 2012 b099l3. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ButeFMMainAppDelegate.h"

@implementation ButeFMMainAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize centreButton = _centreButton;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _navigationController.delegate = self;
    
    // Add the navigation controller's view to the window and display.
    [self.window addSubview:_navigationController.view];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)navigationController:(UINavigationController *)navController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController respondsToSelector:@selector(willAppearIn:)])
        [viewController performSelector:@selector(willAppearIn:) withObject:navController];
}

- (void)viewDidLoad{
    [self addCenterButtonWithImage:[UIImage imageNamed:@"buteFMButton.png"] highlightImage:[UIImage imageNamed:@"buteFMButtonH.png"] selectedImage:[UIImage imageNamed:@"buteFMButtonH.png"]];
    self.navigationController.tabBarController.tabBar.selectedImageTintColor = [UIColor colorWithRed:0.956 green:0.5725 blue:0.0 alpha:1.0];     // 241 106 35 //	242	145	0	//244	146	0	244	146	0	
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
    CGFloat heightDifference = buttonImage.size.height - self.navigationController.tabBarController.tabBar.frame.size.height;
    if (heightDifference < 0)
        _centreButton.center = self.navigationController.tabBarController.tabBar.center;
    else
    {
        CGPoint center = self.navigationController.tabBarController.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        _centreButton.center = center;
    }
    
    [_centreButton addTarget:self action:@selector(centreButtonPressed:) forControlEvents:UIControlEventTouchDown];    
    [self.navigationController.tabBarController.view addSubview:_centreButton];
}

-(IBAction)centreButtonPressed:(UIButton *)sender {
    [self.navigationController.tabBarController setSelectedIndex:2];
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

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
