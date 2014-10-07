//
//  UIViewController+LandingPageViewController.m
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/4/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import "LandingPageViewController.h"

@implementation LandingPageViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    [self setupNavBarItems];
    [self setupBackGround];
    [self setupHeader];
    [self setupServicesBlock];
    [self setupOpportuniesBlock];
    UIImage *whaleImg = [UIImage imageNamed:@"a_whale.png"];
    UIImageView *whaleView = [[UIImageView alloc]initWithImage:whaleImg];
    whaleView.frame = CGRectMake(178, 75, 135, 135);
    whaleView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:whaleView];
    

}
//
-(void)setupBackGround{
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a_grey_bg"]];
    bgImageView.frame = self.view.bounds;
    [self.view addSubview:bgImageView];
    [self.view sendSubviewToBack:bgImageView];
}

-(void)setupHeader{
    UIView *headerBlock = [[UIView alloc]initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, 145)];
    [headerBlock setBackgroundColor:[UIColor colorWithRed:0.694 green:0.847 blue:0 alpha:1] /*#b1d800*/];
    
    
    UILabel *headerText = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 200, 100)];
    headerText.font = [UIFont fontWithName:@"DINCondensed-Bold" size:30];
    headerText.textColor = [UIColor colorWithRed:0.043 green:0.031 blue:0.286 alpha:1] /*#0b0849*/;
    headerText.text = @"TALK IT OUT";
    
    UIImage *callImage = [UIImage imageNamed:@"a_call_btn.png"];
    UIButton *callButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 80, 136, 37.5)];
    [callButton setBackgroundImage:callImage forState:UIControlStateNormal];
    [callButton addTarget:self action:@selector(callTeenLink) forControlEvents:UIControlEventTouchUpInside];
    
    [headerBlock addSubview:headerText];
    [headerBlock addSubview:callButton];
    
    [self.view addSubview:headerBlock];
}

-(void)callTeenLink{
    NSString *phoneNumber = [@"telprompt://" stringByAppendingString:@"18668335465"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

-(void)setupServicesBlock{
    UIView *servicesView = [[UIView alloc]initWithFrame:CGRectMake(0, 210, self.view.frame.size.width, 160)];
    
    UILabel *servicesText = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 200, 28)];
    servicesText.font = [UIFont fontWithName:@"DINCondensed-Bold" size:28];
    servicesText.textColor = [UIColor colorWithRed:0.043 green:0.031 blue:0.286 alpha:1] /*#0b0849*/;
    servicesText.text = @"SERVICES";
    
    UIImageView *leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a_block1.png"]];
    leftImageView.frame = CGRectMake(10, 30, 150, 98);
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
//    UITapGestureRecognizer *btn1Tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(boxOneClicked:)];
//    btn1Tap.numberOfTapsRequired = 1;
//    btn1Tap.numberOfTouchesRequired = 1;
//    [leftImageView addGestureRecognizer:btn1Tap];
//    [leftImageView setUserInteractionEnabled:YES];
    UIImageView *rightImageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a_block2.png"]];
    rightImageview.frame = CGRectMake(160, 30, 150, 98);
    rightImageview.contentMode = UIViewContentModeScaleAspectFit;
    
    UIButton *viewMoreButton = [[UIButton alloc]initWithFrame:CGRectMake(210, 144, 92.5, 22.5)];
    [viewMoreButton setBackgroundColor:[UIColor colorWithRed:0.925 green:0 blue:0.549 alpha:1] /*#ec008c*/];
    viewMoreButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12];
    [viewMoreButton setTitle:@"VIEW ALL" forState:UIControlStateNormal];
    [viewMoreButton addTarget:self action:@selector(viewServicesSelected) forControlEvents:UIControlEventTouchUpInside];
   
    [servicesView addSubview:viewMoreButton];
    [servicesView addSubview:leftImageView];
    [servicesView addSubview:rightImageview];
    [servicesView addSubview:servicesText];

    [self.view addSubview:servicesView];
}

-(void)setupOpportuniesBlock{
    UIView *opportuniesView = [[UIView alloc]initWithFrame:CGRectMake(0, 380, self.view.frame.size.width, 160)];

    UILabel *opportunityText = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 200, 28)];
    opportunityText.font = [UIFont fontWithName:@"DINCondensed-Bold" size:28];
    opportunityText.textColor = [UIColor colorWithRed:0.043 green:0.031 blue:0.286 alpha:1] /*#0b0849*/;
    opportunityText.text = @"OPPORTUNITIES";
    
    UIImageView *leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a_block3.png"]];
    leftImageView.frame = CGRectMake(10, 30, 150, 98);
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    UIImageView *rightImageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a_block4.png"]];
    rightImageview.frame = CGRectMake(160, 30, 150, 98);
    rightImageview.contentMode = UIViewContentModeScaleAspectFit;
    
    UIButton *viewMoreButton = [[UIButton alloc]initWithFrame:CGRectMake(210, 144, 92.5, 22.5)];
    [viewMoreButton setBackgroundColor:[UIColor colorWithRed:0.925 green:0 blue:0.549 alpha:1] /*#ec008c*/];
    viewMoreButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12];
    [viewMoreButton setTitle:@"VIEW ALL" forState:UIControlStateNormal];
    [viewMoreButton addTarget:self action:@selector(viewOpportunitiesSelected) forControlEvents:UIControlEventTouchUpInside];
    
    [opportuniesView addSubview:viewMoreButton];
    [opportuniesView addSubview:leftImageView];
    [opportuniesView addSubview:rightImageview];
    [opportuniesView addSubview:opportunityText];
    
    [self.view addSubview:opportuniesView];
}

-(void)boxOneClicked:(UIGestureRecognizer*)gesture{
    sendToOpportunity = NO;
    [self performSegueWithIdentifier:@"landingPageToDetails" sender:self];
}


-(void)viewServicesSelected{
    sendToOpportunity = NO;
    [self performSegueWithIdentifier:@"landingToGrid" sender:self];
}

-(void)viewOpportunitiesSelected{

    sendToOpportunity = YES;
    [self performSegueWithIdentifier:@"landingToGrid" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if(![segue.identifier isEqualToString:@"landingPageToDetails"] && ![segue.identifier isEqualToString:@"homeToMenu"]){
        GridPageViewController *GPVC = [segue destinationViewController];
        if(sendToOpportunity){
            GPVC.sendToOpporunties = YES;
        }
        else{
            GPVC.sendToOpporunties = NO;
        }
    }
}


-(void)setupNavBarItems
{
//    UIImageView *logoView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo.png"]];
//    logoView.frame = CGRectMake(0, 0, 50, 20);
//    logoView.contentMode = UIViewContentModeScaleAspectFit;
//    [self.navigationController.navigationBar.topItem setTitleView:logoView];
    self.title = @"TEEN LINK";
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.925 green:0 blue:0.549 alpha:1] /*#ec008c*/;
    
//    self.navigationItem.title = @"TEEN LINK";
    //bar color
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    //    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //back button
    self.navigationItem.backBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@""
                                                                            style:UIBarButtonItemStyleBordered
                                                                           target:nil
                                                                           action:nil];
//    
//    UIBarButtonItem	*menuButton = [[UIBarButtonItem alloc] init];
//    [menuButton setImage:[UIImage imageNamed:@"menu_btn"]];
//    self.navigationItem.leftBarButtonItem = menuButton;
//    self.navigationItem.leftBarButtonItem.enabled = YES;
    
    UIImage *menuImage = [UIImage imageNamed:@"menu_btn.png"];
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuButton setImage:menuImage forState:UIControlStateNormal];
    menuButton.frame = CGRectMake(0, 0, 22, 22);
    [menuButton addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuButtonBar = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    self.navigationItem.leftBarButtonItem = menuButtonBar;
    
}

-(void)showMenu{
    [self performSegueWithIdentifier:@"homeToMenu" sender:self];    
}




-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


@end
