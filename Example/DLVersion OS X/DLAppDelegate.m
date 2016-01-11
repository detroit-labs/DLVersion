//
//  DLAppDelegate.m
//  DLVersion OS X
//
//  Created by Jeff Kelley on 1/11/16.
//  Copyright © 2016 Nate West. All rights reserved.
//

#import "DLAppDelegate.h"
#import <DLVersion/DLVersion.h>

@interface DLAppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation DLAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSLog(@"%@", [DLVersion localVersion]);
    NSLog(@"%@", [DLVersion versionWithString:@"1.2.3"]);
}

@end
