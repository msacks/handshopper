//
//  ItemDetailImageViewer.h
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 11/21/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "Three20/Three20.h"

@interface ItemDetailImagePhotoSource : NSObject <TTPhotoSource>
{
	id<TTPhoto> _image;
	NSMutableArray *_delegates;
}

@property (nonatomic, assign) id<TTPhoto> image;

@end

@interface ItemDetailImage : NSObject <TTPhoto>
{
	NSString *_imageURL;
}

@property (nonatomic, assign) NSString *imageURL;

@end

@interface ItemDetailImageViewer : TTPhotoViewController {
}

- (TTScrollView *)scrollView;
- (void)loadImages;

@end
