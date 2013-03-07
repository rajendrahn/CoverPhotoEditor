//
//  EditOptionView.m
//  CoverPhotoEditor
//
//  Created by Sahana Kini on 07/03/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import "EditOptionView.h"

const float kImagesize = 60.0f;
const float kFontSize = 12.0f;

@interface EditOptionView ()

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, weak) id delegate;

@end

@implementation EditOptionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithEditOptionName:(NSString *)optionName imageName:(NSString *)imageName identifier:(NSNumber *) identifier delegate:(id <EditOptionViewDelegate>) delegate
{
    self = [super init];
    
    if (self)
    {
        float optionNameWidth = [optionName sizeWithFont:[UIFont systemFontOfSize:kFontSize]].width;
        self.frame = CGRectMake(0.0f, 0.0f, MAX(optionNameWidth, kImagesize) + 40.0f, 100.0f);
        
        UIButton *optionButton = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.frame) - kImagesize) * 0.5f, 20.0f, kImagesize, kImagesize)];
        [optionButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [optionButton addTarget:self action:@selector(optionButtonTapped:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:optionButton];
        
        UILabel *optionNameLabel = [[UILabel alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.frame) - optionNameWidth) * 0.5f, 80.0f, optionNameWidth, 20.0f)];
        optionNameLabel.font = [UIFont systemFontOfSize:kFontSize];
        optionNameLabel.text = optionName;
        [self addSubview:optionNameLabel];
        
        _identifier = identifier;
        _delegate = delegate;
        
    }
    
    return self;
}

- (void)optionButtonTapped:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(editOptionView:didSelectOptionWithIdentifier:)])
    {
        [self.delegate performSelector:@selector(editOptionView:didSelectOptionWithIdentifier:) withObject:self withObject:self.identifier];
    }
}

@end
