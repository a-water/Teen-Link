//
//  UIViewController+GridPageViewController.m
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/4/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import "GridPageViewController.h"

@implementation GridPageViewController : UIViewController

-(void)viewWillAppear:(BOOL)animated{
    if(self.sendToOpporunties == YES){
        [self switchMainViews:YES];
    }
    NSIndexPath *selected = [self.resourceList indexPathForSelectedRow];
    if (selected) [self.resourceList deselectRowAtIndexPath:selected animated:NO];
    NSIndexPath *selectedOpps = [self.opportunitesList indexPathForSelectedRow];
    if (selectedOpps) [self.opportunitesList deselectRowAtIndexPath:selectedOpps animated:NO];
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    [self setupNavBarItems];
      
    resourcesShowing = YES;
    
    [self setupTwoMainViews];
    [self setupSwitcherButtons];
    [self setupTableViews];
    

}

-(NSArray*)parseDetailJSON:(NSURL*)filePath{
    
    NSError *e = nil;
    NSData *jsonData = [NSData dataWithContentsOfURL:filePath];
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&e];
    
    return jsonArray;
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

-(void)setupTwoMainViews{
    
    self.resourceView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height -100)];
    self.opportunityView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-100)];

    [self.resourceView setBackgroundColor:[UIColor whiteColor]];
    [self.opportunityView setBackgroundColor:[UIColor whiteColor]];
    
    [self.opportunityView setHidden:YES];
    
    
    [self.view addSubview:self.resourceView];
    [self.view addSubview:self.opportunityView];
    
}

-(void)setupSwitcherButtons{
    
    self.resourceOnButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width/2, 50)];
    self.opportunityOnButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 64, self.view.frame.size.width/2, 50)];
    
    [self.resourceOnButton setBackgroundColor:[UIColor colorWithRed:0.925 green:0 blue:0.549 alpha:1] /*#ec008c*/];
    [self.opportunityOnButton setBackgroundColor:[UIColor colorWithRed:0.925 green:0 blue:0.549 alpha:1] /*#ec008c*/];
    
    [self.resourceOnButton setTitle:@"SERVICES" forState:UIControlStateNormal];
    [self.opportunityOnButton setTitle:@"OPPORTUNITIES" forState:UIControlStateNormal];
    
    [self.resourceOnButton setTitleEdgeInsets:UIEdgeInsetsMake(10, 0, 0, 0)];
    [self.opportunityOnButton setTitleEdgeInsets:UIEdgeInsetsMake(10, 0, 0, 0)];
    
    self.resourceOnButton.titleLabel.font = [UIFont fontWithName:@"DINCondensed-Bold" size:28];
    self.opportunityOnButton.titleLabel.font = [UIFont fontWithName:@"DINCondensed-Bold" size:28];
    
    [self.resourceOnButton addTarget:self action:@selector(switchMainViews:) forControlEvents:UIControlEventTouchUpInside];
    [self.opportunityOnButton addTarget:self action:@selector(switchMainViews:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.resourceOnButton setUserInteractionEnabled:NO];
    self.opportunityOnButton.alpha = 0.5;
    
    [self.view addSubview:self.resourceOnButton];
    [self.view addSubview:self.opportunityOnButton];

}

-(void)setupTableViews{
    self.resourceList = [[UITableView alloc]initWithFrame:CGRectMake(0, 15, self.view.frame.size.width, self.resourceView.frame.size.height-15) style:UITableViewStylePlain];
    self.opportunitesList = [[UITableView alloc]initWithFrame:CGRectMake(0, 15, self.view.frame.size.width, self.opportunityView.frame.size.height -15) style:UITableViewStylePlain];
    
    self.resourceList.separatorColor = [UIColor clearColor];
    self.opportunitesList.separatorColor = [UIColor clearColor];
    self.resourceList.delegate = self;
    self.opportunitesList.delegate = self;
    self.resourceList.dataSource = self;
    self.opportunitesList.dataSource = self;
    self.resourceList.tag = 100;
    self.opportunitesList.tag = 200;
    
    [self.resourceView addSubview:self.resourceList];
    [self.opportunityView addSubview:self.opportunitesList];
    self.automaticallyAdjustsScrollViewInsets = NO;

    
}

-(void)switchMainViews:(BOOL)servicesShowing{
    
    if(resourcesShowing){
        [self.resourceView setHidden:YES];
        [self.opportunityView setHidden:NO];
        [self.opportunityOnButton setUserInteractionEnabled:NO];
        [self.resourceOnButton setUserInteractionEnabled:YES];
        self.resourceOnButton.alpha = 0.5;
        self.opportunityOnButton.alpha = 1.0;
        resourcesShowing = NO;
    }
    else{
        [self.resourceView setHidden:NO];
        [self.opportunityView setHidden:YES];
        [self.opportunityOnButton setUserInteractionEnabled:YES];
        [self.resourceOnButton setUserInteractionEnabled:NO];
        self.opportunityOnButton.alpha = 0.5;
        self.resourceOnButton.alpha = 1.0;
        resourcesShowing = YES;
    }
    
    if(self.sendToOpporunties == YES){
        self.sendToOpporunties = NO;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView.tag == 100){
        //Resource table
        return [self.topicItemArray count];
        
    }
    else if(tableView.tag == 200){
        //Opp table
        return [self.opportunityItemArray count];
    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    
    UIFont *dinFont = [UIFont fontWithName:@"DINCondensed-Bold" size:25];
    UIColor *cellFontColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1] /*#666666*/;
    UIColor *everyOtherCellColor = [UIColor colorWithRed:0.937 green:0.937 blue:0.937 alpha:1] /*#efefef*/;
    
    if(tableView.tag == 100){
        //Resource table
        static NSString *CellIdentifier = @"resCell";
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        UILabel *cellTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, cell.frame.size.width, 30)];
        cellTextLabel.font = dinFont;
        cellTextLabel.textColor = cellFontColor;
        cellTextLabel.text = [[[self.topicItemArray objectAtIndex:indexPath.row]name]uppercaseString];
        [cell addSubview:cellTextLabel];
        if(indexPath.row % 2 != 0){
            cell.backgroundColor = everyOtherCellColor;
        }

    }
    else if(tableView.tag == 200){
        //Opp table
        static NSString *CellIdentifier = @"oppCell";
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        UILabel *cellTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, cell.frame.size.width, 30)];
        cellTextLabel.font = dinFont;
        cellTextLabel.textColor = cellFontColor;
        cellTextLabel.text = [[[self.opportunityItemArray objectAtIndex:indexPath.row]name]uppercaseString];
        [cell addSubview:cellTextLabel];
        if(indexPath.row % 2 != 0){
            cell.backgroundColor = everyOtherCellColor;
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.indexRow = indexPath.row;
    self.tableTag = tableView.tag;
    
    [self performSegueWithIdentifier:@"gridToDetailPage" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    DetailPageViewController *DPVC = [segue destinationViewController];
    
    if(self.tableTag == 100){
        DPVC.topicItemArray = [NSMutableArray arrayWithArray:self.topicItemArray];
        DPVC.headerText = [[self.topicItemArray objectAtIndex:self.indexRow]name];
        DPVC.detailTextString = [[self.topicItemArray objectAtIndex:self.indexRow]paragraphText];
        DPVC.isTopic = YES;
    }
    else if(self.tableTag == 200){
        DPVC.opportunityItemArray = [NSMutableArray arrayWithArray:self.opportunityItemArray];
        DPVC.headerText = [[self.opportunityItemArray objectAtIndex:self.indexRow]name];
        DPVC.detailTextString = [[self.opportunityItemArray objectAtIndex:self.indexRow]paragraphText];
        DPVC.isTopic = NO;
    }

}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
