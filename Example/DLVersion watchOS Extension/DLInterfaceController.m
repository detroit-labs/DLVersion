//
//  DLInterfaceController.m
//  DLVersion watchOS Extension
//
//  Created by Jeff Kelley on 1/11/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "DLInterfaceController.h"
#import <DLVersion/DLVersion.h>

@implementation DLInterfaceController

- (void)willActivate {
    [super willActivate];
    NSLog(@"%@", [DLVersion localVersion]);
    NSLog(@"%@", [DLVersion versionWithString:@"1.2.3"]);
}

@end



