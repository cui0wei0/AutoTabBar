//
//  ccTabbar.m
//
//  Created by cc on 15/9/2.
//  Copyright © 2015 Snake. All rights reserved.
//

#import "ccTabbar.h"
#import "ccTabbarButton.h"

@interface ccTabbar ()
@property (nonatomic,strong) NSMutableArray *btns;
@property (nonatomic,strong) ccTabbarButton *currentBtn;

@end
@implementation ccTabbar

-(NSArray *)btns {
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}
-(instancetype)initWIthImgaes:(NSArray *)images AndHLImages:(NSArray *)imagesHL {
    if (self = [super init]) {
        for (int i = 0; i < images.count; i++) {
            ccTabbarButton *btn = [[ccTabbarButton alloc]initWithTitle:images[i]];
//            UIImage *newImage = [self colorizeImage:[UIImage imageNamed:images[i]] withColor:self.buttonColor];
            [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:imagesHL[i]] forState:UIControlStateSelected];
            btn.tag = i;
            [self.btns addObject:btn];
            [self addSubview:btn];
        }
    }
    return self;
}

//-(void)loadbtnsWithImages:(NSArray *)images {
//    for (int i = 0; i < images.count; i++) {
//        ccTabbarButton *btn = [[ccTabbarButton alloc]initWithTitle:images[i]];
//        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@HL",images[i]]] forState:UIControlStateSelected];
//        btn.tag = i;
//        [self.btns addObject:btn];
//        [self addSubview:btn];
//    }
//}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.frame = self.superview.bounds;
    CGFloat w = self.frame.size.width / self.btns.count;
    for (int i = 0; i < self.btns.count; i++) {
        ccTabbarButton *btn = self.btns[i];
        btn.frame = CGRectMake(w * i, self.frame.origin.y, w, self.frame.size.height);
        [btn addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchDown];
        btn.labelColor = self.buttonColor;
        if (i == 0) {
            [self go:btn];
        }
    }
}

- (void)go:(ccTabbarButton *)btn {
    [self.currentBtn setSelected:NO];
    [self.currentBtn setTitleStateHightlighted:NO];
    if (!btn.isSelected) {
        [btn setSelected:YES];
        [btn setTitleStateHightlighted:YES];
        
    }
    self.currentBtn = btn;
    if ([self.delegate respondsToSelector:@selector(ccTabbar:DidSelectedButton:)]) {
        [self.delegate ccTabbar:self DidSelectedButton:btn];
    }
}
-(UIImage *)colorizeImage:(UIImage *)baseImage withColor:(UIColor *)theColor {
    UIGraphicsBeginImageContext(baseImage.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, baseImage.size.width, baseImage.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSaveGState(ctx);
    CGContextClipToMask(ctx, area, baseImage.CGImage);
    
    [theColor set];
    CGContextFillRect(ctx, area);
    
    CGContextRestoreGState(ctx);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextDrawImage(ctx, area, baseImage.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
