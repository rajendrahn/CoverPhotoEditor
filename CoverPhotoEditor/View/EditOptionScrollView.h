//
//  EditOptionScrollView.h
//  CoverPhotoEditor
//
//  Created by Sahana Kini on 08/03/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditOptionScrollView;

@protocol EditOptionScrollViewDataSource <NSObject>

- (int)numberOfItemInEditOptionScrollView:(EditOptionScrollView *)scrollView;
- (UIView *)editOptionScrolView:(EditOptionScrollView *)scrollView itemAtIndex:(int)index;

@end

@protocol EditOptionScrollViewDelegate <NSObject>

- (float)itemSpacingInEditOptionScrollView:(EditOptionScrollView *)scrollView;

@end

@interface EditOptionScrollView : UIScrollView

@property (nonatomic, weak) id<EditOptionScrollViewDataSource> editOptionScrollViewDataSource;
@property (nonatomic, weak) id<EditOptionScrollViewDelegate> editOptionScrollViewDelegate;

@property (nonatomic, assign, readonly) int numOfItems;
@property (nonatomic, strong, readonly) NSArray *items;
@property (nonatomic, assign, readonly) float itemSpacing;

- (void)reloadData;

@end
