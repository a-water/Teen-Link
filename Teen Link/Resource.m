//
//  NSObject+Agency.m
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/3/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import "Resource.h"

@implementation Resource

-(id)createResource: (NSString*) resourceName andAddress:(NSString*) locationAddress andWebsite:(NSString*) websiteAddress andHours:(NSString*)hours andPhoneNumber:(NSString*)phoneNumber
{    
    self.resourceName = resourceName;
    self.locationAddress = locationAddress;
    self.websiteAddress = websiteAddress;
    self.hours = hours;
    self.phoneNumber = phoneNumber;
    
    return self;
}

@end
