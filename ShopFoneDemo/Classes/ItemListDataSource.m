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
		if ([category isEqualToString:@"clothing"]) {
			[self clothing];
		} else {
			[self clothing];
		}
	}
	return self;
}

- (void)clothing {
	NSMutableArray *menuItems = [NSMutableArray array];
	ItemListItem *item;

	UIColor *selectedBackgroundColor = RGBACOLOR(242, 210, 0, 0.5);

	item = [ItemListItem itemWithText:@"Element Hoodies" subtitle:@"$27.99" imageURL:@"bundle://clothing-logo-element.png" URL:@"tt://item?item_id=element-hoodies"];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowCounter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
	[menuItems addObject:item];
	
	item = [ItemListItem itemWithText:@"Real Tees" subtitle:@"$24.99" imageURL:@"bundle://clothing-logo-real.png" URL:@"tt://item?item_id=real-tees"];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowCounter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
	[menuItems addObject:item];
	
	item = [ItemListItem itemWithText:@"Brixton Hats" subtitle:@"$18.99" imageURL:@"bundle://clothing-logo-brixton.png" URL:@"tt://item?item_id=brixton-hats"];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowCounter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
	[menuItems addObject:item];
	
	item = [ItemListItem itemWithText:@"RVCA Tees" subtitle:@"$20.99" imageURL:@"bundle://clothing-logo-rcva.png" URL:@"tt://item?item_id=rvca-tees"];
	item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowCounter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", [NSNumber numberWithBool:YES], @"isNewItem", nil];
	[menuItems addObject:item];
	
	item = [ItemListItem itemWithText:@"Krooked Sweatshirts" subtitle:@"$27.99" imageURL:@"bundle://clothing-logo-krooked.png" URL:@"tt://item?item_id=krooked-sweats"];
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
