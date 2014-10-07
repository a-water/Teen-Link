//
//  ViewController.h
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/3/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHCSVParser.h"

@interface ViewController : UIViewController <CHCSVParserDelegate>

@property (strong, nonatomic) NSMutableArray *agencyArray;
@property (strong, nonatomic) NSMutableArray *testArray;

@end

