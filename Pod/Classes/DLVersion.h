//
//  DLVersion.h
//  DLVersion
//
//  Created by Nate West on 2/5/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, DLVersionComparison) {
    DLVersionComparisonSame,
    DLVersionComparisonOlder,
    DLVersionComparisonNewer
};

@interface DLVersion : NSObject

+ (DLVersion *)localVersion;
+ (DLVersion *)fromString:(NSString *)string;
- (NSString *)string;
- (DLVersionComparison)compare:(DLVersion *)other;

@end
