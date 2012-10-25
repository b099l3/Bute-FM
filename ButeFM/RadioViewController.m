//
//  RadioViewController.m
//  ButeFM
//
//  Created by Iain Smith on 09/08/2012.
//  Copyright (c) 2012 b099l3. All rights reserved.
//

#import "RadioViewController.h"
#import <MediaPlayer/MediaPlayer.h>


@interface RadioViewController ()

@end

@implementation RadioViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)play:(UIButton *)sender
{
    
    MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:    [NSURL URLWithString:@"live.canstream.co.uk:8000/bute.mp3"]];
    player.movieSourceType = MPMovieSourceTypeStreaming;
    player.view.hidden = YES;
    [self.view addSubview:player.view];
    [player prepareToPlay];
    [player play];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
