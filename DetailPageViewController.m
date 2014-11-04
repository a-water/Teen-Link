//
//  UIViewController+DetailPageViewController.m
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/4/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import "DetailPageViewController.h"

@implementation DetailPageViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    [self setupNavBarItems];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"TEEN LINK";
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    int numContacts = 0;
    Item *matchItem;
    if(self.isTopic){
        for(int i=0; i<self.topicItemArray.count; i++){
            
            if([[[self.topicItemArray objectAtIndex:i]name] isEqualToString:self.headerText]){
                
                matchItem = [self.topicItemArray objectAtIndex:i];
                numContacts = (int)[matchItem.contactsArray count];
            }
        }
    }
    else{
        for(int i=0; i<self.opportunityItemArray.count; i++){
            
            if([[[self.opportunityItemArray objectAtIndex:i]name] isEqualToString:self.headerText]){
                
                matchItem = [self.opportunityItemArray objectAtIndex:i];
                numContacts = (int)[matchItem.contactsArray count];
            }
            
        }
    }
    
    shortName = matchItem.shortName;
    textToSend = matchItem.paragraphText;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, [self determineScrollViewHeight:numContacts] - 142);
    self.scrollView.backgroundColor = [UIColor colorWithRed:0.847 green:0.847 blue:0.847 alpha:1] /*#d8d8d8*/;
    [self.view addSubview:self.scrollView];
    [self setupHeader:matchItem.shortName];
    [self setupTextArea:self.detailTextString];
    [self setupResouceBlock];
    
    
    [self setupResourceTableView:self.isTopic];
}

-(int)determineScrollViewHeight:(int)numContacts{

    if ([SDiPhoneVersion deviceSize] == iPhone35inch){
        return self.view.frame.size.height + 88 + (130 * numContacts);
    }
    else if([SDiPhoneVersion deviceSize] == iPhone4inch){
        return self.view.frame.size.height + (130 * numContacts);
    }
    else if([SDiPhoneVersion deviceSize] == iPhone47inch){
        return self.view.frame.size.height - 99 + (130 * numContacts);
    }
    else if([SDiPhoneVersion deviceSize] == iPhone55inch){
        return self.view.frame.size.height - 168 + (130 * numContacts);
    }
    
    return self.view.frame.size.height + (130 * numContacts);
}

-(void)setupHeader:(NSString*) picName{
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 72, self.view.frame.size.width, 122.5)];
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    NSURL *imgUrl = [[NSBundle mainBundle]URLForResource:picName withExtension:@"png"];
    UIImage *detailImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imgUrl]];
    UIImageView *headerImage = [[UIImageView alloc]initWithImage:detailImage];
    headerImage.contentMode = UIViewContentModeScaleAspectFill;
    headerImage.frame = CGRectMake(0, 0, self.view.frame.size.width, 122.5);//headerView.frame;
    [headerView addSubview:headerImage];
    
    [self.scrollView addSubview:headerView];
}

-(void)setupTextArea:(NSString*) text{
    
    int textTopPadding = -30;
    int readMoreTopPadding = 125;
    double readMoreHeight = 22.5;
    if([SDiPhoneVersion deviceSize] == iPhone35inch){
        textTopPadding = -30;
        readMoreTopPadding = 128;
        readMoreHeight = 22.5;
    }
    else if([SDiPhoneVersion deviceSize] == iPhone4inch){
        textTopPadding = -25;
        readMoreTopPadding = 132;
        readMoreHeight = 22.5;
    }
    else if([SDiPhoneVersion deviceSize] == iPhone47inch){
        textTopPadding = -8;
        readMoreTopPadding = 137;
        readMoreHeight = 26.5;
    }
    else if ([SDiPhoneVersion deviceSize] == iPhone55inch){
        textTopPadding = -10;
        readMoreTopPadding = 136;
        readMoreHeight = 28.5;
    }

    UIView *textArea = [[UIView alloc]initWithFrame:CGRectMake(0, 184, self.view.frame.size.width, 200)];
    
    self.detailTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, textTopPadding, self.view.frame.size.width-30, 187)];
    self.detailTextLabel.textColor = [UIColor colorWithRed:0.043 green:0.031 blue:0.286 alpha:1]; /*#0b0849*/
    self.detailTextLabel.numberOfLines = 5;
    self.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    textArea.backgroundColor = [UIColor whiteColor];
    self.detailTextLabel.text = text;
    [textArea addSubview:self.detailTextLabel];
    
    UIButton *readMoreButton = [[UIButton alloc]initWithFrame:CGRectMake(textArea.frame.size.width - 110, readMoreTopPadding, 92.5, readMoreHeight)];
    [readMoreButton setBackgroundColor:[UIColor colorWithRed:0.925 green:0 blue:0.549 alpha:1] /*#ec008c*/];
    readMoreButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12];
    [readMoreButton setTitle:@"READ MORE" forState:UIControlStateNormal];
    [readMoreButton addTarget:self action:@selector(readMoreDetails) forControlEvents:UIControlEventTouchUpInside];
    [textArea addSubview:readMoreButton];
    
    [self.scrollView addSubview:textArea];
    [self.scrollView sendSubviewToBack:textArea];
}

-(void)setupResouceBlock{
    UIView *resourceview = [[UIView alloc]initWithFrame:CGRectMake(0, 366.5, self.view.frame.size.width, 50)];
    [resourceview setBackgroundColor:[UIColor colorWithRed:0 green:0.682 blue:0.937 alpha:1] /*#00aeef*/];
    
    UILabel *resourceText = [[UILabel alloc]initWithFrame:CGRectMake(16, 8.5, 300, 45)];
    [resourceText setFont:[UIFont fontWithName:@"DINCondensed-Bold" size:28]];
    [resourceText setTextColor:[UIColor whiteColor]];
    resourceText.text = @"RESOURCES";
    
    [resourceview addSubview:resourceText];
    
    [self.scrollView addSubview:resourceview];
}

-(void)setupResourceTableView:(BOOL)isTopic{
    if(isTopic){
        [self setupResourceSectionView:self.topicItemArray];
    }
    else{
        [self setupResourceSectionView:self.opportunityItemArray];
    }
}

-(void)setupResourceSectionView:(NSMutableArray*)dataArray{
    
    UIImageView *bg;
    Callbutton *callBtn;
    WebButton *urlBtn;
    MapButton *mapsBtn;
    UIImage *callImage = [UIImage imageNamed:@"c_icon_call.png"];
    UIImage *webImage = [UIImage imageNamed:@"c_icon_website.png"];
    UIImage *mapsImage = [UIImage imageNamed:@"c_icon_map.png"];
    UIImage *callImageDisabled = [UIImage imageNamed:@"c_icon_call_disabled.png"];
    UIImage *webImageDisabled = [UIImage imageNamed:@"c_icon_website_disabled.png"];
    UIImage *mapsImageDisabled = [UIImage imageNamed:@"c_icon_map_disabled.png"];
    UIFont *helThirtyFour = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    UIFont *helTwentyfour = [UIFont fontWithName:@"HelveticaNeue" size:12];
    
    int phoneLeftPadding = 0;
    int urlLeftPadding = 99;
    int mapsLeftPadding = 196;
    int textWidth = 275;
    if([SDiPhoneVersion deviceSize] == iPhone35inch || [SDiPhoneVersion deviceSize] == iPhone4inch){
        phoneLeftPadding = 0;
        urlLeftPadding = 99;
        mapsLeftPadding = 196;
        textWidth = 275;
    }
    else if([SDiPhoneVersion deviceSize] == iPhone47inch){
        phoneLeftPadding = 12;
        urlLeftPadding = 129;
        mapsLeftPadding = 243;
        textWidth = 300;
    }
    else if ([SDiPhoneVersion deviceSize] == iPhone55inch){
        phoneLeftPadding = 18;
        urlLeftPadding = 147;
        mapsLeftPadding = 278;
        textWidth = 300;
    }

    
    for(int i=0; i<dataArray.count; i++){
        
        if([[[dataArray objectAtIndex:i]name] isEqualToString:self.headerText]){
            
            Item *matchItem = [dataArray objectAtIndex:i];
            
            //for loop to check how many contacts blocks to create
            for(int x=0; x<[matchItem.contactsArray count];x++){
                
                Resource *resource = [matchItem.contactsArray objectAtIndex:x];
                
                bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width -20, 122.5)]; //bg.layer.borderColor = [[UIColor redColor]CGColor]; bg.layer.borderWidth = 1.0f;
                [bg setImage:[UIImage imageNamed:@"c_resource_entry_bg.png"]];
                bg.contentMode = UIViewContentModeScaleToFill;
                
                callBtn = [[Callbutton alloc]initWithFrame:CGRectMake(phoneLeftPadding, 80, 99, 40)];
                [[callBtn imageView]setContentMode:UIViewContentModeScaleAspectFit];
                [callBtn setImage:callImage forState:UIControlStateNormal];
                callBtn.phoneNumber = resource.phoneNumber;
                if([resource.phoneNumber isEqualToString:@"" ]|| resource.phoneNumber == nil){
                    [callBtn setImage:callImageDisabled forState:UIControlStateNormal];
                    callBtn.userInteractionEnabled = NO;
                }
                urlBtn = [[WebButton alloc]initWithFrame:CGRectMake(urlLeftPadding, 80, 99, 40)];
                [[urlBtn imageView]setContentMode:UIViewContentModeScaleAspectFit];
                [urlBtn setImage:webImage forState:UIControlStateNormal];
                urlBtn.urlAddress = resource.websiteAddress;
                if([resource.websiteAddress isEqualToString:@""] || resource.websiteAddress == nil){
                    [urlBtn setImage:webImageDisabled forState:UIControlStateNormal];
                    urlBtn.userInteractionEnabled = NO;
                }
                mapsBtn= [[MapButton alloc]initWithFrame:CGRectMake(mapsLeftPadding, 79, 99, 40)];
                [[mapsBtn imageView]setContentMode:UIViewContentModeScaleAspectFit];
                [mapsBtn setImage:mapsImage forState:UIControlStateNormal];
                mapsBtn.physicalAddress = resource.locationAddress;
                if([resource.locationAddress isEqualToString:@""] || [resource.locationAddress isEqualToString:@"Multiple Locations"] ||resource.locationAddress == nil){
                    [mapsBtn setImage:mapsImageDisabled forState:UIControlStateNormal];
                    mapsBtn.userInteractionEnabled = NO;
                }
                
                [callBtn addTarget:self action:@selector(openCall:) forControlEvents:UIControlEventTouchUpInside];
                [urlBtn addTarget:self action:@selector(openWeb:) forControlEvents:UIControlEventTouchUpInside];
                [mapsBtn addTarget:self action:@selector(openMaps:) forControlEvents:UIControlEventTouchUpInside];
                
                UIView *blockView = [[UIView alloc]initWithFrame:CGRectMake(10, 425 + x*130, self.view.frame.size.width-20, 122.5)];
                
                [blockView addSubview:bg];
                [blockView addSubview:callBtn];
                [blockView addSubview:urlBtn];
                [blockView addSubview:mapsBtn];
                
                UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, textWidth, 35)];
                name.font = helThirtyFour;
                name.textColor = [UIColor colorWithRed:0.043 green:0.031 blue:0.286 alpha:1] /*#0b0849*/;
                name.text = resource.resourceName;
                
                UILabel *address = [[UILabel alloc]initWithFrame:CGRectMake(15, 30, textWidth, 35)];
                address.font = helTwentyfour;
                address.minimumScaleFactor = 0.8;
                address.adjustsFontSizeToFitWidth = YES;
                address.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1] /*666666*/;
                address.text = resource.locationAddress;
                
                UILabel *hours = [[UILabel alloc]initWithFrame:CGRectMake(15, 45, textWidth, 35)];
                hours.font = helTwentyfour;
                hours.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1] /*666666*/;
                hours.text = resource.hours;
                
                [blockView addSubview:name];
                [blockView addSubview:address];
                [blockView addSubview:hours];
                
                [self.scrollView addSubview:blockView];
            }
        }
    }
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

-(void)readMoreDetails{
    [self performSegueWithIdentifier:@"detailsToMoreDetails" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    MoreDetailsViewController *MDVC = [segue destinationViewController];
    MDVC.shortName = shortName;
    MDVC.text = textToSend;
}

-(void)openCall:(id)sender{
    NSString *phoneNumber = [@"telprompt://" stringByAppendingString:[NSString stringWithString:[sender phoneNumber]]];
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

-(void)openWeb:(id)sender{
    NSString *siteUrl = [@"http://" stringByAppendingString:[NSString stringWithString:[sender urlAddress]]];
    UIWebView *webView = [[UIWebView alloc]init];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:siteUrl]]];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:siteUrl]];
}

-(void)openMaps:(id)sender{
    NSString *mapsUrl = [@"http://maps.apple.com/?q=" stringByAppendingString:[sender physicalAddress]];
    mapsUrl = [mapsUrl stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mapsUrl]];
}


-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
