//
//  BaseTableViewController.m
//  ShopFoneDemo
//
/*
 Copyright 2011 GlassCode Corporation www.glasscodeinc.com
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */


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
