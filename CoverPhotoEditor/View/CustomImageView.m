//
//  CustomImageView.m
//  CoverPhotoEditor
//
//  Created by Shrinivasa Bhat on 07/03/13.
//  Copyright (c) 2013 ABC. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "CustomImageView.h"
#import "ViewUtils.h"

CGFloat const minimumheight = 90.0f;
CGFloat  minimumWidth = 50.0f;


@interface CustomImageView ()
@property (nonatomic, assign) CGRect originalFrame;



@end

@implementation CustomImageView
-(id)init
{
	if ((self = [super init]))
	{
		[self initializeAttributes];
	}
	return self;
}

-(id)initWithCoder:(NSCoder*)aDecoder
{
	if ((self = [super initWithCoder:aDecoder]))
	{
		[self initializeAttributes];
	}
	return self;
}

-(id)initWithFrame:(CGRect)frame
{
	if ((self = [super initWithFrame:frame]))
	{
		[self initializeAttributes];
	}
	return self;
}

-(id)initWithImage:(UIImage*)image
{
	if ((self = [super initWithImage:image]))
	{
		[self initializeAttributes];
	}
	return self;
}


-(void)initializeAttributes
{
    
    self.originalFrame = self.frame;
    minimumWidth = (self.width * minimumheight) / self.height;
    
    //Longpress gesture to edit the image
    NSLog(@" GestureRecognizer added");
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressEvent:)];
    longPressGesture.minimumPressDuration = 1.5;
    [self addGestureRecognizer:longPressGesture];
    
    //pinch gesture for zoom the image view:
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchGestureEvent:)];
    [self addGestureRecognizer:pinchGesture];
   
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateGestureEvent:)];
    [self addGestureRecognizer:rotationGesture];
}

-(void)longPressEvent:(UILongPressGestureRecognizer *)longPressGestureRecognizer
{
    switch (longPressGestureRecognizer.state)
    {
        case UIGestureRecognizerStateBegan:
               NSLog(@"long press began");
            break;
       
        case UIGestureRecognizerStateEnded:
               NSLog(@"long press ended");
            break;
        default:
            break;
    }
}

-(void)pinchGestureEvent:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{

    NSLog(@"pinch gesture");
    CGRect zoomRect;
    CGFloat scale = pinchGestureRecognizer.scale;
    // The zoom rect is in the content view's coordinates.
    // At a zoom scale of 1.0, it would be the size of the
    // imageScrollView's bounds.
    // As the zoom scale decreases, so more content is visible,
    // the size of the rect grows.
//    CGFloat newHeight =  self.height * scale;
//    CGFloat newWidth =  self.width * scale;
//    zoomRect.size.height =  minimumheight > newHeight ? minimumheight : newHeight;
//    zoomRect.size.width  = minimumWidth > newWidth ? minimumWidth : newWidth;
//    
//    // choose an origin so as to get the right center.
//    zoomRect.origin.x = self.center.x - (zoomRect.size.width  / 2.0);
//    zoomRect.origin.y = self.center.y - (zoomRect.size.height / 2.0);
    CGAffineTransform currentTransform = self.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    
    [self setTransform:newTransform];
    [pinchGestureRecognizer setScale:1 ];
    self.frame = zoomRect;

}
- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        UIView *piece = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }
}
- (void)rotateGestureEvent:(UIRotationGestureRecognizer *)gestureRecognizer {
    NSLog(@"rotate  gesture");

    [self adjustAnchorPointForGestureRecognizer:gestureRecognizer];
    
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || [gestureRecognizer state] == UIGestureRecognizerStateChanged) {
        [gestureRecognizer view].transform = CGAffineTransformRotate([[gestureRecognizer view] transform], [gestureRecognizer rotation]);
        [gestureRecognizer setRotation:0];
    }
}

@end
