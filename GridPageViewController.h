//
//  UIViewController+GridPageViewController.h
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/4/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailPageViewController.h"
#import "Item.h"
#import "Resource.h"

@interface GridPageViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    BOOL resourcesShowing;
}

@property(strong, nonatomic) UIView *resourceView;
@property(strong, nonatomic) UIView *opportunityView;
@property(strong, nonatomic) UIButton *resourceOnButton;
@property(strong, nonatomic) UIButton *opportunityOnButton;
@property(strong, nonatomic) UITableView *resourceList;
@property(strong, nonatomic) UITableView *opportunitesList;
@property(strong, nonatomic) NSArray *jsonArray;
@property(strong, nonatomic) NSMutableArray *topicItemArray;
@property(strong, nonatomic) NSMutableArray *opportunityItemArray;
@property(nonatomic) NSInteger indexRow;
@property(nonatomic) NSInteger tableTag;
@property(nonatomic) BOOL sendToOpporunties;

-(void)switchMainViews:(BOOL)servicesShowing;

@end
