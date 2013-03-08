//
//  CoverPhotoTemplate.m
//  CoverPhotoEditor
//
//  Created by Rajendra HN on 08/03/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import "CoverPhotoTemplate.h"

@implementation CoverPhotoTemplate

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        _name = dictionary[@"name"];
        _templateId = dictionary[@"templateId"];
    }
    return self;
}

- (NSString *)resourceDirectory
{
    return [@"Templates" stringByAppendingPathComponent:self.templateId];
}

- (UIImage *)exampleImage
{
    return [UIImage imageNamed:[[self resourceDirectory] stringByAppendingPathComponent:@"exampleImage"]];
}

+ (NSArray *)coverPhotoTemplates
{
    static NSArray *coverPhotoTemplates;
    
    if (!coverPhotoTemplates)
    {
        NSArray *arrayOfData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CoverPhotoTemplates"
                                                                                                ofType:@"plist"]];
        coverPhotoTemplates = [NSMutableArray arrayWithCapacity:arrayOfData.count];
        for (NSDictionary *templateData in arrayOfData)
        {
            CoverPhotoTemplate *newTemplate = [[CoverPhotoTemplate alloc] initWithDictionary:templateData];
            [((NSMutableArray *)coverPhotoTemplates) addObject:newTemplate];
        }
    }
    
    return coverPhotoTemplates;
}

@end
