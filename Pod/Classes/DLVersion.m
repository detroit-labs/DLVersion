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
    return [NSString stringWithFormat:@"%li.%li.%li", (long)self.major, (long)self.minor, (long)self.patch];
}

- (NSComparisonResult)compare:(DLVersion *)other
{
    if (self.major == other.major) {
        if (self.minor == other.minor) {
            if (self.patch == other.patch) {
                return NSOrderedSame;
            }
            else if (self.patch > other.patch) {
                return NSOrderedDescending;
            }
            else {
                return NSOrderedAscending;
            }
        }
        else if (self.minor > other.minor) {
            return NSOrderedDescending;
        }
        else {
            return NSOrderedAscending;
        }
    }
    else if (self.major > other.major) {
        return NSOrderedDescending;
    }
    else {
        return NSOrderedAscending;
    }
}

- (NSString *)description
{
    return [self string];
}

@end
