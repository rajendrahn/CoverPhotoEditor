//
//  ViewController.m
//  CoverPhotoEditor
//
//  Created by Rajendra HN on 07/03/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import "HomeViewController.h"
#import "iCarousel.h"
#import "CoverPhotoTemplate.h"
#import "HomeiCarousalCellView.h"

@interface HomeViewController () <iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, strong) NSArray *coverPhotoTemplates;
@property (weak, nonatomic) IBOutlet iCarousel *carousel;

@end

@implementation HomeViewController

- (NSArray *)coverPhotoTemplates
{
    if (!_coverPhotoTemplates) _coverPhotoTemplates = [CoverPhotoTemplate coverPhotoTemplates];
    return _coverPhotoTemplates;
}

#pragma mark - View life cycle -

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.carousel.type = iCarouselTypeRotary;
}

- (void)viewDidUnload
{
    [self setCarousel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

#pragma mark - iCarouselDataSource, iCarouselDelegate methods -

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.coverPhotoTemplates.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    if(!view) view = [HomeiCarousalCellView instanceWithNibName:nil bundle:nil owner:self];
    ((HomeiCarousalCellView *)view).photoTemplate = self.coverPhotoTemplates[index];
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    //TODO: item selected. Show the appropriate view controller.
    NSLog( @"%@ item selected",((CoverPhotoTemplate *)self.coverPhotoTemplates[index]).name);
}

@end
