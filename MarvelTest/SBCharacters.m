//
//  SBCharacters.m
//  MarvelTest
//
//  Created by Sergiy Bekker on 17.06.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SBCharacters.h"

@implementation SBCharacters

@synthesize ID = _ID;
@synthesize name = _name;
@synthesize descriptions = _descriptions;
@synthesize imageURL = _imageURL;


+ (NSString *)pathPattern {
    return @"/characters";
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:self.ID forKey:@"ID"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.descriptions forKey:@"descriptions"];
    [encoder encodeObject:self.imageURL forKey:@"imageURL"];

}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        self.ID = [decoder decodeObjectForKey:@"ID"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.descriptions = [decoder decodeObjectForKey:@"descriptions"];
        self.imageURL = [decoder decodeObjectForKey:@"imageURL"];
    }
    return self;
}

- (void)dealloc{
    
    [_ID release];
    [_name release];
    [_descriptions release];
    [_imageURL release];

    
    [super dealloc];
}
@end
