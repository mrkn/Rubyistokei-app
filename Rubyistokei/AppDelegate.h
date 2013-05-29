//
//  AppDelegate.h
//  Rubyistokei
//
//  Created by kenta-murata on 5/27/13.
//  Copyright (c) 2013 mrkn. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebView.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet WebView *webView;

@end
