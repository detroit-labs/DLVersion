//
//  DLVersion.h
//  DLVersion
//
//  Created by Nate West on 2/5/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLVersion : NSObject

@property (nonatomic, readonly) NSString *string;

+ (DLVersion *)localVersion;
+ (instancetype)versionWithString:(NSString *)string;

- (NSComparisonResult)compare:(DLVersion *)other;
- (BOOL)isEqualToVersion:(DLVersion *)version;

@end
