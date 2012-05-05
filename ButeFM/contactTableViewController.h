//
//  contactTableViewController.h
//  ButeFM
//
//  Created by Iain Smith on 11/03/2012.
//  Copyright (c) 2012 b099l3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contactTableViewController : UITableViewController <UIWebViewDelegate>

@property (nonatomic, strong) NSArray *list;
@property (nonatomic, strong) NSArray *linkList;

@end
