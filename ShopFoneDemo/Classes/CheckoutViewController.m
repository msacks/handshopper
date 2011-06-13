//
//  CheckoutViewController.m
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


#import "CheckoutViewController.h"


@implementation CheckoutViewController

- (IBAction)checkout {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Submitting Order" 
												message:@"\n\n"
											   delegate:nil
										   cancelButtonTitle:@"Cancel"
									  otherButtonTitles:nil];
	UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];

	spinner.center = CGPointMake(140, 64);
	CGRect frame = spinner.frame;
	frame.origin.x = round(frame.origin.x);
	frame.origin.y = round(frame.origin.y);
	spinner.frame = frame;
	[spinner startAnimating];
	[alert addSubview:spinner];
	[spinner release];

	[alert show];
	[self performSelector:@selector(closeAlert:) withObject:alert afterDelay:4];
}

- (void)closeAlert:(UIAlertView *)alert {
	[alert dismissWithClickedButtonIndex:0 animated:YES];
	[alert release];

	alert = [[UIAlertView alloc] initWithTitle:@"Order Submitted" 
													message:@"Your order was successful"
												   delegate:nil
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
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

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
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
