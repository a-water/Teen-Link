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
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 568);
    [self.view addSubview:scrollView];
    
    [self setupNavBarItems];
    [self setupBackGround];
    [self setupHeader];
    [self setupServicesBlock];
    [self setupOpportuniesBlock];
    
    dispatch_queue_t queue = dispatch_queue_create("org.teenlink.teenlink", NULL);
    dispatch_async(queue, ^{
        [self setupJson];
        [self determineFrontPicsIndex];
    });
    
/*
    iPhone35inch = 1, [4, 4s]
    iPhone4inch =  2, [5, 5C, 5S]
    iPhone47inch = 3, [6]
    iPhone55inch = 4  [6+]
 */
}

-(void)setupBackGround{
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a_grey_bg"]];
    bgImageView.frame = self.view.bounds;
    [self.view addSubview:bgImageView];
    [self.view sendSubviewToBack:bgImageView];
}

-(void)setupHeader{
    UIView *headerBlock = [[UIView alloc]initWithFrame:CGRectMake(0, 44, scrollView.frame.size.width, 145)];
    [headerBlock setBackgroundColor:[UIColor colorWithRed:0.694 green:0.847 blue:0 alpha:1] /*#b1d800*/];
    
    //here begins my punishment for not wanting to learn autolayout :(
    int textAndCallXval = 0;
    int whaleXVal = 0;
    int whaleSize = 0;
    int fontSize = 0;
    int callBtnWidth = 0;
    int callBtnHeight = 0;
    if([SDiPhoneVersion deviceSize] == iPhone35inch || [SDiPhoneVersion deviceSize] == iPhone4inch){
        textAndCallXval = 15;
        whaleXVal = 178;
        whaleSize = 135;
        fontSize = 30;
        callBtnWidth = 136;
        callBtnHeight = 38;
    }
    else if([SDiPhoneVersion deviceSize] == iPhone47inch){
        textAndCallXval = 30;
        whaleXVal = 208;
        whaleSize = 155;
        fontSize = 35;
        callBtnWidth = 150;
        callBtnHeight = 42;
    }
    else if ([SDiPhoneVersion deviceSize] == iPhone55inch){
        textAndCallXval = 30;
        whaleXVal = 220;
        whaleSize = 165;
        fontSize = 35;
        callBtnWidth = 150;
        callBtnHeight = 42;
    }
    
    UILabel *headerText = [[UILabel alloc]initWithFrame:CGRectMake(textAndCallXval, 10, 200, 100)];
    headerText.font = [UIFont fontWithName:@"DINCondensed-Bold" size:fontSize];
    headerText.textColor = [UIColor colorWithRed:0.043 green:0.031 blue:0.286 alpha:1] /*#0b0849*/;
    headerText.text = @"TALK IT OUT";
    
    UIImage *callImage = [UIImage imageNamed:@"a_call_btn.png"];
    UIButton *callButton = [[UIButton alloc]initWithFrame:CGRectMake(textAndCallXval, 80, callBtnWidth, callBtnHeight)];
    [callButton setBackgroundImage:callImage forState:UIControlStateNormal];
    [callButton addTarget:self action:@selector(callTeenLink) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *whaleImg = [UIImage imageNamed:@"a_whale.png"];
    UIImageView *whaleView = [[UIImageView alloc]initWithImage:whaleImg];
    whaleView.frame = CGRectMake(whaleXVal, 75, whaleSize, whaleSize);
    whaleView.contentMode = UIViewContentModeScaleAspectFit;
    
    [headerBlock addSubview:headerText];
    [headerBlock addSubview:callButton];
    [scrollView addSubview:headerBlock];
    [scrollView addSubview:whaleView];

}

-(void)callTeenLink{
    NSString *phoneNumber = [@"telprompt://" stringByAppendingString:@"18668335465"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

-(void)setupServicesBlock{
    
    int textAndAlcoholXVal = 0;
    int btnWidthSize = 0;
    int btwnHeightSize = 0;
    int suicideXval = 0;
    int fontSize = 0;
    int viewAllXVal = 0;
    int viewAllYVal = 0;
    double viewAllHeight = 0;
    double viewAllWidth = 0;
    int viewMoreFontSize = 0;
    int blockYVal = 0;
    int textSpacer = 0;
    
    if([SDiPhoneVersion deviceSize] == iPhone35inch || [SDiPhoneVersion deviceSize] == iPhone4inch){
        textAndAlcoholXVal = 15;
        btnWidthSize = 150;
        btwnHeightSize = 98;
        suicideXval = 160;
        fontSize = 28;
        viewAllXVal = 210;
        viewAllYVal = 144;
        viewAllWidth = 92.5;
        viewAllHeight = 22.5;
        viewMoreFontSize = 12;
        blockYVal = 210;
        textSpacer = 0;
    }
    else if([SDiPhoneVersion deviceSize] == iPhone47inch){
        textAndAlcoholXVal = 30;
        btnWidthSize = 160;
        btwnHeightSize = 105;
        suicideXval = 190;
        fontSize = 35;
        viewAllXVal = 240;
        viewAllYVal = 144;
        viewAllWidth = 106;
        viewAllHeight = 30;
        viewMoreFontSize = 15;
        blockYVal = 240;
        textSpacer = -8;
    }
    else if ([SDiPhoneVersion deviceSize] == iPhone55inch){
        textAndAlcoholXVal = 30;
        btnWidthSize = 175;
        btwnHeightSize = 114;
        suicideXval = 215;
        fontSize = 38;
        viewAllXVal = 267;
        viewAllYVal = 154;
        viewAllWidth = 120;
        viewAllHeight = 34;
        viewMoreFontSize = 17;
        blockYVal = 260;
        textSpacer = -8;
    }
    
    UIView *servicesView = [[UIView alloc]initWithFrame:CGRectMake(0, blockYVal, self.view.frame.size.width, 180)];
    
    UILabel *servicesText = [[UILabel alloc]initWithFrame:CGRectMake(textAndAlcoholXVal, textSpacer, 200, 40)];
    servicesText.font = [UIFont fontWithName:@"DINCondensed-Bold" size:fontSize];
    servicesText.textColor = [UIColor colorWithRed:0.043 green:0.031 blue:0.286 alpha:1] /*#0b0849*/;
    servicesText.text = @"SERVICES";
    
    UIButton *leftUpperButton = [[UIButton alloc]initWithFrame:CGRectMake(textAndAlcoholXVal - 5, 30, btnWidthSize, btwnHeightSize)];
    [leftUpperButton setBackgroundImage:[UIImage imageNamed:@"a_block1.png"] forState:UIControlStateNormal];
    [leftUpperButton addTarget:self action:@selector(boxOneClicked) forControlEvents:UIControlEventTouchUpInside];
    UIButton *rightUpperButton = [[UIButton alloc]initWithFrame:CGRectMake(suicideXval, 30, btnWidthSize, btwnHeightSize)];
    [rightUpperButton setBackgroundImage:[UIImage imageNamed:@"a_block2.png"]forState:UIControlStateNormal];
    [rightUpperButton addTarget:self action:@selector(boxTwoClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *viewMoreButton = [[UIButton alloc]initWithFrame:CGRectMake(viewAllXVal, viewAllYVal, viewAllWidth, viewAllHeight)];
    [viewMoreButton setBackgroundColor:[UIColor colorWithRed:0.925 green:0 blue:0.549 alpha:1] /*#ec008c*/];
    viewMoreButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:viewMoreFontSize];
    [viewMoreButton setTitle:@"VIEW ALL" forState:UIControlStateNormal];
    [viewMoreButton addTarget:self action:@selector(viewServicesSelected) forControlEvents:UIControlEventTouchUpInside];
    
    [servicesView addSubview:viewMoreButton];
    [servicesView addSubview:leftUpperButton];
    [servicesView addSubview:rightUpperButton];
    [servicesView addSubview:servicesText];
    [scrollView addSubview:servicesView];
}

-(void)setupOpportuniesBlock{
    
    int textAndVolunteeringXVal = 0;
    int btnWidthSize = 0;
    int btwnHeightSize = 0;
    int youthXval = 0;
    int fontSize = 0;
    int viewAllXVal = 0;
    int viewAllYVal = 0;
    double viewAllHeight = 0;
    double viewAllWidth = 0;
    int viewMoreFontSize = 0;
    int blockYVal = 0;
    int textSpacer = 0;
    
    if([SDiPhoneVersion deviceSize] == iPhone35inch || [SDiPhoneVersion deviceSize] == iPhone4inch){
        textAndVolunteeringXVal = 15;
        btnWidthSize = 150;
        btwnHeightSize = 98;
        youthXval = 160;
        fontSize = 28;
        viewAllXVal = 210;
        viewAllYVal = 144;
        viewAllWidth = 92.5;
        viewAllHeight = 22.5;
        viewMoreFontSize = 12;
        blockYVal = 380;
        textSpacer = 0;
    }
    else if([SDiPhoneVersion deviceSize] == iPhone47inch){
        textAndVolunteeringXVal = 30;
        btnWidthSize = 160;
        btwnHeightSize = 105;
        youthXval = 190;
        fontSize = 35;
        viewAllXVal = 240;
        viewAllYVal = 144;
        viewAllWidth = 106;
        viewAllHeight = 30;
        viewMoreFontSize = 15;
        blockYVal = 440;
        textSpacer = -8;
    }
    else if ([SDiPhoneVersion deviceSize] == iPhone55inch){
        textAndVolunteeringXVal = 30;
        btnWidthSize = 175;
        btwnHeightSize = 114;
        youthXval = 215;
        fontSize = 38;
        viewAllXVal = 267;
        viewAllYVal = 154;
        viewAllWidth = 120;
        viewAllHeight = 34;
        viewMoreFontSize = 17;
        blockYVal = 480;
        textSpacer = -8;
    }

    UIView *opportuniesView = [[UIView alloc]initWithFrame:CGRectMake(0, blockYVal, self.view.frame.size.width, 180)];
    
    UILabel *opportunityText = [[UILabel alloc]initWithFrame:CGRectMake(textAndVolunteeringXVal, textSpacer, 200, 40)];
    opportunityText.font = [UIFont fontWithName:@"DINCondensed-Bold" size:fontSize];
    opportunityText.textColor = [UIColor colorWithRed:0.043 green:0.031 blue:0.286 alpha:1] /*#0b0849*/;
    opportunityText.text = @"OPPORTUNITIES";
    
    UIButton *leftLowerButton = [[UIButton alloc]initWithFrame:CGRectMake(textAndVolunteeringXVal - 5, 30, btnWidthSize, btwnHeightSize)];
    [leftLowerButton setBackgroundImage:[UIImage imageNamed:@"a_block3"] forState:UIControlStateNormal];
    [leftLowerButton addTarget:self action:@selector(boxThreeClicked) forControlEvents:UIControlEventTouchUpInside];
    UIButton *rightlowerButton = [[UIButton alloc]initWithFrame:CGRectMake(youthXval, 30, btnWidthSize, btwnHeightSize)];
    [rightlowerButton setBackgroundImage:[UIImage imageNamed:@"a_block4.png"] forState:UIControlStateNormal];
    [rightlowerButton addTarget:self action:@selector(boxFourClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *viewMoreButton = [[UIButton alloc]initWithFrame:CGRectMake(viewAllXVal, viewAllYVal, viewAllWidth, viewAllHeight)];
    [viewMoreButton setBackgroundColor:[UIColor colorWithRed:0.925 green:0 blue:0.549 alpha:1] /*#ec008c*/];
    viewMoreButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:viewMoreFontSize];
    [viewMoreButton setTitle:@"VIEW ALL" forState:UIControlStateNormal];
    [viewMoreButton addTarget:self action:@selector(viewOpportunitiesSelected) forControlEvents:UIControlEventTouchUpInside];
    
    [opportuniesView addSubview:viewMoreButton];
    [opportuniesView addSubview:leftLowerButton];
    [opportuniesView addSubview:rightlowerButton];
    [opportuniesView addSubview:opportunityText];
    [scrollView addSubview:opportuniesView];
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
