//
//  ItemDetailTableViewController.m
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 11/09/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "ItemDetailTableViewController.h"
#import "ItemDetailDataSource.h"

@implementation ItemDetailTableViewController

- (id)initWithNavigatorURL:(NSURL*)URL query:(NSDictionary*)query {	
	if (self = [super initWithNavigatorURL:URL query:query]) {
		_itemId =  [[query objectForKey:@"item_id"] retain];
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
	background.image = [UIImage imageNamed:@"item-detail-screen-background.png"];
	[self.view insertSubview:background atIndex:0 ];
	
	self.tableView.backgroundColor = [UIColor clearColor];
	self.tableView.separatorColor = [UIColor clearColor];
	self.tableView.frame = CGRectMake(0, 0, 320, 440);
	self.variableHeightRows = YES;
	
	self.dataSource = [[[ItemDetailDataSource alloc] initWithItemId:_itemId] autorelease];
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
	[_itemId release];
	[_zoomImageURL release];
	//[_viewer release]; // don't; crash ;-)
	//[_photo release];
	//[_photoSource release];
	//[_closeButton release]; // don't; it's autoreleased
	[_lightbox release];
	[_lightboxBackground release];
    [super dealloc];
}

- (void)lightboxInStep1:(NSString *)imageURL {
	_lightboxBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	_lightboxBackground.backgroundColor = RGBACOLOR(10, 10, 10, 0.8);
	[[TTNavigator navigator].window addSubview:_lightboxBackground];

	_lightbox = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 0, 0)];
	_lightbox.backgroundColor = RGBCOLOR(220, 241, 252);
	[_lightboxBackground addSubview:_lightbox];

	_zoomImageURL = [imageURL retain];
	
	_photo = [[ItemDetailImage alloc] init];
	_photo.imageURL = _zoomImageURL;
	_photo.caption = @"";
	_photo.size = CGSizeMake(320, 566);
	
	_photoSource = [[ItemDetailImagePhotoSource alloc] init];
	_photoSource.title = @"";
	_photoSource.image = _photo;
	_photo.photoSource = _photoSource;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.6];
	[UIView setAnimationDidStopSelector:@selector(lightboxInStep2)];
	[UIView setAnimationDelegate:self];
	
	CGRect frame = _lightbox.frame;
	frame.origin.x = 10;
	frame.origin.y = 10;
	frame.size.width = 300;
	frame.size.height = 460;
	_lightbox.frame = frame;
	
	[UIView commitAnimations];
}

- (void)lightboxInStep2 {
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
	[UIApplication sharedApplication].statusBarHidden = YES;

	_viewer = [[ItemDetailImageViewer alloc] initWithPhoto:_photo];
	_viewer.view.frame = CGRectMake(10, 10, 300, 460);
	_viewer.defaultImage = [UIImage imageNamed:@"photoDefault.png"];
	[_viewer scrollView].backgroundColor = RGBCOLOR(220, 241, 252);
	[_viewer loadImages];
	[_lightboxBackground addSubview:_viewer.view];

	_closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
	_closeButton.frame = CGRectMake(305, 0, 20, 20);
	[_closeButton setImage:[UIImage imageNamed:@"circled-plus-icon.png"] forState:UIControlStateNormal];
	[_closeButton addTarget:self action:@selector(lightboxOutStep1) forControlEvents:UIControlEventTouchUpInside];
	[_lightboxBackground addSubview:_closeButton];
}

- (void)lightboxOutStep1 {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.6];
	[UIView setAnimationDidStopSelector:@selector(lightboxOutStep2)];
	[UIView setAnimationDelegate:self];
	
	CGRect frame = _viewer.view.frame;
	frame.origin.x = 20;
	frame.origin.y = 100;
	frame.size.width = 0;
	frame.size.height = 0;
	_viewer.view.frame = frame;
	_lightbox.frame = frame;
	
	[UIView commitAnimations];

	[_closeButton removeFromSuperview];

	[UIApplication sharedApplication].statusBarHidden = NO;
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)lightboxOutStep2 {
	[_viewer.view removeFromSuperview];
	[_lightbox removeFromSuperview];
	[_lightboxBackground removeFromSuperview];

	[_zoomImageURL release];
	//[_viewer release]; // don't; crash ;-)
	//[_photo release];
	//[_photoSource release];
	//[_closeButton release]; // don't; it's autoreleased
	[_lightbox release];
	[_lightboxBackground release];
}

@end
