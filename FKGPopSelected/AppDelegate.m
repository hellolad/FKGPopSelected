//
//  AppDelegate.m
//  FKGPopSelected
//
//  Created by forkingghost on 16/4/13.
//  Copyright © 2016年 forkingghost. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor colorWithRed:0.26 green:0.51 blue:0.84 alpha:1.0f];
    [self.window makeKeyAndVisible];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    self.window.rootViewController = nav;
    
    return YES;
}

@end
