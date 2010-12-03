//
//  BaseTableViewController.m
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 11/29/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "BaseTableViewController.h"


@implementation BaseTableViewController

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
	[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:NO];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	UIImageView *img = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 192, 34)] autorelease];
	img.image = [UIImage imageNamed:@"blast-phoneshop-logo-blue-small.png"];
	self.navigationItem.titleView = img;
	
	UIView *buttons = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 72, 40)] autorelease];
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	button.frame = CGRectMake(36, 3, 32, 32);
	[button setImage:[UIImage imageNamed:@"home-icon.png"] forState:UIControlStateNormal];
	[button addTarget:self action:@selector(goToMainMenu) forControlEvents:UIControlEventTouchUpInside];
	[buttons addSubview:button];
	
	button = [UIButton buttonWithType:UIButtonTypeCustom];
	button.frame = CGRectMake(3, 3, 32, 32);
	[button setImage:[UIImage imageNamed:@"sound-icon-off.png"] forState:UIControlStateNormal];
	[button addTarget:self action:@selector(toggleSound) forControlEvents:UIControlEventTouchUpInside];
	[buttons addSubview:button];
	
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:buttons] autorelease];
	
	[self.navigationController.navigationBar setTintColor:[UIColor grayColor]];
	[self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)goToMainMenu {
	[self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)toggleSound {
}

@end
