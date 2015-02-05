//
//  DLVersion.h
//  DLVersion
//
//  Created by Nate West on 2/5/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLVersion : NSObject

+ (DLVersion *)localVersion;
+ (DLVersion *)fromString:(NSString *)string;
- (NSString *)string;
- (NSComparisonResult)compare:(DLVersion *)other;

@end
