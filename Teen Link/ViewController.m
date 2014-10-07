//
//  ViewController.m
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/3/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.agencyArray = [[NSMutableArray alloc]init];
    self.testArray = [[NSMutableArray alloc]init];
    
    NSURL *csvURL = [[NSBundle mainBundle] URLForResource: @"KATHYK_TEEN_DATA_9_30_2014" withExtension:@"csv"];
    CHCSVParser *csvParser = [[CHCSVParser alloc]initWithContentsOfCSVURL:csvURL];
    [csvParser setRecognizesBackslashesAsEscapes:YES];
    [csvParser setDelegate:self];
    [csvParser parse];
    
    NSLog(@"%lu", (unsigned long)[self.agencyArray count]);
}

- (void) parser:(CHCSVParser *)parser didStartLine:(NSUInteger)lineNumber {
    self.testArray = [[NSMutableArray alloc] init];
}
- (void) parser:(CHCSVParser *)parser didReadField:(NSString *)field {
    [self.testArray addObject:field];
    
}
- (void) parser:(CHCSVParser *)parser didEndLine:(NSUInteger)lineNumber {
//    NSLog(@"finished line! %@", self.testArray);
    [self.agencyArray addObject:self.testArray];
    [self.testArray removeAllObjects];
}


- (void)parser:(CHCSVParser *)parser didFailWithError:(NSError *)error {
    NSLog(@"ERROR: %@", error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
