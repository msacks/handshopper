//
//  ItemListDataSource.m
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 11/24/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "ItemListDataSource.h"
#import "ItemListItem.h"
#import "ItemListItemCell.h"

@interface ItemListDataSource (private)
- (void)clothing;
@end

@implementation ItemListDataSource

- (id)initWithCategory:(NSString *)category {
	if (self = [super init]) {
		self.sections = [NSMutableArray array];
		self.items = [NSMutableArray array];
		
		_rowCounter = 0;
		if ([category isEqualToString:@"guys-clothing"]) {
			[self clothing];
		}
		else if ([category isEqualToString:@"girls-footwear"]) {
			[self shoes];
		}
	}
	return self;
}

- (void)shoes {
	NSMutableArray *menuItems = [NSMutableArray array];
	ItemListItem *item;
	
	UIColor *selectedBackgroundColor = RGBACOLOR(107, 211, 241, 0.5);
	
	item = [ItemListItem itemWithText:@"Breezy Sandals" subtitle:@"$27.99" imageURL:@"bundle://womens-shoe-1-thumb.png" URL:@"tt://item?item_id=shoe1"];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowCounter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
	[menuItems addObject:item];
	
	item = [ItemListItem itemWithText:@"Demi Sandals" subtitle:@"$27.99" imageURL:@"bundle://womens-shoe-2-thumb.png" URL:@"tt://item?item_id=shoe2"];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowCounter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
	[menuItems addObject:item];
	
	item = [ItemListItem itemWithText:@"Lullaby Sandals" subtitle:@"$27.99" imageURL:@"bundle://womens-shoe-3-thumb.png" URL:@"tt://item?item_id=shoe3"];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowCounter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
	[menuItems addObject:item];
	
	item = [ItemListItem itemWithText:@"Rambler Sandals" subtitle:@"$27.99" imageURL:@"bundle://womens-shoe-4-thumb.png" URL:@"tt://item?item_id=shoe4"];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowCounter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", [NSNumber numberWithBool:YES], @"isNewItem", nil];
	[menuItems addObject:item];
	
	item = [ItemListItem itemWithText:@"Sugar Mama Sandals" subtitle:@"$27.99" imageURL:@"bundle://womens-shoe-5-thumb.png" URL:@"tt://item?item_id=shoe5"];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowCounter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
	[menuItems addObject:item];
	
	[self.sections addObject:@""];
	[self.items addObject:menuItems];
}

- (void)clothing {
	NSMutableArray *menuItems = [NSMutableArray array];
	ItemListItem *item;
	
	UIColor *selectedBackgroundColor = RGBACOLOR(107, 211, 241, 0.5);
	
	item = [ItemListItem itemWithText:@"O'Neill Ground Zero T-Shirt" subtitle:@"$19.99" imageURL:@"bundle://mens-shirt-1-thumb.png" URL:@"tt://item?item_id=oneill1"];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowCounter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
	[menuItems addObject:item];
	
	item = [ItemListItem itemWithText:@"O'Neill LockUp Long Sleeve Tee" subtitle:@"$29.99" imageURL:@"bundle://mens-shirt-2-thumb.png" URL:@"tt://item?item_id=oneill2"];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowCounter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
	[menuItems addObject:item];
	
	item = [ItemListItem itemWithText:@"O'Neill LockUp Tee" subtitle:@"$19.99" imageURL:@"bundle://mens-shirt-3-thumb.png" URL:@"tt://item?item_id=oneill3"];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowCounter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
	[menuItems addObject:item];
	
	item = [ItemListItem itemWithText:@"O'Neill Logistics Hoodie" subtitle:@"$59.99" imageURL:@"bundle://mens-shirt-4-thumb.png" URL:@"tt://item?item_id=oneill4"];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowCounter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", [NSNumber numberWithBool:YES], @"isNewItem", nil];
	[menuItems addObject:item];
	
	item = [ItemListItem itemWithText:@"O'Neill Freedom Tee" subtitle:@"$29.99" imageURL:@"bundle://mens-shirt-5-thumb.png" URL:@"tt://item?item_id=oneill5"];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowCounter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
	[menuItems addObject:item];
	
	[self.sections addObject:@""];
	[self.items addObject:menuItems];
}

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id) object {   
	if ([object isKindOfClass:[ItemListItem class]]) {
		return [ItemListItemCell class];
    } else {  
        return [super tableView:tableView cellClassForObject:object];  
    }  
}

@end
