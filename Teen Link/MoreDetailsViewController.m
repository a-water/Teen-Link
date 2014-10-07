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
    
    UILabel *detailTextLabel = [[UILabel alloc]init];
//        detailTextLabel.textColor = [UIColor colorWithRed:0.043 green:0.031 blue:0.286 alpha:1]; /*#0b0849*/
    detailTextLabel.numberOfLines = 0;
    detailTextLabel.text = self.text;
    detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIFont fontWithName:@"HelveticaNeue" size:14], NSFontAttributeName,
                                          nil];
    
    CGRect frame = [detailTextLabel.text boundingRectWithSize:CGSizeMake(263, 2000.0)
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:attributesDictionary
                                            context:nil];
    
    detailTextLabel.frame = CGRectMake(15, 208, frame.size.width, frame.size.height);
    detailTextLabel.backgroundColor = [UIColor whiteColor];
//    detailTextLabel.layer.borderWidth = 1.0f;
//    detailTextLabel.layer.borderColor = [[UIColor redColor]CGColor];
    [detailTextLabel sizeToFit];
//    [textArea addSubview:detailTextLabel];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, frame.size.height + 222);
    [self.scrollView addSubview:detailTextLabel];
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

-(void)setupHeader{
    
    //    UIFont *dinFont = [UIFont fontWithName:@"DINCondensed-Bold" size:32];
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 72, self.view.frame.size.width, 122.5)];
    [headerView setBackgroundColor:[UIColor clearColor]]; /*#8f3b8d*/
    
    //    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 40, 175, 61.25)];
    //    headerLabel.minimumScaleFactor = 0.5;
    //    headerLabel.adjustsFontSizeToFitWidth = YES;
    //    headerLabel.font = dinFont;
    //    headerLabel.textColor = [UIColor whiteColor];
    //    headerLabel.numberOfLines = 2;
    //    headerLabel.text = headerName;
    //
    //    [headerView addSubview:headerLabel];
    //    NSString *imageUrl = @"alcohol.png";//[self getImageForHeader:headerName];
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
