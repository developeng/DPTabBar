//
//  DPTabBar.h
//  DPTabbar
//
//  Created by 赵朋 on 2017/6/12.
//  Copyright © 2017年 zhaopeng. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol  DPTabBarDelegate<NSObject>

- (void)tabbarFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface DPTabBar : UITabBar

@property (nonatomic, weak)id<DPTabBarDelegate> DPdelegate;



@end
