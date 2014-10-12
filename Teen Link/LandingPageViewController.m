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
    
    dispatch_queue_t queue = dispatch_queue_create("org.teenlink.teenlink", NULL);
    dispatch_async(queue, ^{
        [self setupJson];
        [self determineFrontPicsIndex];
    });
    
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
    
    UIButton *leftUpperButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 150, 98)];
    [leftUpperButton setBackgroundImage:[UIImage imageNamed:@"a_block1.png"] forState:UIControlStateNormal];
    [leftUpperButton addTarget:self action:@selector(boxOneClicked) forControlEvents:UIControlEventTouchUpInside];
    UIButton *rightUpperButton = [[UIButton alloc]initWithFrame:CGRectMake(160, 30, 150, 98)];
    [rightUpperButton setBackgroundImage:[UIImage imageNamed:@"a_block2.png"]forState:UIControlStateNormal];
    [rightUpperButton addTarget:self action:@selector(boxTwoClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *viewMoreButton = [[UIButton alloc]initWithFrame:CGRectMake(210, 144, 92.5, 22.5)];
    [viewMoreButton setBackgroundColor:[UIColor colorWithRed:0.925 green:0 blue:0.549 alpha:1] /*#ec008c*/];
    viewMoreButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12];
    [viewMoreButton setTitle:@"VIEW ALL" forState:UIControlStateNormal];
    [viewMoreButton addTarget:self action:@selector(viewServicesSelected) forControlEvents:UIControlEventTouchUpInside];
    
    [servicesView addSubview:viewMoreButton];
    [servicesView addSubview:leftUpperButton];
    [servicesView addSubview:rightUpperButton];
    [servicesView addSubview:servicesText];
    
    [self.view addSubview:servicesView];
}

-(void)setupOpportuniesBlock{
    UIView *opportuniesView = [[UIView alloc]initWithFrame:CGRectMake(0, 380, self.view.frame.size.width, 160)];
    
    UILabel *opportunityText = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 200, 28)];
    opportunityText.font = [UIFont fontWithName:@"DINCondensed-Bold" size:28];
    opportunityText.textColor = [UIColor colorWithRed:0.043 green:0.031 blue:0.286 alpha:1] /*#0b0849*/;
    opportunityText.text = @"OPPORTUNITIES";
    
    UIButton *leftLowerButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 150, 98)];
    [leftLowerButton setBackgroundImage:[UIImage imageNamed:@"a_block3"] forState:UIControlStateNormal];
    [leftLowerButton addTarget:self action:@selector(boxThreeClicked) forControlEvents:UIControlEventTouchUpInside];
    UIButton *rightlowerButton = [[UIButton alloc]initWithFrame:CGRectMake(160, 30, 150, 98)];
    [rightlowerButton setBackgroundImage:[UIImage imageNamed:@"a_block4.png"] forState:UIControlStateNormal];
    [rightlowerButton addTarget:self action:@selector(boxFourClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *viewMoreButton = [[UIButton alloc]initWithFrame:CGRectMake(210, 144, 92.5, 22.5)];
    [viewMoreButton setBackgroundColor:[UIColor colorWithRed:0.925 green:0 blue:0.549 alpha:1] /*#ec008c*/];
    viewMoreButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12];
    [viewMoreButton setTitle:@"VIEW ALL" forState:UIControlStateNormal];
    [viewMoreButton addTarget:self action:@selector(viewOpportunitiesSelected) forControlEvents:UIControlEventTouchUpInside];
    
    [opportuniesView addSubview:viewMoreButton];
    [opportuniesView addSubview:leftLowerButton];
    [opportuniesView addSubview:rightlowerButton];
    [opportuniesView addSubview:opportunityText];
    
    [self.view addSubview:opportuniesView];
}

-(void)boxOneClicked{
    sendToOpportunity = NO;
    boxClickedIndexToUse = 1;
    [self performSegueWithIdentifier:@"landingPageToDetails" sender:self];
}

-(void)boxTwoClicked{
    sendToOpportunity = NO;
    boxClickedIndexToUse = 2;
    [self performSegueWithIdentifier:@"landingPageToDetails" sender:self];
}

-(void)boxThreeClicked{
    sendToOpportunity = YES;
    boxClickedIndexToUse = 3;
    [self performSegueWithIdentifier:@"landingPageToDetails" sender:self];
}

-(void)boxFourClicked{
    sendToOpportunity = YES;
    boxClickedIndexToUse = 4;
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
    
    if([segue.identifier isEqualToString:@"landingToGrid"]){
        
        GridPageViewController *GPVC = [segue destinationViewController];
        GPVC.topicItemArray = [NSMutableArray arrayWithArray:self.topicItemArray];
        GPVC.opportunityItemArray = [NSMutableArray arrayWithArray:self.opportunityItemArray];
        if(sendToOpportunity){
            GPVC.sendToOpporunties = YES;
        }
        else{
            GPVC.sendToOpporunties = NO;
        }
    }
    else if([segue.identifier isEqualToString:@"landingPageToDetails"]){
        
        DetailPageViewController *DPVC = [segue destinationViewController];

        if(boxClickedIndexToUse == 1 && sendToOpportunity == NO){
            DPVC.topicItemArray = [NSMutableArray arrayWithArray:self.topicItemArray];
            DPVC.headerText = [[self.topicItemArray objectAtIndex:self.alcoholIndex]name];
            DPVC.detailTextString = [[self.topicItemArray objectAtIndex:self.alcoholIndex]paragraphText];
            DPVC.isTopic = YES;
        }
        else if(boxClickedIndexToUse == 2 && sendToOpportunity == NO){
            DPVC.topicItemArray = [NSMutableArray arrayWithArray:self.topicItemArray];
            DPVC.headerText = [[self.topicItemArray objectAtIndex:self.suicideIndex]name];
            DPVC.detailTextString = [[self.topicItemArray objectAtIndex:self.suicideIndex]paragraphText];
            DPVC.isTopic = YES;
        }
        else if(boxClickedIndexToUse == 3 && sendToOpportunity == YES){
            DPVC.opportunityItemArray = [NSMutableArray arrayWithArray:self.opportunityItemArray];
            DPVC.headerText = [[self.opportunityItemArray objectAtIndex:self.volunteeringIndex]name];
            DPVC.detailTextString = [[self.opportunityItemArray objectAtIndex:self.volunteeringIndex]paragraphText];
            DPVC.isTopic = NO;
        }
        else if(boxClickedIndexToUse == 4 && sendToOpportunity == YES){
            DPVC.opportunityItemArray = [NSMutableArray arrayWithArray:self.opportunityItemArray];
            DPVC.headerText = [[self.opportunityItemArray objectAtIndex:self.youthIndex]name];
            DPVC.detailTextString = [[self.opportunityItemArray objectAtIndex:self.youthIndex]paragraphText];
            DPVC.isTopic = NO;
        }

    }
}


-(void)setupNavBarItems
{
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

-(void)setupJson{
    
    self.topicItemArray = [[NSMutableArray alloc]init];
    self.opportunityItemArray = [[NSMutableArray alloc]init];
    NSURL *jsonURL = [[NSBundle mainBundle] URLForResource: @"teen_link" withExtension:@"json"];
    self.jsonArray = [self parseDetailJSON:jsonURL];
    for(NSDictionary* dict in self.jsonArray){
        
        if([[dict objectForKey:@"type"] isEqualToString:@"topic"]){
            
            NSMutableArray *contactsArray = [[NSMutableArray alloc]init];
            for(NSDictionary *contactsDict in [dict valueForKeyPath:@"contacts"]){
                Resource *resource = [[Resource alloc] createResource:[contactsDict valueForKeyPath:@"name"] andAddress:[contactsDict valueForKeyPath:@"address"] andWebsite:[contactsDict valueForKeyPath:@"link"] andHours:[contactsDict valueForKeyPath:@"hours"] andPhoneNumber:[contactsDict valueForKeyPath:@"number"]];
                [contactsArray addObject:resource];
            }
            
            Item *item = [[Item alloc]createItem:[dict objectForKey:@"type"] andName:[dict objectForKey:@"name"]  andText:[dict objectForKey:@"text"] andShortName:[dict objectForKey:@"short_name"] andContacts:[NSMutableArray arrayWithArray:contactsArray]];
            [self.topicItemArray addObject:item];
            [contactsArray removeAllObjects];
            
        }
        else if ([[dict objectForKey:@"type"] isEqualToString:@"opportunity"]){
            
            NSMutableArray *contactsArray = [[NSMutableArray alloc]init];
            for(NSDictionary *contactsDict in [dict valueForKeyPath:@"contacts"]){
                Resource *resource = [[Resource alloc] createResource:[contactsDict valueForKeyPath:@"name"] andAddress:[contactsDict valueForKeyPath:@"address"] andWebsite:[contactsDict valueForKeyPath:@"link"] andHours:[contactsDict valueForKeyPath:@"hours"] andPhoneNumber:[contactsDict valueForKeyPath:@"number"]];
                [contactsArray addObject:resource];
            }
            
            Item *item = [[Item alloc]createItem:[dict objectForKey:@"type"] andName:[dict objectForKey:@"name"]  andText:[dict objectForKey:@"text"]  andShortName:[dict objectForKey:@"short_name"] andContacts:[NSMutableArray arrayWithArray:contactsArray]];
            [self.opportunityItemArray addObject:item];
            [contactsArray removeAllObjects];
        }
    }
}

-(NSArray*)parseDetailJSON:(NSURL*)filePath{
    
    NSError *e = nil;
    NSData *jsonData = [NSData dataWithContentsOfURL:filePath];
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&e];
    
    return jsonArray;
}

-(void)determineFrontPicsIndex{

    for(int i=0; i<[self.topicItemArray count]; i++){
        if ([[[self.topicItemArray objectAtIndex:i]name] isEqualToString:@"Alcohol & Drugs"]) {
            self.alcoholIndex = i;
        }
        else if ([[[self.topicItemArray objectAtIndex:i]name] isEqualToString:@"Suicide"]){
            self.suicideIndex = i;
        }
    }
    for(int x=0; x<[self.opportunityItemArray count]; x++){
        if ([[[self.opportunityItemArray objectAtIndex:x]name] isEqualToString:@"Leadership & Volunteer"]) {
            self.volunteeringIndex = x;
        }
        else if ([[[self.opportunityItemArray objectAtIndex:x]name] isEqualToString:@"Recreation & Youth Involvement"]){
            self.youthIndex = x;
        }
    }
}

-(void)showMenu{
    [self performSegueWithIdentifier:@"homeToMenu" sender:self];
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


@end
