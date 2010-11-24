//
//  CategoriesDataSource.m
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 10/28/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "CategoriesDataSource.h"
#import "CategoriesItem.h"
#import "CategoriesItemCell.h"

@implementation CategoriesDataSource

- (id)init {
	if (self = [super init]) {
		self.sections = [NSArray arrayWithObject:@""];
		self.items = [NSMutableArray array];
		
		int counter = 0;
		NSMutableArray *menuItems = [NSMutableArray array];
		CategoriesItem *item;
		
		item = [CategoriesItem itemWithText:nil subtitle:nil imageURL:@"bundle://surfboards-menu-item.png" URL:@"tt://item?category=surfboards"];
		item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"large-surfboard-icon.png",@"categoryImageName", [NSNumber numberWithInt:counter++], @"row", nil];
		[menuItems addObject:item];
		
		item = [CategoriesItem itemWithText:nil subtitle:nil imageURL:@"bundle://clothing-menu-item.png" URL:@"tt://item?category=clothing"];
		item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"large-swimtrunks-icon.png",@"categoryImageName", [NSNumber numberWithInt:counter++], @"row", nil];
		[menuItems addObject:item];
		
		item = [CategoriesItem itemWithText:nil subtitle:nil imageURL:@"bundle://wetsuits-menu-item.png" URL:@"tt://item?category=wetsuits"];
		item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"large-surfboard-icon.png",@"categoryImageName", [NSNumber numberWithInt:counter++], @"row", nil];
		[menuItems addObject:item];
		
		item = [CategoriesItem itemWithText:nil subtitle:nil imageURL:@"bundle://swimwear-menu-item.png" URL:@"tt://item?category=swimwear"];
		item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"large-swimtrunks-icon.png",@"categoryImageName", [NSNumber numberWithBool:YES], @"isNewItem", [NSNumber numberWithInt:counter++], @"row", nil];
		[menuItems addObject:item];
		
		item = [CategoriesItem itemWithText:nil subtitle:nil imageURL:@"bundle://footwear-menu-item.png" URL:@"tt://item?category=footwear"];
		item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"large-surfboard-icon.png",@"categoryImageName", [NSNumber numberWithInt:counter++], @"row", nil];
		[menuItems addObject:item];
		
		[self.items addObject:menuItems];
	}
	return self;
}

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id) object {   
	if ([object isKindOfClass:[CategoriesItem class]]) {
		return [CategoriesItemCell class];
    } else {  
        return [super tableView:tableView cellClassForObject:object];  
    }  
}

@end
