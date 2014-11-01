//
//  MoreDetailsViewController.m
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/4/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import "MoreDetailsViewController.h"

@interface MoreDetailsViewController ()

@end

@implementation MoreDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBarItems];
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 200)];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 200 );
    self.scrollView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:0.847 green:0.847 blue:0.847 alpha:1] /*#d8d8d8*/;
    [self.view addSubview:self.scrollView];
    
    [self setupHeader];
    [self setupTextArea:self.text];
}

-(void)setupNavBarItems
{
    self.title = @"TEEN LINK";
    //bar color
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    //    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //back button
    self.navigationItem.backBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@""
                                                                            style:UIBarButtonItemStyleBordered
                                                                           target:nil
                                                                        action:nil];
}

-(void)setupTextArea:(NSString*)text{
    
    int textTopPadding = 208;
    if([SDiPhoneVersion deviceSize] == iPhone35inch || [SDiPhoneVersion deviceSize] == iPhone4inch){
        textTopPadding = 208;
    }
    else if([SDiPhoneVersion deviceSize] == iPhone47inch){
        textTopPadding = 230;
    }
    else if ([SDiPhoneVersion deviceSize] == iPhone55inch){
        textTopPadding = 230;
    }
    
    UILabel *detailTextLabel = [[UILabel alloc]init];
    detailTextLabel.numberOfLines = 0;
    detailTextLabel.text = text;
    detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIFont fontWithName:@"HelveticaNeue" size:14], NSFontAttributeName,
                                          nil];
    
    CGRect frame = [detailTextLabel.text boundingRectWithSize:CGSizeMake(263, 2000.0)
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:attributesDictionary
                                                      context:nil];
    detailTextLabel.frame = CGRectMake(15, textTopPadding, self.view.frame.size.width - 30, frame.size.height);
    detailTextLabel.backgroundColor = [UIColor whiteColor];
    [detailTextLabel sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, frame.size.height + 222);
    [self.scrollView addSubview:detailTextLabel];
}

-(void)setupHeader{
        
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 72, self.view.frame.size.width, 122.5)];
    [headerView setBackgroundColor:[UIColor clearColor]]; /*#8f3b8d*/

    NSURL *imgUrl = [[NSBundle mainBundle]URLForResource:self.shortName withExtension:@"png"];
    UIImage *detailImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imgUrl]];
    UIImageView *headerImage = [[UIImageView alloc]initWithImage:detailImage];
    headerImage.contentMode = UIViewContentModeScaleAspectFill;
    headerImage.frame = CGRectMake(0, 0, self.view.frame.size.width, 122.5);//headerView.frame;
    [headerView addSubview:headerImage];
    
    [self.scrollView addSubview:headerView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
