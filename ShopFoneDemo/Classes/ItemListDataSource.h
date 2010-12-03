//
//  ItemListDataSource.h
//  ShopFoneDemo
//
//  Created by PJ Cabrera on 11/24/10.
//  Copyright 2010 PJ Cabrera. All rights reserved.
//

#import "Three20/Three20.h"


@interface ItemListDataSource : TTSectionedDataSource {
	int _rowCounter;
}

- (id)initWithCategory:(NSString *)category;

@end
