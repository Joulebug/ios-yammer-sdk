//
// YMAppDelegate.m
//
// Copyright (c) 2015 Microsoft
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "YMAppDelegate.h"

#import "YMSampleHomeViewController.h"
#import "YMLoginClient.h"
#import "UIColor+YamColor.h"

@implementation YMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [application setStatusBarStyle:UIStatusBarStyleLightContent];

    [self configureLoginClient];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Yammer Sample App: YMSampleHomeViewController is a sample with some basic functionality
    self.ymSampleHomeViewController = [[YMSampleHomeViewController alloc] init];

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.ymSampleHomeViewController];
    
    [self styleNavigationBar:navigationController.navigationBar];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)styleNavigationBar:(UINavigationBar *)navigationBar
{
    navigationBar.tintColor = [UIColor whiteColor];
    navigationBar.barTintColor = [UIColor yamBlue];
    navigationBar.translucent = NO;
    navigationBar.titleTextAttributes = @{ NSForegroundColorAttributeName : [UIColor whiteColor] };
}

- (void)configureLoginClient
{
    /* Add your client ID here */
    [[YMLoginClient sharedInstance] setAppClientID:@"APP CLIENT ID"];
    
    /* Add your client secret here */
    [[YMLoginClient sharedInstance] setAppClientSecret:@"APP CLIENT SECRET"];
    
    /* Add your authorization redirect URI here */
    [[YMLoginClient sharedInstance] setAuthRedirectURI:@"AUTH REDIRECT URI"];
}

@end
