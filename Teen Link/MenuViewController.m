//
//  MenuViewController.m
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/5/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;

    menuMainItems = [[NSArray alloc]initWithObjects:@"ABOUT TEENLINK",@"TIPS FOR DEALING W/AGENCIES",@"OPEN POSITIONS", @"PARTNER CONTACT INFO", @"EVERYTHING WE DO...", nil];
    
    subItems = [[NSArray alloc]initWithObjects:@"Alcohol, Drugs & Addiction", @"At-Risk Youth", @"Birth Control/Pregnancy", @"Child Abuse", @"Counseling", @"Culturally Specific Agencies", @"Dating & Domestic Violence", @"Eating Disorders", @"Education", @"Employment & Job Training", nil];
    
//    [self setupNavBarItems];
    [self setupTabBar];
    [self setupTableView];
  
}

-(void)setupTabBar{
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    toolbar.tintColor = [UIColor whiteColor];
    NSMutableArray *items = [[NSMutableArray alloc] init];
    UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    flex.width = 10.0f;
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(closeMenu)];
    [closeButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor colorWithRed:236/255.0f green:0/255.0f blue:140/255.0f alpha:1.0f],  NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    [items addObject:flex];
    [items addObject:closeButton];
    [toolbar setItems:items];
    [self.view addSubview:toolbar];
}

-(void)closeMenu{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

-(void)setupTableView{
    UITableView *menuList = [[UITableView alloc]initWithFrame:CGRectMake(0, 66, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    menuList.backgroundColor = [UIColor whiteColor];
    menuList.separatorColor = [UIColor clearColor];
    menuList.delegate = self;
    menuList.dataSource = self;
    [self.view addSubview:menuList];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        if(indexPath.row == [menuMainItems count]-1){
            return 45;
        }
        return 50;
    }
    else{
        return 25;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return [menuMainItems count];
    }
    else{
        return [subItems count];
    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    UIFont *dinFont = [UIFont fontWithName:@"DINCondensed-Bold" size:25];
    UIFont *helFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    
    if(indexPath.section == 0){
        static NSString *CellIdentifier = @"mainCell";
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.text = [menuMainItems objectAtIndex:indexPath.row];
        cell.textLabel.font = dinFont;
        cell.textLabel.textColor = [UIColor colorWithRed:0.431 green:0.431 blue:0.431 alpha:1] /*E6E6E6*/;
        if(indexPath.row != [menuMainItems count] -1){
            
            UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, 2)];
            line.backgroundColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:239/255.0f alpha:1.0f];
            [cell addSubview:line];
        }
        else{
            cell.textLabel.text = @"";
            UILabel *lastMainCell = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, cell.frame.size.width, 30)];
            lastMainCell.text = [menuMainItems objectAtIndex:indexPath.row];
            lastMainCell.font = dinFont;
            lastMainCell.textColor = [UIColor colorWithRed:0.431 green:0.431 blue:0.431 alpha:1] /*E6E6E6*/;
            [cell addSubview:lastMainCell];
        }

    }
    else{
        static NSString *CellIdentifier = @"minorCell";
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.text = [subItems objectAtIndex:indexPath.row];
        cell.textLabel.font = helFont;
        cell.textLabel.textColor = [UIColor colorWithRed:236/255.0f green:0/255.0f blue:140/255.0f alpha:1.0f]; /*EC008C*/;
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)setupNavBarItems
{
    //    UIImageView *logoView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo.png"]];
    //    logoView.frame = CGRectMake(0, 0, 50, 20);
    //    logoView.contentMode = UIViewContentModeScaleAspectFit;
    //    [self.navigationController.navigationBar.topItem setTitleView:logoView];
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
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
