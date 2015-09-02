//
//  ccAutoTaBbarController.m
//
//  Created by cc on 15/9/2.
//  Copyright © 2015 Snake. All rights reserved.
//

#import "ccAutoTaBbarController.h"
#import "ccTabbarButton.h"
#import "ccTabbar.h"
@interface ccAutoTaBbarController () <ccTabbarDelegate>
@property (nonatomic,strong) NSArray *arrN;
@property (nonatomic,strong) NSArray *arrH;
@end

@implementation ccAutoTaBbarController

-(UIColor *)tintColor {
    if (_tintColor == nil) {
        _tintColor = [UIColor darkGrayColor];
    }
    return _tintColor;
}
- (void)addChildViewControllers:(NSArray *)controllers {
    self.viewControllers = controllers;
    for (id obj in self.tabBar.subviews) {
        if (![obj isKindOfClass:[ccTabbar class]]) {
            [obj removeFromSuperview];
        }
    }
    
}
- (void)addNormalImages:(NSArray *)imageN andHightedImages:(NSArray *)imageH {
    self.arrN = imageN;
    self.arrH = imageH;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadccTabbar];
}

-(void)loadccTabbar {
    ccTabbar *tab = [[ccTabbar alloc]initWIthImgaes:self.arrN AndHLImages:self.arrH];
    tab.frame = self.tabBar.bounds;
    tab.delegate = self;
    [self.tabBar addSubview:tab];
    for (id obj in self.tabBar.subviews) {
        if (![obj isKindOfClass:[ccTabbar class]]) {
            [obj removeFromSuperview];
        }
    }
    if (self.tintColor) {
        tab.buttonColor = self.tintColor;
    }
}

-(void)ccTabbar:(ccTabbar *)ccTabbar DidSelectedButton:(UIButton *)btn {
    self.selectedIndex = btn.tag;
}

@end

