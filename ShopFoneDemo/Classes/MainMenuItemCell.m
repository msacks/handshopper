//
//  MainMenuItemCell.m
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 10/20/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "MainMenuItemCell.h"


@implementation MainMenuItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {
	if (self = [super initWithStyle:style reuseIdentifier:identifier]) {
		_whiteArrow = [[[UIImageView alloc] init] autorelease];
		_whiteArrow.image = [UIImage imageNamed:@"small-white-arrow.png"];
		_whiteArrow.alpha = 0.0;
		[self addSubview:_whiteArrow];

		_checkmark = [[[UIImageView alloc] init] autorelease];
		_checkmark.image = [UIImage imageNamed:@"circled-checkmark.png"];
		_checkmark.alpha = 0.0;
		[self addSubview:_checkmark];

		_blackArrow = [[[UIImageView alloc] init] autorelease];
		_blackArrow.image = [UIImage imageNamed:@"small-black-arrow.png"];
		_blackArrow.alpha = 0.0;
		[self addSubview:_blackArrow];
	}
	return self;
}

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object {
	
	return 72;  
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	CGRect newFrame = self.imageView2.frame;
	newFrame.origin = CGPointMake(184, 6);
	newFrame.size = CGSizeMake(128, 62);
	self.imageView2.frame = newFrame;

	newFrame.size = CGSizeMake(4, 10);
	_whiteArrow.frame = newFrame;
	_whiteArrow.center = CGPointMake(16, 72 / 2);

	newFrame.size = CGSizeMake(32, 32);
	_checkmark.frame = newFrame;
	_checkmark.center = CGPointMake(246, (72 / 2) - (32 / 2) );

	newFrame.size = CGSizeMake(4, 10);
	_blackArrow.frame = newFrame;
	_blackArrow.center = CGPointMake(266, (72 / 2) - (32 / 2) - 2);
	
	self.accessoryType = UITableViewCellAccessoryNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated 
{
	[super setSelected:selected animated:animated];   
	if (selected == YES) {
		_whiteArrow.alpha = 1.0;
		_checkmark.alpha = 1.0;
		_blackArrow.alpha = 1.0;
		self.selectedBackgroundView.alpha = 0.0;
		self.backgroundColor = RGBACOLOR(107, 211, 241, 0.5);
	} else {
		_whiteArrow.alpha = 0.0;
		_checkmark.alpha = 0.0;
		_blackArrow.alpha = 0.0;
		self.selectedBackgroundView.alpha = 1.0;
		self.backgroundColor = [UIColor clearColor];
	}

}

@end
