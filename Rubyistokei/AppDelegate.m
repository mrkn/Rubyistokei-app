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
    current_screen = [[NSScreen screens] indexOfObject:[self.window screen]];

    [self.webView setMainFrameURL: @"http://rubyistokei.herokuapp.com/"];

    NSRect screenFrame = [[self.window screen] frame];
    [self.window setStyleMask:NSBorderlessWindowMask];
    [self.window setFrame:screenFrame display:YES];
    [self.window setLevel:kCGDesktopIconWindowLevel - 1];
    [self.window setOpaque:NO];
    [self.window setHasShadow:NO];
    [self.window makeKeyAndOrderFront:self];
    [NSApp unhide:self.window];

    [self screenChanged:NSApp];

    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(screenChanged:)
     name:NSApplicationDidChangeScreenParametersNotification
     object:nil];
}

- (void)screenMenuItemSelected:(NSMenuItem *)sender {
    NSInteger tag = [sender tag];
    if (tag != current_screen) {
        [[self.screen_menu itemAtIndex:current_screen] setState:NSOffState];

        current_screen = tag;
        [[self.screen_menu itemAtIndex:current_screen] setState:NSOnState];

        NSRect screenFrame = [[[NSScreen screens] objectAtIndex:current_screen] frame];
        [self.window setFrame:screenFrame display:YES];
    }
}

- (void)screenChanged:(NSNotification *)notification {
    NSInteger screen_count = [[NSScreen screens] count];
    NSInteger menu_item_count = [[self.screen_menu itemArray] count];
    if (screen_count > menu_item_count) {
        for (NSInteger i = menu_item_count; i < screen_count; ++i) {
            NSString *menu_item_title = nil;
            if (i == 0) {
                menu_item_title = @"Main screen";
            }
            else {
                menu_item_title = [NSString stringWithFormat:@"Screen %ld", i];
            }

            NSMenuItem* menu_item = [[NSMenuItem alloc]
                                     initWithTitle:menu_item_title
                                     action:@selector(screenMenuItemSelected:)
                                     keyEquivalent:@""];
            [menu_item setTarget:self];
            [menu_item setTag:i];
            [self.screen_menu addItem:menu_item];
            
            if (i == current_screen) {
                [menu_item setState:NSOnState];
            }
        }
    }
    else if (screen_count < menu_item_count) {
        for (NSInteger i = screen_count; i < menu_item_count; ++i) {
            [self.screen_menu removeItemAtIndex:screen_count];
        }
    }
}

@end
