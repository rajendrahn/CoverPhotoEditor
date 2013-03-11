//
//  PhotoEditorViewController.m
//  CoverPhotoEditor
//
//  Created by Sahana Kini on 07/03/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import "PhotoEditorViewController.h"
#import "EditOptionScrollView.h"
#import "EditOptionView.h"

const NSString * kOptionName = @"OptionName";
const NSString * kImageName = @"ImageName";

//This enum defines the order of options in the plist array
typedef enum
{
    EditOptionCrop,
    EditOptionDraw,
    EditOptionEffect,
    EditOptionFlip,
    EditOPtionText,
    EditOptionTune

}EditOptions;

@interface PhotoEditorViewController () <EditOptionScrollViewDataSource, EditOptionScrollViewDelegate, EditOptionViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UIImage * originalImage;
@property (nonatomic, strong) photoEditorCompletionHandler handler;
@property (nonatomic, strong) NSArray * editorOptions;

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UIScrollView *imageScrollView;
@property (nonatomic, weak) IBOutlet EditOptionScrollView *editOptionScrollView;
@end

@implementation PhotoEditorViewController

- (id)initWithImage:(UIImage *)image completionHandler:(void(^)(UIImage *image))handler
{
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self)
    {
        _originalImage  = image;
        _handler = handler;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.editorOptions = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"PhotoEditOptions" ofType:@"plist"]];
    self.editOptionScrollView.editOptionScrollViewDataSource = self;
    self.editOptionScrollView.editOptionScrollViewDelegate = self;
    
    self.imageScrollView.minimumZoomScale = 0.5f;
    self.imageScrollView.maximumZoomScale = 4.0f;
    self.imageScrollView.delegate = self;
    
    self.imageView.image = self.originalImage;
    
    [self setImageViewFrameToFitImageSize];
    [self.editOptionScrollView reloadData];
   
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setEditOptionScrollView:nil];
    [self setImageView:nil];
    [self setImageScrollView:nil];
    [super viewDidUnload];
}

#pragma mark - EditOPtionScrollView DataSource

- (int)numberOfItemInEditOptionScrollView:(EditOptionScrollView *)scrollView
{
    return self.editorOptions.count;
}

- (UIView *)editOptionScrolView:(EditOptionScrollView *)scrollView itemAtIndex:(int)index
{
    NSDictionary *editOptionDictionary = self.editorOptions[index];
    NSString *editOptionName = [editOptionDictionary objectForKey:kOptionName];
    NSString *editImageName = [editOptionDictionary objectForKey:kImageName];
    
    EditOptionView *editOptionView = [[EditOptionView alloc] initWithEditOptionName:editOptionName imageName:editImageName delegate:self];
    return editOptionView;
}

#pragma mark - EditOPtionScrollView Delegate

- (float)itemSpacingInEditOptionScrollView:(EditOptionScrollView *)scrollView
{
    return 20.0f;
}

#pragma mark - EditOptionView Delegate

- (void)editOptionView:(EditOptionView *)editOptionView didSelectOptionWithName:(NSString *)name
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%k like %@", kOptionName, name];
    NSDictionary * dictionary = [[self.editorOptions filteredArrayUsingPredicate:predicate] lastObject];
    EditOptions option = [self.editorOptions indexOfObject:dictionary];
    
    switch (option)
    {
        case EditOptionCrop:
        {
           
            break;
        }
        case EditOptionDraw:
        {
            
            break;
        }
        case EditOptionEffect:
        {
            
            break;
        }
        case EditOptionFlip:
        {
            
            break;
        }
        case EditOPtionText:
        {
            
            break;
        }
            
        default:
            break;
    }
    
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

#pragma mark - private methods


//sets the frame of the image view based on the image size.
-(void)setImageViewFrameToFitImageSize
{
    self.imageScrollView.zoomScale = self.imageScrollView.minimumZoomScale;
    
    //change the frame of the image so that it will fit the frame
    CGRect frame = self.imageView.frame;
    frame.size = self.originalImage.size;
    
    
    //check the aspect ratio of the image and change the imageview's frame to fit correctlyto screen
    //if width is more than height
    //then width equal to fulscreenimageview's width and calculate the height for that width
    //other wise height equal to full screen imageview's height and calculate the width for that heighy
    
    if (frame.size.width > CGRectGetWidth(self.imageScrollView.frame) || frame.size.height > CGRectGetHeight(self.imageScrollView.frame))
    {
        CGFloat neededWidth = self.imageScrollView.bounds.size.width - 20;
        if (frame.size.width > frame.size.height)
        {
            CGFloat width = frame.size.width;
            frame.size.width = neededWidth;
            frame.size.height = (frame.size.height*neededWidth) / width;
        }
        else
        {
            CGFloat height = frame.size.height;
            frame.size.height = self.imageScrollView.bounds.size.height;
            frame.size.width = (frame.size.width * self.imageScrollView.bounds.size.height)/height;
        }

    }
    
    self.imageView.frame = frame;
    self.imageView.center = self.imageScrollView.center;
}

@end
