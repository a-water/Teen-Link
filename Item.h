//
//  NSObject+Item.h
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/4/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property(strong, nonatomic) NSString *type;
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *text;
@property(strong, nonatomic) NSString *shortName;
@property(strong, nonatomic) NSMutableArray *contactsArray;

-(id)createItem:(NSString*)type andName:(NSString*)name andText:(NSString*)text andShortName:(NSString*)shortName andContacts:(NSMutableArray*)contactsArray;

@end
