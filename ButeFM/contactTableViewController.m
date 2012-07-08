//
//  contactTableViewController.m
//  ButeFM
//
//  Created by Iain Smith on 11/03/2012.
//  Copyright (c) 2012 b099l3. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "contactTableViewController.h" 
#import "AboutViewController.h"

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
    
    NSArray *array = [[NSArray alloc] initWithObjects:
                      @"Call",
                      @"Text",
                      @"Tweet",
                      @"Comment",
                      @"Email",
                      @"About Bute FM",
                      nil];
    
    NSArray *linkArray = [[NSArray alloc] initWithObjects:
                          @"telprompt://01700502266",
                          @"sms:07562612747",
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
                                   @"text",
                                   @"email",
                                   @"email",
                                   @"email",
                                   @"info",
                                   nil];
    
    self.list = array;
    self.linkList = linkArray;
    self.imageNameList = imageNameArray;
    self.statusList = statusArray;
    
    
    
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Contact Type";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [self.list objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.statusList objectAtIndex:indexPath.row];
    NSString *imageFile = [[NSString alloc] initWithFormat:@"%@.png", [self.imageNameList objectAtIndex:indexPath.row]];
    cell.imageView.image = [UIImage imageNamed:imageFile]; 
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
	NSUInteger row = [indexPath row];
	NSString *urlString = [_linkList objectAtIndex:row];
    
    if (row == 0){ //call
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
        
    } else if (row == 1){ //text
        Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
        if (messageClass != nil)
        {
            // We must always check whether the current device is configured for sending emails
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
    } else if(row == 2){ //Tweet
        
        [self sendCustomTweet];
        
    } else if (row == 4){ // Email
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
    } else if (row == 5){ //About
        
        AboutViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
         // ...
         // Pass the selected object to the new view controller.
         [self.navigationController pushViewController:detailViewController animated:YES];

    } else {
	
	//create URL, request, and webview.
	NSURL *theURL = [NSURL URLWithString: urlString];
	NSURLRequest *request = [NSURLRequest requestWithURL: theURL];
	UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,0,300,300)];
	webView.scalesPageToFit = YES;
	[webView setDelegate: self];
	[webView loadRequest: request];
	
	
	
	//create view controlelr too, and push onto nav controller
	UIViewController *newController = [[UIViewController alloc] init];
	newController.view = webView;
	
	//activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	//activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    //UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator];
	//[newController navigationItem].rightBarButtonItem = barButton;
    //[activityIndicator startAnimating];
	
	
	//Pushes the new view stringByAppendingString:mymobileNO.titleLabel.text
	[self.navigationController pushViewController:newController animated:YES];
	}
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    

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
    			[self.statusList replaceObjectAtIndex:1 withObject:@"Result: canceled"];
    			break;
    		case MessageComposeResultSent:
                [self.statusList replaceObjectAtIndex:1 withObject:@"Result: sent"];
    			break;
    		case MessageComposeResultFailed:
                [self.statusList replaceObjectAtIndex:1 withObject:@"Result: failed"];
    			break;
    		default:
                [self.statusList replaceObjectAtIndex:1 withObject:@"Result: not sent"];
    			break;
    	}
	[self dismissModalViewControllerAnimated:YES];
    [self.tableView reloadData];
    //[self.tableView reloadInputViews];
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
                [self.statusList replaceObjectAtIndex:2 withObject:@"Tweet canceled"];
                break;
            case TWTweetComposeViewControllerResultDone:
                   [self.statusList replaceObjectAtIndex:2 withObject:@"Tweet sent"];
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
#pragma mark Workaround Email

// Launches the Mail application on the device.
-(void)launchMailAppOnDevice
{
	NSString *recipients = @"mailto:butefm@yahoo.co.uk,studio@butefm.com&subject=Email from Bute FM App";
	NSString *body = @"&body=Sent from the Bute FM iPhone App";
	
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
	NSString *emailBody = @"Sent from the Bute FM iPhone App";
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
            [self.statusList replaceObjectAtIndex:4 withObject:@"Result: canceled"];
            break;
		case MFMailComposeResultSaved:
			[self.statusList replaceObjectAtIndex:4 withObject:@"Result: Saved"];
            break;
		case MFMailComposeResultSent:
			[self.statusList replaceObjectAtIndex:4 withObject:@"Result: Sent"];
            break;
		case MFMailComposeResultFailed:
			[self.statusList replaceObjectAtIndex:4 withObject:@"Result: Failed"];
            break;
		default:
			[self.statusList replaceObjectAtIndex:4 withObject:@"Result: Not Sent"];
            break;
	}
	[self dismissModalViewControllerAnimated:YES];
    [[[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]] detailTextLabel] setAlpha:1];
    [[[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]] textLabel] layer] ;
    [self.tableView reloadData];
    
    [UIView animateWithDuration:3 animations:^{
        [[[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]] detailTextLabel] setAlpha:0];
        
    }
    completion:^(BOOL finished){
                [UIView animateWithDuration:1 animations:^{
                              [[[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]]                   textLabel]  setCenter:CGPointMake(70, 22)];
                    [self.statusList replaceObjectAtIndex:4 withObject:@""];
                         }
                 ];
    }];

}


@end
