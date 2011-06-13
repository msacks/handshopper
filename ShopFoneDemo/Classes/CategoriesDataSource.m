//
//  CategoriesDataSource.m
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

#import "CategoriesDataSource.h"
#import "CategoriesItem.h"
#import "CategoriesItemCell.h"

@implementation CategoriesDataSource

- (id)initWithGender:(NSString *)gender {
	if (self = [super init]) {
		UIColor *selectedBackgroundColor;

		if ([gender isEqualToString:@"girls"]) {
			selectedBackgroundColor = RGBACOLOR(134, 72, 97, 0.5);
		} else {
			selectedBackgroundColor = RGBACOLOR(242, 210, 0, 0.5);
		}

		self.sections = [NSArray arrayWithObject:@""];
		self.items = [NSMutableArray array];
		
		int counter = 0;
		NSMutableArray *menuItems = [NSMutableArray array];
		CategoriesItem *item;
		
		item = [CategoriesItem itemWithText:nil subtitle:nil imageURL:@"bundle://surfboards-menu-item.png" URL:@"tt://items?category=surfboards"];
		item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"large-surfboard-icon.png",@"categoryImageName", [NSNumber numberWithInt:counter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
		[menuItems addObject:item];
		
		item = [CategoriesItem itemWithText:nil subtitle:nil imageURL:@"bundle://clothing-menu-item.png" URL:[NSString stringWithFormat:@"tt://items?category=%@-clothing", gender]];
		item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"large-swimtrunks-icon.png",@"categoryImageName", [NSNumber numberWithInt:counter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
		[menuItems addObject:item];
		
		item = [CategoriesItem itemWithText:nil subtitle:nil imageURL:@"bundle://wetsuits-menu-item.png" URL:[NSString stringWithFormat:@"tt://items?category=%@-wetsuits", gender]];
		item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"large-surfboard-icon.png",@"categoryImageName", [NSNumber numberWithInt:counter++], @"row", nil];
		[menuItems addObject:item];
		
		item = [CategoriesItem itemWithText:nil subtitle:nil imageURL:@"bundle://swimwear-menu-item.png" URL:[NSString stringWithFormat:@"tt://items?category=%@-swimwear", gender]];
		item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"large-swimtrunks-icon.png",@"categoryImageName", [NSNumber numberWithBool:YES], @"isNewItem", [NSNumber numberWithInt:counter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
		[menuItems addObject:item];
		
		item = [CategoriesItem itemWithText:nil subtitle:nil imageURL:@"bundle://footwear-menu-item.png" URL:[NSString stringWithFormat:@"tt://items?category=%@-footwear", gender]];
		item.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"large-surfboard-icon.png",@"categoryImageName", [NSNumber numberWithInt:counter++], @"row", selectedBackgroundColor, @"selectedBackgroundColor", nil];
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

- (void)dealloc {
	[_gender release];
	[super dealloc];
}

@end
