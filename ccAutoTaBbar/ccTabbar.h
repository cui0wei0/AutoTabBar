//
//  ccTabbar.h
//
//  Created by cc on 15/9/2.
//  Copyright © 2015 Snake. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ccTabbar;
@protocol ccTabbarDelegate <NSObject>
- (void)ccTabbar:(ccTabbar *)ccTabbar DidSelectedButton:(UIButton *)btn;

@end

@interface ccTabbar : UIView
@property (nonatomic,strong) UIColor *buttonColor;

@property (nonatomic,weak) id<ccTabbarDelegate> delegate;

-(instancetype)initWIthImgaes:(NSArray *)images AndHLImages:(NSArray *)imagesHL;

@end

