//
//  ItemDetailDataSource.m
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 11/09/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "ItemDetailDataSource.h"
#import "ItemDetail.h"
#import "ItemDetailCell.h"
#import "ItemDetailCategory.h"
#import "ItemDetailCategoryCell.h"

@implementation ItemDetailDataSource

- (id)init {
	if (self = [super init]) {
		self.sections = [NSMutableArray array];
		self.items = [NSMutableArray array];
		
		NSMutableArray *menuItems = [NSMutableArray array];
		
		ItemDetail *item = [ItemDetail itemWithText:@"Mick Fanning Coffee Bean" subtitle:@"Comes with low full rails like a twinner down rail almost. Flatter deck with a similar bottom so you can still sink the rails. A low tall rocker to a medium nose rocker. The bottom comes stock with a vee to a single concave off the tail. This board is not a fish!" imageURL:@"bundle://mike-fanning-coffee-bean-surfboards.png" URL:nil];
		item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys: 
						 @"3\"-4\" Shorter, 3/4\"-1 1/2\" Wider, 1/8\" Thinner due to full railsdrainers.", @"sizeDescription", @"299", @"price", nil];
		[menuItems addObject:item];
		
		[self.items addObject:menuItems];
		[self.sections addObject:@""];

		menuItems = [NSMutableArray array];

		UIColor *selectedBackgroundColor = RGBACOLOR(242, 210, 0, 0.5);
		ItemDetailCategory *category = [ItemDetailCategory itemWithText:nil subtitle:nil imageURL:@"bundle://surfboards-menu-item.png" URL:@"tt://items?category=surfboards"];
		category.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"large-surfboard-icon.png",@"categoryImageName", selectedBackgroundColor, @"selectedBackgroundColor", nil];
		[menuItems addObject:category];
		
		[self.items addObject:menuItems];
		[self.sections addObject:@""];
	}
	return self;
}

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id) object {   
	if ([object isKindOfClass:[ItemDetail class]]) {
		return [ItemDetailCell class];
    } else if ([object isKindOfClass:[ItemDetailCategory class]]) {
		return [ItemDetailCategoryCell class];
    } else {  
        return [super tableView:tableView cellClassForObject:object];  
    }  
}

@end
