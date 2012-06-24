//
//  ButeFMMainAppDelegate.m
//  ButeFM
//
//  Created by Iain Smith on 03/01/2012.
//  Copyright (c) 2012 b099l3. All rights reserved.
//
#import "ButeFMMainAppDelegate.h"

@implementation ButeFMMainAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self customizeControls];
    // Override point for customization after application launch.
    return YES;
}

- (void) customizeControls {
    UITabBar *tabBarAppearance = [UITabBar appearance];
    [tabBarAppearance setTintColor:[UIColor blackColor]];
//    [[UITabBar appearance] setSelectedImageTintColor:[UIColor redColor]];
//    [[UITabBar appearance] setTintColor:[UIColor blackColor]];
//    [[UITabBar appearance] setSelectionIndicatorImage:[[UIImage imageNamed:@"tabbar-selection.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(12, 12, 12, 12)]];
//    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"brushedmetal.png"]];
//    
//    [[UISwitch appearance] setOnTintColor:[UIColor redColor]];
//    [[UISlider appearance] setMinimumTrackTintColor:[UIColor redColor]];
//    [[UISlider appearance] setMaximumTrackTintColor:[[UIColor redColor] colorWithAlphaComponent:0.5]];
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor redColor] forKey:UITextAttributeTextColor] forState:UIControlStateSelected];
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:UITextAttributeTextColor] forState:UIControlStateNormal];
//    
//    
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"buteFMButtonH.png"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationBar *navBarAppearance = [UINavigationBar appearance];
    [navBarAppearance setTintColor:[UIColor blackColor]];
  //  [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIFont fontWithName:@"Helvetica" size:18],UITextAttributeFont, nil]];
    
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIImage imageNamed:@"backbtn-bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 7)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    
//    [[UISwitch appearanceWhenContainedIn:[DetailViewController class],nil] setOnTintColor:BLACK_COLOR];
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
