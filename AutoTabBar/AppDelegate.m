//
//  AppDelegate.m
//  AutoTabBar
//
//  Created by cc on 15/9/3.
//  Copyright © 2015年 Snake. All rights reserved.
//

#import "AppDelegate.h"
#import "ccAutoTaBbarController.h"
#import "oneTableViewController.h"
#import "twoTableViewController.h"
#import "threeTableViewController.h"
#import "fourTableViewController.h"
#define darkgreen [UIColor colorWithRed:26/255.0 green:178/255.0 blue:10/255.0 alpha:1]
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    NSArray *arr = @[@"weChat",@"contacts",@"discover",@"me"];
    NSArray *arrH = @[@"weChatHL",@"contactsHL",@"discoverHL",@"meHL"];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:    [oneTableViewController new]];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:    [twoTableViewController new]];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:    [threeTableViewController new]];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:    [fourTableViewController new]];
    ccAutoTaBbarController *tab = [ccAutoTaBbarController new];
    NSArray *arrC = @[nav1,nav2,nav3,nav4,nav4];
    [tab addChildViewControllers:arrC];
    [tab addNormalImages:arr andHightedImages:arrH];
    
    /**
     *  darkgreen = [UIColor colorWithRed:26/255.0 green:178/255.0 blue:10/255.0 alpha:1]
     *  I took this color from appiconImage [UIColor colorWithRed:26/255.0 green:178/255.0 blue:10/255.0 alpha:1]
     *  you may use your own color as same as your app items;
     */
    tab.tintColor = darkgreen;
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.translucent = NO;
    bar.tintColor = darkgreen;
    return YES;
}
@end