//
//  ItemDetailImageViewer.m
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 11/21/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "ItemDetailImageViewer.h"

@implementation ItemDetailImagePhotoSource

@synthesize image = _image, title;

- (NSInteger)numberOfPhotos {
	return 1;
}

- (NSInteger)maxPhotoIndex {
	return 0;
}

- (id<TTPhoto>)photoAtIndex:(NSInteger)index {
	return _image;
}

- (void)invalidate:(BOOL)erase {
}

- (void)cancel {
}

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {
}

- (BOOL)isOutdated {
	return NO;
}

- (BOOL)isLoadingMore {
	return NO;
}

- (BOOL)isLoading {
	return NO;
}

- (BOOL)isLoaded {
	return YES;
}

- (NSMutableArray *)delegates {
	if (!_delegates) {
		_delegates = [NSMutableArray array];
	}
	return _delegates;
}

@end

@implementation ItemDetailImage

@synthesize photoSource, imageURL = _imageURL, caption, index, size;

- (NSString*)URLForVersion:(TTPhotoVersion)version {
	return _imageURL;
}

@end

@implementation ItemDetailImageViewer

- (void)loadView {
	[super loadView];
	_toolbar.alpha = 0;
}

- (TTScrollView *)scrollView {
	return _scrollView;
}

@end
