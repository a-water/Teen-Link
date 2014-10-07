//
//  NSObject+Item.m
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/4/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import "Item.h"

@implementation Item

-(id)createItem:(NSString*)type andName:(NSString*)name andText:(NSString*)text andShortName:(NSString*)shortName andContacts:(NSMutableArray*)contactsArray{
    
    self.type = type;
    self.name = name;
    self.text = text;
    self.shortName = shortName;
    self.contactsArray = contactsArray;
    
    return self;
}


@end
