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
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>
#import "CustomDrawnCell.h"

@interface contactTableViewController : UITableViewController <UIWebViewDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *list;
@property (nonatomic, strong) NSMutableArray *linkList;
@property (nonatomic, strong) NSMutableArray *imageNameList;
@property (nonatomic, strong) NSMutableArray *statusList;
@property (nonatomic) bool isPhone;


-(void)sendText;
-(void)displayMessageComposerSheet;
-(void)launchMessageAppOnDevice;
-(void)sendEmail;
-(void)displayMailComposerSheet;
-(void)launchMailAppOnDevice;
-(void)sendCustomTweet;
-(void)commentOnFB;



@end
