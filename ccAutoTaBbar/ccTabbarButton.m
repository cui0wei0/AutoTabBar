//
//  ccTabbarButton.m
//  weChat
//
//  Created by cc on 15/8/22.
//  Copyright (c) 2015 Snake. All rights reserved.
//

#import "ccTabbarButton.h"
@interface ccTabbarButton ()
@property (nonatomic,weak) UILabel *label;

@end
@implementation ccTabbarButton
-(void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
}
-(instancetype)initWithTitle:(NSString *)str {
    if (self = [super init]) {
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:10];
        label.text = str;
        label.textColor = self.labelColor;
        self.label = label;
        
        [self addSubview:label];
    }
    return self;
}

- (void)setTitleStateHightlighted:(BOOL)highlighted {
    if (highlighted) {
        self.label.textColor = self.labelColor;
    } else {
        self.label.textColor = [UIColor grayColor];
    }

}


-(void)setHighlighted:(BOOL)highlighted {
   
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
}


- (void)layoutSubviews {
    [super layoutSubviews];    
    CGSize size = [self.label.text boundingRectWithSize:self.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]} context:nil].size;
    CGFloat w = size.width;
    CGFloat h = 10;
    CGFloat y = self.frame.size.height-h*1.2;
    CGFloat x = (self.frame.size.width - w ) *0.5;
    [self bringSubviewToFront:self.label];
    self.label.frame = CGRectMake(x, y, w, h);
}


@end
