//
//  DPTabbarController.m
//  DPTabbar
//
//  Created by 赵朋 on 2017/6/14.
//  Copyright © 2017年 zhaopeng. All rights reserved.
//

#import "DPTabbarController.h"
#import "DPTabBar.h"

@interface DPTabbarController ()<DPTabBarDelegate,UINavigationControllerDelegate>


@end

@implementation DPTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customTabbarView];
}

- (void)customTabbarView{
    
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    self.tabBar.clipsToBounds = NO;
    
    DPTabBar *tabbar = [[DPTabBar alloc] initWithFrame:self.tabBar.bounds];
    tabbar.DPdelegate = self;
    tabbar.frame = CGRectMake(0, 0, 320,self.tabBar.frame.size.height);
    [self.tabBar addSubview:tabbar];
}
- (void)tabbarFrom:(NSInteger)from to:(NSInteger)to{
    
    self.selectedIndex = to;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
