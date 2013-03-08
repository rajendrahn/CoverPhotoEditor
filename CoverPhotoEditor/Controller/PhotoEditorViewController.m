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

@interface PhotoEditorViewController () <EditOptionScrollViewDataSource, EditOptionScrollViewDelegate, EditOptionViewDelegate>

@property (nonatomic, strong) UIImage * originalImage;
@property (nonatomic, strong) photoEditorCompletionHandler handler;
@property (nonatomic, strong) NSArray * editorOptions;
@property (weak, nonatomic) IBOutlet EditOptionScrollView *editOptionScrollView;
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

- (void)viewDidUnload {
    [self setEditOptionScrollView:nil];
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
    
}

@end
