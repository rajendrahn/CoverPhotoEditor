//
//  PhotoEditorViewController.h
//  CoverPhotoEditor
//
//  Created by Sahana Kini on 07/03/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^photoEditorCompletionHandler)(UIImage *image);

@interface PhotoEditorViewController : UIViewController

- (id)initWithImage:(UIImage *)image completionHandler:(photoEditorCompletionHandler)handler;

@end
