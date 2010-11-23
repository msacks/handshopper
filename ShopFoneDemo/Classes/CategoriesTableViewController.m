//
//  CategoriesTableViewController.m
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 10/28/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "CategoriesTableViewController.h"
#import "CategoriesDataSource.h"

@implementation CategoriesTableViewController

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
	background.image = [UIImage imageNamed:@"categories-screen-background.png"];
	[self.view insertSubview:background atIndex:0 ];
	
	UIImageView *img = [[[UIImageView alloc] initWithFrame:CGRectMake(6, 8, 137, 32)] autorelease];
	img.image = [UIImage imageNamed:@"ripcurl-phoneshop-logo-blue-wave-small.png"];
	[background addSubview: img];
	
	img = [[[UIImageView alloc] initWithFrame:CGRectMake(216, 18, 17, 11)] autorelease];
	img.image = [UIImage imageNamed:@"sound-icon-off.png"];
	[background addSubview: img];
	
	img = [[[UIImageView alloc] initWithFrame:CGRectMake(236, 8, 32, 32)] autorelease];
	img.image = [UIImage imageNamed:@"black-circle.png"];
	[background addSubview: img];
	
	UIButton *homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
	homeButton.frame = CGRectMake(238, 8, 30, 30);
	[homeButton setImage:[UIImage imageNamed:@"home-icon.png"] forState:UIControlStateNormal];
	[homeButton addTarget:self action:@selector(goToMainMenu) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview: homeButton];
	
	img = [[[UIImageView alloc] initWithFrame:CGRectMake(268, 4, 40, 40)] autorelease];
	img.image = [UIImage imageNamed:@"black-circle.png"];
	[background addSubview: img];
	
	img = [[[UIImageView alloc] initWithFrame:CGRectMake(279, 14, 19, 19)] autorelease];
	img.image = [UIImage imageNamed:@"no-icon.png"];
	[background addSubview: img];
	
	self.tableView.backgroundColor = [UIColor clearColor];
	self.tableView.separatorColor = [UIColor clearColor];
	CGRect newFrame = self.tableView.frame;
	newFrame.origin.y = 70;
	newFrame.size.height -= 90;
	self.tableView.frame = newFrame;
	self.variableHeightRows = YES;
	
	[self.navigationController setNavigationBarHidden:YES];
	
	self.dataSource = [[[CategoriesDataSource alloc] init] autorelease];
}

- (void)goToMainMenu {
	[self.navigationController popViewControllerAnimated:YES];
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
