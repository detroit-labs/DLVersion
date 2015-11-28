//
//  DLVersion.h
//  DLVersion
//
//  Created by Nate West on 2/5/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef NS_ASSUME_NONNULL_BEGIN
#define DLVERSION_ASSUME_NONNULL_BEGIN
#else
#define DLVERSION_ASSUME_NONNULL_BEGIN NS_ASSUME_NONNULL_BEGIN
#endif

#ifndef NS_ASSUME_NONNULL_END
#define DLVERSION_ASSUME_NONNULL_END
#else
#define DLVERSION_ASSUME_NONNULL_END NS_ASSUME_NONNULL_END
#endif

DLVERSION_ASSUME_NONNULL_BEGIN

@interface DLVersion : NSObject

@property (nonatomic, readonly) NSString *string;

+ (DLVersion *)localVersion;
+ (instancetype)versionWithString:(NSString *)string;

- (NSComparisonResult)compare:(DLVersion *)other;
- (BOOL)isEqualToVersion:(DLVersion *)version;
- (BOOL)isOlderThanVersion:(DLVersion *)version;
- (BOOL)isNewerThanVersion:(DLVersion *)version;

@end

DLVERSION_ASSUME_NONNULL_END
