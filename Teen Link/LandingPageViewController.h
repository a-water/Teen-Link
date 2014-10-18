//
//  UIViewController+LandingPageViewController.h
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/4/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridPageViewController.h"
#import "SDiPhoneVersion.h"

@interface LandingPageViewController : UIViewController
{
    BOOL sendToOpportunity;
    int boxClickedIndexToUse;
}

@property(strong, nonatomic) NSArray            *jsonArray;
@property(strong, nonatomic) NSMutableArray     *topicItemArray;
@property(strong, nonatomic) NSMutableArray     *opportunityItemArray;
@property(nonatomic) int                         suicideIndex;
@property(nonatomic) int                         alcoholIndex;
@property(nonatomic) int                         volunteeringIndex;
@property(nonatomic) int                         youthIndex;

@end
