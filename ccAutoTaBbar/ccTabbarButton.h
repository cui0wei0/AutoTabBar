//
//  ccTabbarButton.h
//  weChat
//
//  Created by cc on 15/8/22.
//  Copyright (c) 2015 Snake. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ccTabbarButton : UIButton
@property (nonatomic,strong) UIColor *labelColor;
-(instancetype)initWithTitle:(NSString *)str;
- (void)setTitleStateHightlighted:(BOOL)highlighted;

@end
