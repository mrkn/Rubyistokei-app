//
//  AppDelegate.h
//  Rubyistokei
//
//  Created by kenta-murata on 5/27/13.
//  Copyright (c) 2013 mrkn. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebView.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSInteger current_screen;
    Boolean glitch_mode;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet WebView *webView;
@property (assign) IBOutlet NSMenu *screen_menu;

- (IBAction)changeGlitchMode:(id)sender;

@end
