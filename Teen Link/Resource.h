//
//  NSObject+Agency.h
//  Teen Link
//
//  Created by Aaron Waterhouse on 10/3/14.
//  Copyright (c) 2014 Teen Link. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Resource : NSObject

@property (readwrite, nonatomic) NSString* resourceName;
@property (readwrite, nonatomic) NSString* locationAddress;
@property (readwrite, nonatomic) NSString* websiteAddress;
@property (readwrite, nonatomic) NSString* hours;
@property (readwrite, nonatomic) NSString* phoneNumber;

-(id)createResource: (NSString*) resourceName andAddress:(NSString*) locationAddress andWebsite:(NSString*) websiteAddress andHours:(NSString*)hours andPhoneNumber:(NSString*)phoneNumber;

@end
