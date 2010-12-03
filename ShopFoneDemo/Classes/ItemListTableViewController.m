//
//  ItemListTableViewController.m
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 11/24/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "ItemListTableViewController.h"
#import "ItemListDataSource.h"

@implementation ItemListTableViewController

- (id)initWithNavigatorURL:(NSURL*)URL query:(NSDictionary*)query {	
	if (self = [super initWithNavigatorURL:URL query:query]) {
		_category =  [[query objectForKey:@"category"] retain];
	}
	return self;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    [super loadView];
	
	UIImageView *background = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];
	background.image = [UIImage imageNamed:@"item-list-screen-background.png"];
	[self.view insertSubview:background atIndex:0 ];
	
	self.tableView.backgroundColor = [UIColor clearColor];
	self.tableView.separatorColor = [UIColor clearColor];
	self.tableView.frame = CGRectMake(0, 0, 320, 440);
	self.variableHeightRows = YES;
	
	self.dataSource = [[[ItemListDataSource alloc] initWithCategory:_category] autorelease];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
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

/*
- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
*/

- (void)dealloc {
	[_category release];
    [super dealloc];
}

@end
