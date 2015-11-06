//
//  ViewController.m
//  AffineSample
//
//  Created by awano on 2015/11/05.
//  Copyright © 2015年 awano. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSearch {
    
    UIGraphicsBeginImageContext(self.imageNavigationMap.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *lineColor = [UIColor colorWithRed:0.409 green:0.109 blue:0.109 alpha:0.7];
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    CGContextSetLineWidth(context, 3.5);          // 線の太さ
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 5, 5);
    CGContextAddLineToPoint(context, 50, 80);
    CGContextMoveToPoint(context, 50, 80);
    CGContextAddLineToPoint(context, 150, 350);
    CGContextMoveToPoint(context, 150, 350);
    
    CGContextClosePath(context);
    CGContextStrokePath(context);
    
    self.imageNavigationMap.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

- (IBAction)btnHeadsUp {
    
    
    // ビューを45度回転し，x方向に50px，y方向に100px移動
    CGFloat x = 45.0 * M_PI / 180;
    _imageNavigationMap.transform = CGAffineTransformMake(cos(x), -sin(x), sin(x), cos(x), 50, 100);

}

- (IBAction)btnReRoute {
    
    UIGraphicsBeginImageContext(self.imageNavigationMap.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *lineColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.7];
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    CGContextSetLineWidth(context, 3.5);          // 線の太さ
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 15, 15);
    CGContextAddLineToPoint(context, 15, 80);
    CGContextMoveToPoint(context, 15, 80);
    CGContextAddLineToPoint(context, 150, 80);
    CGContextMoveToPoint(context, 150, 80);
    
    CGContextClosePath(context);
    CGContextStrokePath(context);
    
    self.imageNavigationMap.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}

- (IBAction) btnNorthUp {
 
    _imageNavigationMap.transform = CGAffineTransformIdentity;
    
}

- (IBAction) btnContinuousAffine {
//    _imageNavigationMap.transform = CGAffineTransformIdentity;
    CGFloat rad = 90.0 * M_PI / 180;
    _imageNavigationMap.transform = CGAffineTransformMake(cos(rad), -sin(rad), sin(rad), cos(rad), 100, 200);
}

# pragma mark - UIScrollViewDelegate
// ズームイベントの実装
- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.parentView;
}

@end
