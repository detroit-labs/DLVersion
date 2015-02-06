//
//  DLVersion.m
//  DLVersion
//
//  Created by Nate West on 2/5/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

#import "DLVersion.h"

@interface DLVersion ()

@property (nonatomic, assign) NSUInteger major;
@property (nonatomic, assign) NSUInteger minor;
@property (nonatomic, assign) NSUInteger patch;

@end

@implementation DLVersion

+ (DLVersion *)localVersion
{
    return [self versionWithString:[NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"]];
}

+ (instancetype)versionWithString:(NSString *)string
{
    DLVersion *version = [[self alloc] init];
    NSArray *parts = [string componentsSeparatedByString:@"."];
    NSInteger numberOfComponents = parts.count;

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
    return [NSString stringWithFormat:@"%lu.%lu.%lu", (long)self.major, (long)self.minor, (long)self.patch];
}

- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[DLVersion class]]) {
        return NO;
    }
    
    return [self isEqualToVersion:(DLVersion *)object];
}

- (BOOL)isEqualToVersion:(DLVersion *)version
{
    return (version.major == self.major &&
            version.minor == self.minor &&
            version.patch == self.patch);
}

- (NSUInteger)hash
{
    return self.string.hash;
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
    return self.string;
}

@end
