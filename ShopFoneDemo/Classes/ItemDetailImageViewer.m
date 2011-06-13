//
//  ItemDetailImageViewer.m
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
