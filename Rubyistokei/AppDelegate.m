//
//  AppDelegate.m
//  Rubyistokei
//
//  Created by kenta-murata on 5/27/13.
//  Copyright (c) 2013 mrkn. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self.webView setMainFrameURL: @"http://rubyistokei.herokuapp.com/"];
    
    NSRect screenFrame = [[NSScreen mainScreen] frame];
    [self.window setStyleMask:NSBorderlessWindowMask];
    [self.window setFrame:screenFrame display:YES];
    [self.window setLevel:kCGDesktopIconWindowLevel - 1];
    [self.window setOpaque:NO];
    [self.window setHasShadow:NO];
}

@end
