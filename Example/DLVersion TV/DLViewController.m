//
//  DLViewController.m
//  DLVersion TV
//
//  Created by Jeff Kelley on 1/11/16.
//  Copyright © 2016 Nate West. All rights reserved.
//

#import "DLViewController.h"

#import <DLVersion/DLVersion.h>

@implementation DLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", [DLVersion localVersion]);
    NSLog(@"%@", [DLVersion versionWithString:@"1.2.3"]);
}

@end
