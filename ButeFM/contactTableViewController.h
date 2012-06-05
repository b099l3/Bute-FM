//
//  contactTableViewController.h
//  ButeFM
//
//  Created by Iain Smith on 11/03/2012.
//  Copyright (c) 2012 b099l3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface contactTableViewController : UITableViewController <UIWebViewDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>

@property (nonatomic, strong) NSArray *list;
@property (nonatomic, strong) NSArray *linkList;
@property (nonatomic, strong) NSMutableArray *statusList;


-(void)displayMessageComposerSheet;
-(void)launchMessageAppOnDevice;
-(void)displayMailComposerSheet;
-(void)launchMailAppOnDevice;

@end
