//
//  ItemListItemCell.m
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


#import "ItemListItemCell.h"

#define kRowHeight 72

@implementation ItemListItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {
	if (self = [super initWithStyle:style reuseIdentifier:identifier]) {

		_dottedPattern = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, kRowHeight)] autorelease];
		_dottedPattern.image = [UIImage imageNamed:@"dotted-pattern.png"];
		[self insertSubview:_dottedPattern atIndex:0];
		
		_whiteArrow = [[[UIImageView alloc] init] autorelease];
		_whiteArrow.image = [UIImage imageNamed:@"small-white-arrow.png"];
		_whiteArrow.alpha = 0.0;
		[self addSubview:_whiteArrow];

		_newIcon = [[[UIImageView alloc] init] autorelease];
		_newIcon.image = [UIImage imageNamed:@"new-icon.png"];
		[self addSubview:_newIcon];
		
		_blackArrow = [[[UIImageView alloc] init] autorelease];
		_blackArrow.image = [UIImage imageNamed:@"small-black-arrow.png"];
		_blackArrow.alpha = 0.0;
		[self addSubview:_blackArrow];
		
		self.subtitleLabel.textColor = self.textLabel.textColor;
	}
	return self;
}

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object {
	
	return kRowHeight;  
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	CGRect newFrame = self.imageView2.frame;
	newFrame.size = CGSizeMake(96, 64);

	int row = [[_item.userInfo objectForKey:@"row"] intValue];
	if (row % 2 == 0) {
		_dottedPattern.alpha = 0.5;
	} else {
		_dottedPattern.alpha = 0.0;
	}

	newFrame.size = CGSizeMake(4, 10);
	_whiteArrow.frame = newFrame;
	_whiteArrow.center = CGPointMake(12, kRowHeight / 2);

	newFrame.size = CGSizeMake(32, 32);
	_newIcon.frame = newFrame;
	_newIcon.center = CGPointMake(66, (kRowHeight / 5) * 4);

	BOOL isNewItem = [[_item.userInfo objectForKey:@"isNewItem"] boolValue];
	_newIcon.alpha = isNewItem ? 1.0 : 0.0;

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
		_blackArrow.alpha = 1.0;
		self.backgroundColor = [_item.userInfo objectForKey:@"selectedBackgroundColor"];
	} else {
		_whiteArrow.alpha = 0.0;
		_blackArrow.alpha = 0.0;
		self.backgroundColor = [UIColor clearColor];
	}

}

@end
