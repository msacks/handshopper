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

- (void)shoesCategory {
	NSMutableArray *menuItems = [NSMutableArray array];
	
	UIColor *selectedBackgroundColor = RGBACOLOR(242, 210, 0, 0.5);
	ItemDetailCategory *category = [ItemDetailCategory itemWithText:nil subtitle:nil imageURL:@"bundle://footwear-menu-item.png" URL:@"tt://items?category=girls-footwear"];
	category.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"large-surfboard-icon.png",@"categoryImageName", selectedBackgroundColor, @"selectedBackgroundColor", nil];
	[menuItems addObject:category];
	
	[self.items addObject:menuItems];
	[self.sections addObject:@""];
}

- (void)shoe1 {
	NSMutableArray *menuItems = [NSMutableArray array];
	
	ItemDetail *item = [ItemDetail itemWithText:@"Breezy Sandals" subtitle:@"Leather sandal with leather straps. Made in the USA." imageURL:@"bundle://womens-shoe-1-zoom.png" URL:nil];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Available in a variety of sizes", @"sizeDescription", @"27.99", @"price", nil];
	[menuItems addObject:item];
	
	[self.items addObject:menuItems];
	[self.sections addObject:@""];
	
	[self shoesCategory];
}

- (void)shoe2 {
	NSMutableArray *menuItems = [NSMutableArray array];
	
	ItemDetail *item = [ItemDetail itemWithText:@"Demi Sandals" subtitle:@"Leather sandal with leather straps. Made in the USA." imageURL:@"bundle://womens-shoe-2-zoom.png" URL:nil];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Available in a variety of sizes", @"sizeDescription", @"27.99", @"price", nil];
	[menuItems addObject:item];
	
	[self.items addObject:menuItems];
	[self.sections addObject:@""];
	
	[self shoesCategory];
}

- (void)shoe3 {
	NSMutableArray *menuItems = [NSMutableArray array];
	
	ItemDetail *item = [ItemDetail itemWithText:@"Lullaby Sandals" subtitle:@"Leather sandal with leather straps. Made in the USA." imageURL:@"bundle://womens-shoe-3-zoom.png" URL:nil];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Available in a variety of sizes", @"sizeDescription", @"27.99", @"price", nil];
	[menuItems addObject:item];
	
	[self.items addObject:menuItems];
	[self.sections addObject:@""];
	
	[self shoesCategory];
}

- (void)shoe4 {
	NSMutableArray *menuItems = [NSMutableArray array];
	
	ItemDetail *item = [ItemDetail itemWithText:@"Rambler Sandals" subtitle:@"Leather sandal with leather straps. Made in the USA." imageURL:@"bundle://womens-shoe-4-zoom.png" URL:nil];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Available in a variety of sizes", @"sizeDescription", @"27.99", @"price", nil];
	[menuItems addObject:item];
	
	[self.items addObject:menuItems];
	[self.sections addObject:@""];
	
	[self shoesCategory];
}

- (void)shoe5 {
	NSMutableArray *menuItems = [NSMutableArray array];
	
	ItemDetail *item = [ItemDetail itemWithText:@"Sugar Mama Sandals" subtitle:@"Leather sandal with leather straps. Made in the USA." imageURL:@"bundle://womens-shoe-5-zoom.png" URL:nil];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Available in a variety of sizes", @"sizeDescription", @"27.99", @"price", nil];
	[menuItems addObject:item];
	
	[self.items addObject:menuItems];
	[self.sections addObject:@""];
	
	[self shoesCategory];
}

- (void)clothingCategory {
	NSMutableArray *menuItems = [NSMutableArray array];
	
	UIColor *selectedBackgroundColor = RGBACOLOR(242, 210, 0, 0.5);
	ItemDetailCategory *category = [ItemDetailCategory itemWithText:nil subtitle:nil imageURL:@"bundle://clothing-menu-item.png" URL:@"tt://items?category=guys-clothing"];
	category.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"large-surfboard-icon.png",@"categoryImageName", selectedBackgroundColor, @"selectedBackgroundColor", nil];
	[menuItems addObject:category];
	
	[self.items addObject:menuItems];
	[self.sections addObject:@""];
}

- (void)oneill1 {
	NSMutableArray *menuItems = [NSMutableArray array];
	
	ItemDetail *item = [ItemDetail itemWithText:@"Ground Zero T-Shirt" subtitle:@"100% Cotton. Machine wash. Made in the USA. First name in water text front and O'Neill zero logo on back." imageURL:@"bundle://mens-shirt-1-zoom.png" URL:nil];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Available from small to x-large sizes", @"sizeDescription", @"19.99", @"price", nil];
	[menuItems addObject:item];
	
	[self.items addObject:menuItems];
	[self.sections addObject:@""];
	
	[self clothingCategory];
}

- (void)oneill2 {
	NSMutableArray *menuItems = [NSMutableArray array];
	
	ItemDetail *item = [ItemDetail itemWithText:@"LockUp Long Sleeve Tee" subtitle:@"100% Cotton. Machine wash. Made in the USA. First name in water text front and O'Neill zero logo on back." imageURL:@"bundle://mens-shirt-2-zoom.png" URL:nil];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Available from small to x-large sizes", @"sizeDescription", @"29.99", @"price", nil];
	[menuItems addObject:item];
	
	[self.items addObject:menuItems];
	[self.sections addObject:@""];
	
	[self clothingCategory];
}

- (void)oneill3 {
	NSMutableArray *menuItems = [NSMutableArray array];
	
	ItemDetail *item = [ItemDetail itemWithText:@"LockUp Tee" subtitle:@"100% Cotton. Machine wash. Made in the USA. First name in water text front and O'Neill zero logo on back." imageURL:@"bundle://mens-shirt-3-zoom.png" URL:nil];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys: @"YES", @"sale",
					 @"Available from small to x-large sizes", @"sizeDescription", @"19.99", @"price", nil];
	[menuItems addObject:item];
	
	[self.items addObject:menuItems];
	[self.sections addObject:@""];
	
	[self clothingCategory];
}

- (void)oneill4 {
	NSMutableArray *menuItems = [NSMutableArray array];
	
	ItemDetail *item = [ItemDetail itemWithText:@"Logistics Hoodie" subtitle:@"100% Cotton. Machine wash. Made in the USA. First name in water text front and O'Neill zero logo on back." imageURL:@"bundle://mens-shirt-4-zoom.png" URL:nil];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Available from small to x-large sizes", @"sizeDescription", @"59.99", @"price", nil];
	[menuItems addObject:item];
	
	[self.items addObject:menuItems];
	[self.sections addObject:@""];
	
	[self clothingCategory];
}

- (void)oneill5 {
	NSMutableArray *menuItems = [NSMutableArray array];
	
	ItemDetail *item = [ItemDetail itemWithText:@"Freedom Tee" subtitle:@"100% Cotton. Machine wash. Made in the USA. First name in water text front and O'Neill zero logo on back." imageURL:@"bundle://mens-shirt-5-zoom.png" URL:nil];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys: 
					 @"Available from small to x-large sizes", @"sizeDescription", @"29.99", @"price", nil];
	[menuItems addObject:item];
	
	[self.items addObject:menuItems];
	[self.sections addObject:@""];
	
	[self clothingCategory];
}

- (id)initWithItemId:(NSString *)itemId {
	if (self = [super init]) {
		self.sections = [NSMutableArray array];
		self.items = [NSMutableArray array];
		
		if (itemId && [itemId length]) {
			[self performSelector:NSSelectorFromString(itemId)];
		}
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
