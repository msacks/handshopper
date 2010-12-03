//
//  ItemDetailCell.h
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 11/09/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "Three20/Three20.h"


@interface ItemDetailCell : TTTableSubtitleItemCell {
	UIImageView *_topDottedPattern;
	UIImageView *_bottomDottedPattern;
	UIImageView *_zoomIcon;
	UIButton *_zoomButton;
	UIImageView *_blackPlusIcon;
	UIImageView *_addReviewIcons;
	UIImageView *_smallBlackArrow;
	UIImageView *_saleIcon;
	UIImageView *_calculatorIcon;
	UIImageView *_sizeQuantityLabel;
	UIImageView *_dollarIcon;
	UIImageView *_rulerIcon;
	UIButton *_buyButton;
	UILabel *_priceLabel;
	UILabel *_sizeDescriptionLabel;
}

@end
