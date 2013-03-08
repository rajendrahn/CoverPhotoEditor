//
//  CoverPhotoTemplate.h
//  CoverPhotoEditor
//
//  Created by Rajendra HN on 08/03/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoverPhotoTemplate : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *templateId;
@property (nonatomic, strong, readonly) UIImage *exampleImage;

//returns all the coverPhotoTemplates
+ (NSArray *)coverPhotoTemplates;

@end
