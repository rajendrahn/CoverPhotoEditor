//
//  LayoutViewController.m
//  CoverPhotoEditor
//
//  Created by Adithya H on 07/03/13.
//  Copyright (c) 2013 Robosoft. All rights reserved.
//

#import "LayoutViewController.h"
#import "CoverPhotoTemplate.h"
#import "CustomLayoutBackgroundView.h"

@interface LayoutViewController ()


@property (nonatomic, strong) CustomLayoutBackgroundView *customTemplateView;
@property (nonatomic, strong) CoverPhotoTemplate *coverPhotoTemplate;
@end

@implementation LayoutViewController

-(id)initWithLayoutPhotoTemplate:(CoverPhotoTemplate *)coverPhotoTemplate
{
    if (self == [super init])
    {
        _coverPhotoTemplate = coverPhotoTemplate;
        // if (!CustomLayout)
        _customTemplateView = (CustomLayoutBackgroundView *)[[[NSBundle mainBundle] loadNibNamed:@"CustomLayoutBackgroundView" owner:self options:nil] lastObject];
        [self.view addSubview:_customTemplateView];
        _customTemplateView.frame = CGRectMake(0, 90, 768, 950);
        //else
        //TODO
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.customTemplateView.templateImageView.image = self.coverPhotoTemplate.exampleImage;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonClicked:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
