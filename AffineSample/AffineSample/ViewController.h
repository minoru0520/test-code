//
//  ViewController.h
//  AffineSample
//
//  Created by awano on 2015/11/05.
//  Copyright © 2015年 awano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *parentView;

@property (weak, nonatomic) IBOutlet UIImageView *imageNavigationMap;

- (IBAction) btnSearch;
- (IBAction) btnHeadsUp;
- (IBAction) btnReRoute;
- (IBAction) btnNorthUp;
- (IBAction) btnContinuousAffine;

@end

