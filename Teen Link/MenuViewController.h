//
//  MenuViewController.h
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/5/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *menuMainItems;
    NSArray *subItems;
}

@end
