//
//  HomeiCarousalCellView.m
//  CoverPhotoEditor
//
//  Created by Rajendra HN on 08/03/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import "HomeiCarousalCellView.h"

@interface HomeiCarousalCellView ()

@property (weak, nonatomic) IBOutlet UILabel *templateNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *exampleImageView;

@end

@implementation HomeiCarousalCellView

- (void)setPhotoTemplate:(CoverPhotoTemplate *)photoTemplate
{
    _photoTemplate = photoTemplate;
    self.templateNameLabel.text = _photoTemplate.name;
    self.exampleImageView.image = _photoTemplate.exampleImage;
}

@end
