//
//  EditOptionScrollView.m
//  CoverPhotoEditor
//
//  Created by Sahana Kini on 08/03/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import "EditOptionScrollView.h"

@interface EditOptionScrollView ()

@property (nonatomic, assign) int numOfItems;
@property (nonatomic, assign) float itemSpacing;
@property (nonatomic, strong) NSMutableArray *itemArray;

@end

@implementation EditOptionScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
}

 - (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
    }
    return self;
}

- (void)configureSubViewFrames
{
    int index = 0;
    float scrollViewContentWidth = 0.0 ;
    for (UIView *subView in self.itemArray)
    {
        float itemWidth = CGRectGetWidth(subView.frame);
        CGRect frame = subView.frame;
        frame.origin.x = scrollViewContentWidth + self.itemSpacing;
        frame.origin.y = (CGRectGetHeight(self.frame) - CGRectGetHeight(subView.frame)) * 0.5;
        subView.frame = frame;
        scrollViewContentWidth += itemWidth + self.itemSpacing;
        index ++;
        [self addSubview:subView];
    }
    
    self.contentSize = CGSizeMake(scrollViewContentWidth, CGRectGetHeight(self.frame));
}

#pragma mark - Public Method

- (NSArray *)items
{
    return [NSArray arrayWithArray:self.itemArray];
}

- (void)reloadData
{
    if (self.editOptionScrollViewDataSource && [self.editOptionScrollViewDataSource respondsToSelector:@selector(numberOfItemInEditOptionScrollView:)])
    {
        self.numOfItems = [self.editOptionScrollViewDataSource numberOfItemInEditOptionScrollView:self];
    }
    
    self.itemArray = [NSMutableArray arrayWithCapacity:self.numOfItems];
    
    if (self.editOptionScrollViewDataSource && [self.editOptionScrollViewDataSource respondsToSelector:@selector(editOptionScrolView:itemAtIndex:)])
    {
        for (int index = 0; index < self.numOfItems; index ++)
        {
            [self.itemArray addObject:[self.editOptionScrollViewDataSource editOptionScrolView:self itemAtIndex:index]];
        }
    }
    
    if (self.editOptionScrollViewDelegate && [self.editOptionScrollViewDelegate respondsToSelector:@selector(itemSpacingInEditOptionScrollView:)])
    {
        self.itemSpacing = [self.editOptionScrollViewDelegate itemSpacingInEditOptionScrollView:self];
    }
    
    [self configureSubViewFrames];
}

@end
