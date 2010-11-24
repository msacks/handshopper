//
//  MainMenuTableViewController.m
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 10/20/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "MainMenuTableViewController.h"
#import "MainMenuDataSource.h"

@implementation MainMenuTableViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	UIImageView *background = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];
	background.image = [UIImage imageNamed:@"home-screen-background.png"];
	[self.view insertSubview:background atIndex:0 ];
	
	UIImageView *img = [[[UIImageView alloc] initWithFrame:CGRectMake(0, -20, 320, 61)] autorelease];
	img.image = [UIImage imageNamed:@"dotted-pattern.png"];
	img.alpha = 0.5;
	[background addSubview: img];
	
	img = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 120, 320, 61)] autorelease];
	img.image = [UIImage imageNamed:@"dotted-pattern.png"];
	img.alpha = 0.5;
	[background addSubview: img];
	
	img = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 440, 320, 61)] autorelease];
	img.image = [UIImage imageNamed:@"dotted-pattern.png"];
	img.alpha = 0.5;
	[background addSubview: img];
	
	img = [[[UIImageView alloc] initWithFrame:CGRectMake(-1, 30, 258, 199)] autorelease];
	img.image = [UIImage imageNamed:@"blast-phoneshop-logo-main-menu.png"];
	[background addSubview: img];
	
	img = [[[UIImageView alloc] initWithFrame:CGRectMake(219, 136, 49, 49)] autorelease];
	img.image = [UIImage imageNamed:@"cog.png"];
	img.alpha = 0.9;
	[background addSubview: img];
	
	img = [[[UIImageView alloc] initWithFrame:CGRectMake(233, 150, 21, 21)] autorelease];
	img.image = [UIImage imageNamed:@"on-off-icon.png"];
	[background addSubview: img];
	
	self.tableView.backgroundColor = [UIColor clearColor];
	self.tableView.separatorColor = [UIColor clearColor];
	CGRect newFrame = CGRectMake(0, 280, 320, 200);
	self.tableView.frame = newFrame;
	self.variableHeightRows = YES;
	
	[self.navigationController setNavigationBarHidden:YES];
	
	self.dataSource = [[[MainMenuDataSource alloc] init] autorelease];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
