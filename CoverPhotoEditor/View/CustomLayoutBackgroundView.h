//
//  CustomLayoutBackgroundView.h
//  CoverPhotoEditor
//
//  Created by Shrinivasa Bhat on 08/03/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomImageView.h"


@interface CustomLayoutBackgroundView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *templateImageView;
@property (weak, nonatomic) IBOutlet CustomImageView *profileImageView;

@end
