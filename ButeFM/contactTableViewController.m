//
//  contactTableViewController.m
//  ButeFM
//
//  Created by Iain Smith on 11/03/2012.
//  Copyright (c) 2012 b099l3. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "contactTableViewController.h" 
#import "CustomDrawnCell.h"
#import "ButeFMMainAppDelegate.h"

@interface contactTableViewController ()

@property (nonatomic) int  tweetIndex;
@property (nonatomic) int  emailIndex;
@property (nonatomic) int  facebookIndex;

@end

@implementation contactTableViewController

@synthesize list = _list;
@synthesize linkList = _linkList;
@synthesize imageNameList = _imageNameList;
@synthesize statusList = _statusList;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:
                             @"Call",
                             @"Text",
                             @"Tweet",
                             @"Comment",
                             @"Email",
                             @"About",
                             nil];
    
    NSMutableArray *linkArray = [[NSMutableArray alloc] initWithObjects:
                                 @"telprompt://01700502266",
                                 @"sms:07562612747" ,
                                 @"",
                                 @"",
                                 @"",
                                 @"",
                                 nil];
    
    NSMutableArray *statusArray = [[NSMutableArray alloc] initWithObjects:
                                   @"",
                                   @"",
                                   @"",
                                   @"",
                                   @"",
                                   @"",
                                   nil];
    
    NSMutableArray *imageNameArray = [[NSMutableArray alloc] initWithObjects:
                                      @"phone",
                                      @"Text-Icon",
                                      @"twitter",
                                      @"f_logo",
                                      @"Email-Icon",
                                      @"about",
                                      nil];
    
    //iphone simulator == dont run
    //iphone == run
    
    //check to see if device is a phone
    if ([[[UIDevice currentDevice] model] rangeOfString:@"Phone"].location == NSNotFound || //Phone is not found OR
        [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location != NSNotFound
        
         // && //simulator is found
        //[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:01700503965"]]]
        )
    {
        self.isPhone = false;
        NSLog(@"%@", [[UIDevice currentDevice] model]);
        //it is and iPhone and it not the simulator
        self.tweetIndex = 0;
        self.facebookIndex = 1;
        self.emailIndex = 2;
        //Remove Call & Text cells as they wont work.
        
        [array removeObjectAtIndex:0];
        [array removeObjectAtIndex:1];
        [linkArray removeObjectAtIndex:0];
        [linkArray removeObjectAtIndex:1];
        [statusArray removeObjectAtIndex:0];
        [statusArray removeObjectAtIndex:1];
        [imageNameArray removeObjectAtIndex:0];
        [imageNameArray removeObjectAtIndex:1];
        
        if (self.isPhone == false){
            NSLog(@"It is not a phone");
        }
    } else {
        self.isPhone = true;
        self.tweetIndex = 2;
        self.facebookIndex = 3;
        self.emailIndex = 4;
    }
    
    /*
     Add logic for facebook cell to display login or picture uf a session is already there.
     */
    ButeFMMainAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    if (appDelegate.session.isOpen) {
        [statusArray replaceObjectAtIndex:self.facebookIndex withObject:@"Log Out"];
        NSLog(@"Displaying Log Out");
    } else {
        [statusArray replaceObjectAtIndex:self.facebookIndex withObject:@"Log In"];
        NSLog(@"Displaying Log In");
    }
    
    self.list = array;
    self.linkList = linkArray;
    self.imageNameList = imageNameArray;
    self.statusList = statusArray;
    
    if (!appDelegate.session.isOpen) {
        // create a fresh session object
        NSLog(@"FBSession not Open creating new Session");
        appDelegate.session = [[FBSession alloc] init];
        
        // if we don't have a cached token, a call to open here would cause UX for login to
        // occur; we don't want that to happen unless the user clicks the login button, and so
        // we check here to make sure we have a token before calling open
        if (appDelegate.session.state == FBSessionStateCreatedTokenLoaded) {
            NSLog(@"Cached token but still neeed to log in");
            // even though we had a cached token, we need to login to make the session usable
            [appDelegate.session openWithCompletionHandler:^(FBSession *session,
                                                             FBSessionState status,
                                                             NSError *error) {
                // we recurse here, in order to update buttons and labels
                [self updateView];
            }];
        }
    }
    
//    [self.view.layer setCornerRadius:7.5f];
//    [self.view.layer setMasksToBounds:YES];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIDeviceOrientationPortraitUpsideDown);
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.list count];
}

// table with with custom drawn cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        static NSString *CellIdentifier = @"CustomDrawnCell";
        
        CustomDrawnCell *cell = (CustomDrawnCell*)[tableView dequeueReusableCellWithIdentifier: CellIdentifier];
        if (cell == nil)
        {
            cell = [[CustomDrawnCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        [cell setTitle:[self.list objectAtIndex:indexPath.row]
              subTitle:[self.statusList objectAtIndex:indexPath.row]
                  time:[self.linkList objectAtIndex:indexPath.row]
             thumbnail:[UIImage imageNamed:[self.imageNameList objectAtIndex:indexPath.row]]];
        
        // other initialization goes here
        return cell;
}



/*
 // table with with built in cells
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
 static NSString *CellIdentifier = @"Cell";
 
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 if (cell == nil) {
 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
 }
 
 // Configure the cell...
 cell.textLabel.text = [NSString stringWithFormat:@"Row %d", indexPath.row];
 cell.detailTextLabel.text = [NSString stringWithFormat:@"Row %d", indexPath.row];
 
 cell.imageView.image = [UIImage imageNamed:@"ios5"];
 
 cell.selectionStyle = UITableViewCellSelectionStyleNone;
 return cell;
 }
 */




#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSUInteger row = [indexPath row];
	NSString *urlString = [_linkList objectAtIndex:row];
    
    if (self.isPhone) { //is a phone
        if (row == 0) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
        }
        else if (row == 1)
        { 
            [self sendText];
        }
        else if (row == 2)
        { 
            [self sendCustomTweet];
        }
        else if (row == 3)
        { 
            NSLog(@"Facebook select");
            [self commentOnFB];
        }
        else if (row == 4)
        { 
            [self sendEmail];
        }
        else if (row == 5)
        {
            UITableViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutTableViewController"];
            [self.navigationController pushViewController:detailViewController animated:YES];
        }
    } 
    else { // is not a phone
        if (row == 0)
        {
            [self sendCustomTweet];
        }
        else if (row == 1)
        {
            NSLog(@"Facebook select");
            [self commentOnFB];
        }
        else if (row == 2)
        {
            [self sendEmail];
        }
        else if (row == 3)
        {
            UITableViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutTableViewController"];
            [self.navigationController pushViewController:detailViewController animated:YES];
        }
    }
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

#pragma mark -
#pragma mark Send SMS

-(void)sendText
{
    Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
    if (messageClass != nil)
    {
        // We must always check whether the current device is configured for sending texts
        if ([messageClass canSendText])
        {
            [self displayMessageComposerSheet];
        }
        else
        {
            [self launchMessageAppOnDevice];
        }
    }
    else
    {
        [self launchMessageAppOnDevice];
    }
}

#pragma mark -
#pragma mark Workaround SMS

// Launches the Mail application on the device.
-(void)launchMessageAppOnDevice
{	
	NSString *sms = @"sms:07562612747";	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:sms]];
}

#pragma mark -
#pragma mark Compose SMS

// Displays an sms composition interface inside the application. Populates all the Sms fields. 
-(void)displayMessageComposerSheet 
{
	MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
	picker.messageComposeDelegate = self;
    
	// Set up recipients
	NSArray *toRecipients = [NSArray arrayWithObject:@"07562612747"]; 
	[picker setRecipients:toRecipients];
	
	// Fill out the body text
	NSString *smsBody = @"Sent from the Bute FM iPhone App";
	[picker setBody:smsBody];
	
	[self presentModalViewController:picker animated:YES];
}

// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
- (void)messageComposeViewController:(MFMessageComposeViewController*)controller didFinishWithResult:(MessageComposeResult)result
{	
    	// Notifies users about errors associated with the interface
    	switch (result)
    	{
    		case MessageComposeResultCancelled:
    			[self.statusList replaceObjectAtIndex:1 withObject:@"Canceled"];
    			break;
    		case MessageComposeResultSent:
                [self.statusList replaceObjectAtIndex:1 withObject:@"Sent"];
    			break;
    		case MessageComposeResultFailed:
                [self.statusList replaceObjectAtIndex:1 withObject:@"Failed"];
    			break;
    		default:
                [self.statusList replaceObjectAtIndex:1 withObject:@"Not Sent"];
    			break;
    	}
	[self dismissModalViewControllerAnimated:YES];
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark FaceBook

-(void)commentOnFB {
    // FBSample logic
    // handler for button click, logs sessions in or out
    // get the app delegate so that we can access the session property
    ButeFMMainAppDelegate  *appDelegate = [[UIApplication sharedApplication]delegate];
    NSLog(@"Got to the start of comment fb");
    // get the app delegate so that we can access the session property
    //SLAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    // this button's job is to flip-flop the session from open to closed
    if (appDelegate.session.isOpen) {
        NSLog(@"FBSession is open");
        // if a user logs out explicitly, we delete any cached token information, and next
        // time they run the applicaiton they will be presented with log in UX again; most
        // users will simply close the app or switch away, without logging out; this will
        // cause the implicit cached-token login to occur on next launch of the application
        [appDelegate.session closeAndClearTokenInformation];
        
    } else {
        if (appDelegate.session.state != FBSessionStateCreated) {
            // Create a new, logged out session.
            NSLog(@"Created log out Session");
            appDelegate.session = [[FBSession alloc] init];
        }
        
        NSLog(@"Openign new FBSession");
        // if the session isn't open, let's open it now and present the login UX to the user
        [appDelegate.session openWithCompletionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
            [self updateView];
        }];
    }
    
}

// FBSample logic
// main helper method to update the UI to reflect the current state of the session.
- (void)updateView {
    // get the app delegate, so that we can reference the session property
    ButeFMMainAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    if (appDelegate.session.isOpen) {
        // valid account UI is shown whenever the session is open
        NSLog(@"FBSession is opened");
        //Get the first cell of the first section
        NSIndexPath *ip = [NSIndexPath indexPathForRow:self.facebookIndex inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:ip];
        
        [self.statusList replaceObjectAtIndex:self.facebookIndex withObject:@"Log Out"];

        //Change the textLabel contents
//        [[cell textLabel] setText:@"log out"];
        NSLog(@"Log Out");
        NSLog(@"%@",appDelegate.session.accessToken);
    } else {
        //Get the first cell of the first section
        NSLog(@"FBSession not opened");
        NSIndexPath *ip = [NSIndexPath indexPathForRow:self.facebookIndex inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:ip];
        
        [self.statusList replaceObjectAtIndex:self.facebookIndex withObject:@"Log In"];

        //Change the textLabel contents
//        [[cell textLabel] setText:@"log in"];
        //self.cell1 = @"Log In";
        
        NSLog(@"No Token");//self.cell2 = @"No Token";
        // login-needed account UI is shown whenever the session is closed
    }
    //Refresh the tableView
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark Tweet

// Displays an tweet composition interface inside the application. Populates the message. 

- (void)sendCustomTweet {
    // Set up the built-in twitter composition view controller.
    TWTweetComposeViewController *tweetViewController = [[TWTweetComposeViewController alloc] init];
    
    // Set the initial tweet text. See the framework for additional properties that can be set.
    [tweetViewController setInitialText:@"@Bute_FM "];
    
    // Create the completion handler block.
    [tweetViewController setCompletionHandler:^(TWTweetComposeViewControllerResult result) {
        
        switch (result) {
            case TWTweetComposeViewControllerResultCancelled:
                [self.statusList replaceObjectAtIndex:self.tweetIndex withObject:@"Canceled"];
                break;
            case TWTweetComposeViewControllerResultDone:
                [self.statusList replaceObjectAtIndex:self.tweetIndex withObject:@"Sent"];
                break;
            default:
                break;
        }
        [self.tableView reloadData];
        [self dismissModalViewControllerAnimated:YES];
    }];
    
    // Present the tweet composition view controller modally.
    [self presentModalViewController:tweetViewController animated:YES];
}


#pragma mark - 
#pragma mark Send Email

-(void)sendEmail
{
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    if (mailClass != nil)
    {
        // We must always check whether the current device is configured for sending emails
        if ([mailClass canSendMail])
        {
            [self displayMailComposerSheet];
        }
        else
        {
            [self launchMailAppOnDevice];
        }
    }
    else
    {
        [self launchMailAppOnDevice];
    }
}

#pragma mark -
#pragma mark Workaround Email

// Launches the Mail application on the device.
-(void)launchMailAppOnDevice
{
	NSString *recipients = @"mailto:butefm@yahoo.co.uk,studio@butefm.com&subject=Email from Bute FM App";
	NSString *body = @"&body=Hey, ";
	
	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

#pragma mark -
#pragma mark Compose Email

// Displays an email composition interface inside the application. Populates all the Mail fields. 
-(void)displayMailComposerSheet 
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	[picker setSubject:@"Email from Bute FM App"];
    
	// Set up recipients
	NSArray *toRecipients = [NSArray arrayWithObjects:@"butefm@yahoo.co.uk", @"studio@butefm.com", nil];
	[picker setToRecipients:toRecipients];
	
	// Fill out the email body text
	NSString *emailBody = @"Hey, ";
	[picker setMessageBody:emailBody isHTML:NO];
	[self presentModalViewController:picker animated:YES];
}

// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
            [self.statusList replaceObjectAtIndex:self.emailIndex withObject:@"canceled"];
            break;
		case MFMailComposeResultSaved:
			[self.statusList replaceObjectAtIndex:self.emailIndex withObject:@"Saved"];
            break;
		case MFMailComposeResultSent:
			[self.statusList replaceObjectAtIndex:self.emailIndex withObject:@"Sent"];
            break;
		case MFMailComposeResultFailed:
			[self.statusList replaceObjectAtIndex:self.emailIndex withObject:@"Failed"];
            break;
		default:
			[self.statusList replaceObjectAtIndex:self.emailIndex withObject:@"Not Sent"];
            break;
	}
	[self dismissModalViewControllerAnimated:YES];
    [[[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.emailIndex inSection:0]] textLabel ] setAlpha:1];
     
     
     
    [self.tableView reloadData];
    
    [UIView animateWithDuration:3 animations:^{
        [[[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.emailIndex inSection:0]] detailTextLabel] setAlpha:0];
        
    }
    completion:^(BOOL finished){
                [UIView animateWithDuration:1 animations:^{
                              [[[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.emailIndex inSection:0]]                   textLabel]  setCenter:CGPointMake(70, 22)];
                    [self.statusList replaceObjectAtIndex:self.emailIndex withObject:@""];
                         }
                 ];
    }];

}


@end
