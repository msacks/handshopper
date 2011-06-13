//
//  CategoriesItemCell.m
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


#import "CategoriesItemCell.h"

#define kRowHeight 72

@implementation CategoriesItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {
	if (self = [super initWithStyle:style reuseIdentifier:identifier]) {

		_dottedPattern = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, kRowHeight)] autorelease];
		_dottedPattern.image = [UIImage imageNamed:@"dotted-pattern.png"];
		[self addSubview: _dottedPattern];
		
		_whiteArrow = [[[UIImageView alloc] init] autorelease];
		_whiteArrow.image = [UIImage imageNamed:@"small-white-arrow.png"];
		_whiteArrow.alpha = 0.0;
		[self addSubview:_whiteArrow];

		_categoryIconCircle = [[[UIImageView alloc] init] autorelease];
		_categoryIconCircle.image = [UIImage imageNamed:@"black-circle.png"];
		_categoryIconCircle.alpha = 0.0;
		[self addSubview:_categoryIconCircle];
		
		_categoryIcon = [[[UIImageView alloc] init] autorelease];
		_categoryIcon.alpha = 0.0;
		[self addSubview:_categoryIcon];
		
		_plusCircle = [[[UIImageView alloc] init] autorelease];
		_plusCircle.image = _categoryIconCircle.image;
		_plusCircle.alpha = 0.0;
		[self addSubview:_plusCircle];
		
		_plusIcon = [[[UIImageView alloc] init] autorelease];
		_plusIcon.image = [UIImage imageNamed:@"plus-icon.png"];
		_plusIcon.alpha = 0.0;
		[self addSubview:_plusIcon];
		
		_newIcon = [[[UIImageView alloc] init] autorelease];
		_newIcon.image = [UIImage imageNamed:@"new-icon.png"];
		[self addSubview:_newIcon];
		
		_blackCircle_small = [[[UIImageView alloc] init] autorelease];
		_blackCircle_small.image = _categoryIconCircle.image;
		_blackCircle_small.alpha = 1.0;
		[self addSubview:_blackCircle_small];
		
		_shirtIcon = [[[UIImageView alloc] init] autorelease];
		_shirtIcon.image = [UIImage imageNamed:@"shirt-icon.png"];
		[self addSubview:_shirtIcon];
		
		_blackArrow = [[[UIImageView alloc] init] autorelease];
		_blackArrow.image = [UIImage imageNamed:@"small-black-arrow.png"];
		_blackArrow.alpha = 0.0;
		[self addSubview:_blackArrow];
	}
	return self;
}

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object {
	
	return kRowHeight;  
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	CGRect newFrame = self.imageView2.frame;
	newFrame.size = CGSizeMake(156, 33);
	self.imageView2.frame = newFrame;
	if (self.selected) {
		self.imageView2.center = CGPointMake(150, kRowHeight / 2);
	} else {
		self.imageView2.center = CGPointMake(110, kRowHeight / 2);
	}

	int row = [[_item.userInfo objectForKey:@"row"] intValue];
	if (row % 2 == 0) {
		_dottedPattern.alpha = 0.5;
	} else {
		_dottedPattern.alpha = 0.0;
	}

	newFrame.size = CGSizeMake(4, 10);
	_whiteArrow.frame = newFrame;
	_whiteArrow.center = CGPointMake(12, kRowHeight / 2);

	newFrame.size = CGSizeMake(40, 40);
	_categoryIconCircle.frame = newFrame;
	_categoryIconCircle.center = CGPointMake(36, kRowHeight / 2);

	newFrame.size = CGSizeMake(28, 28);
	_categoryIcon.frame = newFrame;
	_categoryIcon.center = CGPointMake(36, kRowHeight / 2);
	NSString *categoryImageName = [_item.userInfo objectForKey:@"categoryImageName"];
	_categoryIcon.image = [UIImage imageNamed:categoryImageName];
	
	newFrame.size = CGSizeMake(20, 20);
	_plusCircle.frame = newFrame;
	_plusCircle.center = CGPointMake(62, (kRowHeight / 9) * 2);
	
	newFrame.size = CGSizeMake(10, 10);
	_plusIcon.frame = newFrame;
	_plusIcon.center = CGPointMake(62, (kRowHeight / 9) * 2);
	
	newFrame.size = CGSizeMake(40, 40);
	_newIcon.frame = newFrame;
	if (self.selected) {
		_newIcon.center = CGPointMake(280, kRowHeight / 2);
	} else {
		_newIcon.center = CGPointMake(240, kRowHeight / 2);
	}

	BOOL isNewItem = [[_item.userInfo objectForKey:@"isNewItem"] boolValue];
	_newIcon.alpha = isNewItem ? 1.0 : 0.0;

	newFrame.size = CGSizeMake(20, 20);
	_blackCircle_small.frame = newFrame;
	_blackCircle_small.center = CGPointMake(288, kRowHeight / 2);
	
	newFrame.size = CGSizeMake(10, 10);
	_shirtIcon.frame = newFrame;
	_shirtIcon.center = CGPointMake(288, kRowHeight / 2);
	
	newFrame.size = CGSizeMake(4, 10);
	_blackArrow.frame = newFrame;
	_blackArrow.center = CGPointMake(304, kRowHeight / 2);

	self.accessoryType = UITableViewCellAccessoryNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated 
{
	[super setSelected:selected animated:animated];   
	self.selectedBackgroundView.alpha = 0.0;
	if (selected == YES) {
		_whiteArrow.alpha = 1.0;
		_categoryIconCircle.alpha = 1.0;
		_categoryIcon.alpha = 1.0;
		_plusCircle.alpha = 1.0;
		_plusIcon.alpha = 1.0;
		_blackArrow.alpha = 1.0;
		_blackCircle_small.alpha = 0.0;
		_shirtIcon.alpha = 0.0;
		self.backgroundColor = [_item.userInfo objectForKey:@"selectedBackgroundColor"];
	} else {
		_whiteArrow.alpha = 0.0;
		_categoryIconCircle.alpha = 0.0;
		_categoryIcon.alpha = 0.0;
		_plusCircle.alpha = 0.0;
		_plusIcon.alpha = 0.0;
		_blackArrow.alpha = 0.0;
		_blackCircle_small.alpha = 1.0;
		_shirtIcon.alpha = 1.0;
		self.backgroundColor = [UIColor clearColor];
	}

}

@end
