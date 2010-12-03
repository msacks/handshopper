//
//  MainMenuDataSource.m
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 10/20/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "MainMenuDataSource.h"
#import "MainMenuItem.h"
#import "MainMenuItemCell.h"

@implementation MainMenuDataSource

- (id)init {
	if (self = [super init]) {
		self.sections = [NSArray arrayWithObject:@""];
		self.items = [NSMutableArray array];
		
		NSMutableArray *menuItems = [NSMutableArray array];
		MainMenuItem *item;
		
		item = [MainMenuItem itemWithText:nil subtitle:nil imageURL:@"bundle://guys-menu-item.png" URL:@"tt://categories?gender=guys"];
		[menuItems addObject:item];
		
		item = [MainMenuItem itemWithText:nil subtitle:nil imageURL:@"bundle://girls-menu-item.png" URL:@"tt://categories?gender=girls"];
		[menuItems addObject:item];
		
		[self.items addObject:menuItems];
	}
	return self;
}

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id) object {   
	if ([object isKindOfClass:[MainMenuItem class]]) {
		return [MainMenuItemCell class];
    } else {  
        return [super tableView:tableView cellClassForObject:object];  
    }  
}

@end
