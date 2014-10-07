//
//  UIViewController+DetailPageViewController.h
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/4/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "Resource.h"
#import "Callbutton.h"
#import "WebButton.h"
#import "MapButton.h"
#import "MoreDetailsViewController.h"

@interface DetailPageViewController : UIViewController{
    UIFont      *helveticaNeueRegular;
    UIFont      *helveticaNeueLight;
    UIFont      *helveticaNeueBold;
    NSString    *shortName;
    NSString    *textToSend;
}

@property (strong, nonatomic) UIScrollView      *scrollView;
@property (strong, nonatomic) NSString          *headerText;
@property (strong, nonatomic) UILabel           *detailTextLabel;
@property (strong, nonatomic) NSString          *detailTextString;
@property (strong, nonatomic) UILabel           *titleLabel;
@property (strong, nonatomic) NSString          *phoneNumber;
@property (strong, nonatomic) NSString          *webUrl;
@property (strong, nonatomic) NSString          *mapAddress;
@property(strong, nonatomic) NSMutableArray     *topicItemArray;
@property(strong, nonatomic) NSMutableArray     *opportunityItemArray;
@property(nonatomic) BOOL                        isTopic;

@end
