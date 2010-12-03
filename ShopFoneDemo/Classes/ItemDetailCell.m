//
//  ItemDetailCell.m
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 11/09/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "ItemDetailCell.h"
#import "Three20UI/Three20UI+Additions.h"

@interface Stylesheet : NSObject

@end

@implementation Stylesheet

#define kTextLabelFontSize 28
#define kTextLabelLines 2
+ (UIFont *)textLabelFont {
	return [UIFont fontWithName:@"Verdana" size:kTextLabelFontSize];
}

#define kSubtitleLabelFontSize 9
#define kSubtitleLabelLines 8
+ (UIFont *)subtitleLabelFont {
	return [UIFont fontWithName:@"Helvetica" size:kSubtitleLabelFontSize];
}

#define kPriceLabelFontSize 36
+ (UIFont *)priceLabelFont {
	return [UIFont fontWithName:@"Verdana" size:kPriceLabelFontSize];
}

#define kSizeDescriptionFontSize 11
#define kSizeDescriptionLines 2
+ (UIFont *)sizeDescriptionFont {
	return [UIFont fontWithName:@"Helvetica" size:kSizeDescriptionFontSize];
}

@end

@implementation ItemDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {
	if (self = [super initWithStyle:style reuseIdentifier:identifier]) {

		_zoomIcon = [[[UIImageView alloc] initWithFrame:CGRectMake(6, 36, 12, 12)] autorelease];
		_zoomIcon.image = [UIImage imageNamed:@"circled-plus-icon.png"];
		[self addSubview:_zoomIcon];
		
		_zoomButton = [UIButton buttonWithType:UIButtonTypeCustom];
		_zoomButton.frame = CGRectMake(0, 30, 24, 24);
		[_zoomButton addTarget:self action:@selector(zoomItemImage) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:_zoomButton];
		
		_blackPlusIcon = [[[UIImageView alloc] initWithFrame:CGRectMake(120, 82, 12, 12)] autorelease];
		_blackPlusIcon.image = [UIImage imageNamed:@"black-plus-icon.png"];
		[self addSubview:_blackPlusIcon];
		
		_addReviewIcons = [[[UIImageView alloc] initWithFrame:CGRectMake(130, 92, 100, 20)] autorelease];
		_addReviewIcons.image = [UIImage imageNamed:@"add-review-icons.png"];
		[self addSubview:_addReviewIcons];
		
		_smallBlackArrow = [[[UIImageView alloc] initWithFrame:CGRectMake(300, 80, 12, 34)] autorelease];
		_smallBlackArrow.image = [UIImage imageNamed:@"small-right-arrow.png"];
		[self addSubview:_smallBlackArrow];
		
		_saleIcon = [[[UIImageView alloc] initWithFrame:CGRectMake(96, 184, 32, 32)] autorelease];
		_saleIcon.image = [UIImage imageNamed:@"sale-icon.png"];
		[self addSubview:_saleIcon];
		
		_calculatorIcon = [[[UIImageView alloc] initWithFrame:CGRectMake(132, 100, 24, 24)] autorelease];
		_calculatorIcon.image = [UIImage imageNamed:@"calculator-icon.png"];
		[self addSubview:_calculatorIcon];

		_sizeQuantityLabel = [[[UIImageView alloc] initWithFrame:CGRectMake(160, 100, 54, 32)] autorelease];
		_sizeQuantityLabel.image = [UIImage imageNamed:@"size-quantity-label.png"];
		[self addSubview:_sizeQuantityLabel];
		
		_dollarIcon = [[[UIImageView alloc] initWithFrame:CGRectMake(220, 100, 32, 32)] autorelease];
		_dollarIcon.image = [UIImage imageNamed:@"dollar-icon.png"];
		[self addSubview:_dollarIcon];
		
		_priceLabel = [[[UILabel alloc] initWithFrame:CGRectMake(250, 100, 80, 60)] autorelease];
		_priceLabel.font = [Stylesheet priceLabelFont];
		_priceLabel.minimumFontSize = kPriceLabelFontSize;
		_priceLabel.backgroundColor = [UIColor clearColor];
		[self addSubview:_priceLabel];
		
		_rulerIcon = [[[UIImageView alloc] initWithFrame:CGRectMake(6, 100, 10, 30)] autorelease];
		_rulerIcon.image = [UIImage imageNamed:@"ruler-icon.png"];
		[self addSubview:_rulerIcon];
		
		_sizeDescriptionLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 100, 180, 40)] autorelease];
		_sizeDescriptionLabel.font = [Stylesheet sizeDescriptionFont];
		_sizeDescriptionLabel.minimumFontSize = kSizeDescriptionFontSize;
		_sizeDescriptionLabel.numberOfLines = kSizeDescriptionLines;
		_sizeDescriptionLabel.backgroundColor = [UIColor clearColor];
		[self addSubview:_sizeDescriptionLabel];
		
		_buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
		_buyButton.frame = CGRectMake(220, 100, 91, 50);
		[_buyButton setImage:[UIImage imageNamed:@"buy-icon.png"] forState:UIControlStateNormal];
		[_buyButton addTarget:self action:@selector(goToCheckOut) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:_buyButton];
		
		_topDottedPattern = [[[UIImageView alloc] initWithFrame:CGRectMake(0, -30, 320, 61)] autorelease];
		_topDottedPattern.image = [UIImage imageNamed:@"dotted-pattern.png"];
		_topDottedPattern.alpha = 0.5;
		[self insertSubview:_topDottedPattern atIndex:0];
		
		_bottomDottedPattern = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 220, 320, 61)] autorelease];
		_bottomDottedPattern.image = [UIImage imageNamed:@"dotted-pattern.png"];
		_bottomDottedPattern.alpha = 0.5;
		[self insertSubview:_bottomDottedPattern atIndex:0];
	}
	return self;
}

- (void)zoomItemImage {
	TTOpenURL(@"tt://zoom");
}

- (void)goToCheckOut {
	TTOpenURL(@"tt://check-out");
}

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object {
	int rowHeight = 30; // top dotted pattern height
	UIFont *font = [Stylesheet textLabelFont];
	CGSize size = [((TTTableSubtitleItem *)object).text sizeWithFont:font
								  constrainedToSize:CGSizeMake(200, font.lineHeight * kTextLabelLines) lineBreakMode:UILineBreakModeWordWrap];
	rowHeight += size.height;
	
	font = [Stylesheet subtitleLabelFont];
	size = [((TTTableSubtitleItem *)object).subtitle sizeWithFont:font
								   constrainedToSize:CGSizeMake(180, font.lineHeight * kSubtitleLabelLines) lineBreakMode:UILineBreakModeWordWrap];
	rowHeight += size.height;
	
	rowHeight += 32; // size quantity label
	
	rowHeight += 61; // bottom dotted pattern
	
	rowHeight += 32; // misc padding

	return rowHeight;  
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	self.imageView2.frame = CGRectMake(10, 30, 106, 186);

	self.backgroundColor = RGBACOLOR(190, 211, 232, 0.75);

	CGRect newFrame = CGRectMake(124, 20, 200, 70);
	UIFont *font = [Stylesheet textLabelFont];
	newFrame.size = [self.textLabel.text sizeWithFont:font
									constrainedToSize:CGSizeMake(200, font.lineHeight * kTextLabelLines) lineBreakMode:UILineBreakModeWordWrap];
	self.textLabel.frame = newFrame;
	self.textLabel.font = font;
	self.textLabel.minimumFontSize = kTextLabelFontSize;
	self.textLabel.numberOfLines = kTextLabelLines;
	self.textLabel.lineBreakMode = UILineBreakModeWordWrap;
	self.textLabel.backgroundColor = [UIColor clearColor];

	_blackPlusIcon.center = CGPointMake(_blackPlusIcon.center.x, self.textLabel.bottom - 2);
	_addReviewIcons.center = CGPointMake(_addReviewIcons.center.x, self.textLabel.bottom + 10);
	_smallBlackArrow.center = CGPointMake(_smallBlackArrow.center.x, self.textLabel.bottom + 8);

	newFrame = CGRectMake(124, _addReviewIcons.bottom + 4, 180, 80);
	font = [Stylesheet subtitleLabelFont];
	newFrame.size = [self.subtitleLabel.text sizeWithFont:font
									constrainedToSize:CGSizeMake(180, font.lineHeight * kSubtitleLabelLines) lineBreakMode:UILineBreakModeWordWrap];
	newFrame.size.width = 180;
	self.subtitleLabel.frame = newFrame;
	self.subtitleLabel.font = font;
	self.subtitleLabel.minimumFontSize = kSubtitleLabelFontSize;
	self.subtitleLabel.numberOfLines = kSubtitleLabelLines;
	self.subtitleLabel.lineBreakMode = UILineBreakModeWordWrap;
	self.subtitleLabel.backgroundColor = [UIColor clearColor];

	_saleIcon.center = CGPointMake(_saleIcon.center.x, self.subtitleLabel.bottom + 26);
	_calculatorIcon.center = CGPointMake(_calculatorIcon.center.x, self.subtitleLabel.bottom + 26);
	_sizeQuantityLabel.center = CGPointMake(_sizeQuantityLabel.center.x, self.subtitleLabel.bottom + 26);
	_dollarIcon.center = CGPointMake(_dollarIcon.center.x, self.subtitleLabel.bottom + 24);
	_priceLabel.center = CGPointMake(_priceLabel.center.x, self.subtitleLabel.bottom + 22);

	int y = _sizeQuantityLabel.bottom > self.imageView2.bottom ? _sizeQuantityLabel.bottom + 20 : self.imageView2.bottom + 20;

	_rulerIcon.center = CGPointMake(_rulerIcon.center.x, y + 10);
	_sizeDescriptionLabel.center = CGPointMake(_sizeDescriptionLabel.center.x, y + 10);
	_buyButton.center = CGPointMake(_buyButton.center.x, y + 16);
	_bottomDottedPattern.center = CGPointMake(_bottomDottedPattern.center.x, y + 20);
	
	self.accessoryType = UITableViewCellAccessoryNone;
}

- (void)setObject:(id)object {  
    if (_item != object) {
		
        [super setObject:object];

		_saleIcon.alpha = [_item.userInfo objectForKey:@"sale"] ? 1 : 0;
		_priceLabel.text = [_item.userInfo objectForKey:@"price"];
		_sizeDescriptionLabel.text = [_item.userInfo objectForKey:@"sizeDescription"];
	}
}

@end
