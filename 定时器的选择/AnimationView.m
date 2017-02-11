//
//  AnimationView.m
//  定时器的选择
//
//  Created by 张艳楠 on 2017/1/21.
//  Copyright © 2017年 zhang yannan. All rights reserved.
//

#import "AnimationView.h"
static CGFloat _snow=0;
@implementation AnimationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //要想绘制图片到view上，必须写在drawRect里面
    UIImage *image=[UIImage imageNamed:@"123"];
    [image drawAtPoint:CGPointMake(50, _snow)];
    _snow  = _snow + 10;
    if (_snow>rect.size.height) {
        _snow=0;
    }
}
-(void)awakeFromNib{
    /*
        如果绘图的时候需要用到定时器用CADisplayLink
     */
    //创建定时器
    [super awakeFromNib];
//    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];
    //添加到主运行循环里面
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}
-(void)timeChange{
    [self setNeedsDisplay];
}
@end
