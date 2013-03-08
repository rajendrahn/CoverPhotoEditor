//
//  CustomImageView.h
//  CoverPhotoEditor
//
//  Created by Shrinivasa Bhat on 07/03/13.
//  Copyright (c) 2013 ABC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CustomImageViewProtocol <NSObject>

-(void) longPressGestureFired:(UILongPressGestureRecognizer *) gesture;
-(void) pinchGestureFired:(UIPinchGestureRecognizer *) gesture;
@end


@interface CustomImageView : UIImageView

@property (nonatomic, weak) id<CustomImageViewProtocol> delegate;
@end
