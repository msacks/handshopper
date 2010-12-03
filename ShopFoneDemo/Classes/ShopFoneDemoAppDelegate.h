//
//  ShopFoneDemoAppDelegate.h
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 10/20/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopFoneDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UITabBarController *_tabbar;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

