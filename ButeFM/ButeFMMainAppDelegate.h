//
//  ButeFMMainAppDelegate.h
//  ButeFM
//
//  Created by Iain Smith on 03/01/2012.
//  Copyright (c) 2012 b099l3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButeFMMainAppDelegate : NSObject <UIApplicationDelegate, UINavigationControllerDelegate>
{
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end