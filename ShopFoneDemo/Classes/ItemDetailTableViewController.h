//
//  ItemDetailTableViewController.h
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 11/09/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "Three20/Three20.h"
#import "BaseTableViewController.h"

#import "ItemDetailImageViewer.h"

@interface ItemDetailTableViewController : BaseTableViewController {
	NSString *_itemId;
	NSString *_zoomImageURL;
	ItemDetailImage *_photo;
	ItemDetailImagePhotoSource *_photoSource;
	UIView *_lightboxBackground;
	UIView *_lightbox;
	ItemDetailImageViewer *_viewer;
	UIButton *_closeButton;
}

@end
