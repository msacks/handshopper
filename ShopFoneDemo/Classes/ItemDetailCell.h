//
//  ItemDetailCell.h
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
