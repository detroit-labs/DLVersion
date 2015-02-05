//
//  DLVersion.m
//  DLVersion
//
//  Created by Nate West on 2/5/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

#import "DLVersion.h"

@interface DLVersion ()

@property (nonatomic, assign) NSInteger major;
@property (nonatomic, assign) NSInteger minor;
@property (nonatomic, assign) NSInteger patch;

@end

@implementation DLVersion

+ (DLVersion *)localVersion
{
    return [DLVersion fromString:[NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"]];
}

+ (DLVersion *)fromString:(NSString *)string
{
    DLVersion *version = [[DLVersion alloc] init];
    NSArray *parts = [string componentsSeparatedByString:@"."];
    NSInteger numberOfComponents = [parts count];

    if (numberOfComponents > 0) {
        version.major = [parts[0] integerValue];
    }

    if (numberOfComponents > 1) {
        version.minor = [parts[1] integerValue];
    }

    if (numberOfComponents > 2) {
        version.patch = [parts[2] integerValue];
    }

    return version;
}

- (NSString *)string
{
    return [NSString stringWithFormat:@"%i.%i.%i", self.major, self.minor, self.patch];
}

- (NSString *)description
{
    return [self string];
}

@end
