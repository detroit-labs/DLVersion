//
//  DLViewController.m
//  DLVersion
//
//  Created by Nate West on 02/05/2015.
//  Copyright (c) 2014 Nate West. All rights reserved.
//

#import "DLViewController.h"
#import <DLVersion/DLVersion.h>

@interface DLViewController ()

@end

@implementation DLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", [DLVersion localVersion]);
    NSLog(@"%@", [DLVersion versionFromString:@"1.2.3"]);
}

@end
