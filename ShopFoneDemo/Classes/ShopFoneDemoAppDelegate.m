//
//  ShopFoneDemoAppDelegate.m
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 10/20/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "ShopFoneDemoAppDelegate.h"

#import "Three20/Three20.h"

#import "MainMenuTableViewController.h"
#import "CategoriesTableViewController.h"
#import "ItemListTableViewController.h"
#import "ItemDetailTableViewController.h"
#import "ItemDetailImageViewer.h"
#import "CheckoutViewController.h"

@interface NotImplementedTableViewController : TTModelViewController

@end

@implementation NotImplementedTableViewController

@end

@implementation ShopFoneDemoAppDelegate

@synthesize window;

- (UIViewController *) tabs {
	if (!_tabbar) {
		_tabbar = [[UITabBarController alloc] initWithNibName:nil bundle:nil];	
		[_tabbar setTabURLs:[NSArray arrayWithObjects:@"tt://catalog", 
			@"tt://account", 
			@"tt://search", 
			@"tt://stores", 
			nil]];
		_tabbar.selectedIndex = 1;				
		_tabbar.customizableViewControllers = nil;
	}
	
	return _tabbar;
}

#pragma mark -
#pragma mark Application lifecycle

void myExceptionHandler(NSException *exception) {
    NSArray *stack = [exception callStackReturnAddresses];
    NSLog(@"%@", stack);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    NSSetUncaughtExceptionHandler(&myExceptionHandler);

	TTNavigator* navigator = [TTNavigator navigator];
	
	TTURLMap *map = navigator.URLMap;
	[map from:@"tt://tabs" toViewController:self selector:@selector(tabs)];	
	
	[map from:@"tt://catalog/" toSharedViewController:[MainMenuTableViewController class]];
	[map from:@"tt://account/" toSharedViewController:[NotImplementedTableViewController class]];
	[map from:@"tt://search/" toSharedViewController:[NotImplementedTableViewController class]];
	[map from:@"tt://stores/" toSharedViewController:[NotImplementedTableViewController class]];

	//// set up tab bar
	UIViewController* controller;
	controller = [[TTNavigator navigator] viewControllerForURL:@"tt://catalog"];
	controller.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Store" image:[UIImage imageNamed:@"store-tab-bar-icon.png"] tag:0] autorelease];
    
	controller = [[TTNavigator navigator] viewControllerForURL:@"tt://account"];
	controller.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"My Account" image:[UIImage imageNamed:@"account-tab-bar-icon.png"] tag:1] autorelease];
    
	controller = [[TTNavigator navigator] viewControllerForURL:@"tt://search"];
	controller.tabBarItem = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:2] autorelease];
    
	controller = [[TTNavigator navigator] viewControllerForURL:@"tt://stores"];
	controller.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Stores" image:[UIImage imageNamed:@"store-locator-tab-bar-icon.png"] tag:3] autorelease];
    
	[map from:@"tt://categories/" toViewController:[CategoriesTableViewController class]];
	[map from:@"tt://items/" toViewController:[ItemListTableViewController class]];
	[map from:@"tt://item/" toViewController:[ItemDetailTableViewController class]];
	[map from:@"tt://item/#(lightboxInStep1)" toViewController:[ItemDetailTableViewController class]];
	[map from:@"tt://zoom/" toViewController:[ItemDetailImageViewer class]];
	[map from:@"tt://check-out/" toViewController:[CheckoutViewController class]];

	UIViewController *vc = [self tabs];
	[navigator.window addSubview:[vc view]];
	[[TTNavigator navigator] openURLs:@"tt://tabs", @"tt://catalog", nil];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
