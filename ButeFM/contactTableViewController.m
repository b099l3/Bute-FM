//
//  contactTableViewController.m
//  ButeFM
//
//  Created by Iain Smith on 11/03/2012.
//  Copyright (c) 2012 b099l3. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "contactTableViewController.h"


@implementation contactTableViewController

@synthesize list = _list;
@synthesize linkList = _linkList;


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
                      @"About Bute",
                      nil];
    
    NSArray *linkArray = [[NSArray alloc] initWithObjects:
                          @"tel:01700503965",
                          @"sms:07540844554",
                          @"",
                          @"",
                          @"mailto:b099l3@gmail.com?&amp;subject=ButeFM App Query&amp;body=Hi, TEST",
                          @"",
                          nil];
    
    self.list = array;
    self.linkList = linkArray;
    
    
    [self.view.layer setCornerRadius:7.5f];
    [self.view.layer setMasksToBounds:YES];
    
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [self.list objectAtIndex:indexPath.row];
    
    
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
	
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (row == 0){
        NSString *phoneNumber = @"telprompt://01700503965";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    }
}

@end
