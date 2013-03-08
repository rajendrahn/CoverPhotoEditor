//
//  EditOptionView.h
//  CoverPhotoEditor
//
//  Created by Sahana Kini on 07/03/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditOptionView;

@protocol EditOptionViewDelegate

- (void)editOptionView:(EditOptionView *)editOptionView didSelectOptionWithName:(NSString *) name;

@end

@interface EditOptionView : UIView


- (id)initWithEditOptionName:(NSString *)optionName imageName:(NSString *)imageName delegate:(id <EditOptionViewDelegate>) delegate;

@end
