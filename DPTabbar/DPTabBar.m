//
//  DPTabBar.m
//  DPTabbar
//
//  Created by 赵朋 on 2017/6/12.
//  Copyright © 2017年 zhaopeng. All rights reserved.
//

#import "DPTabBar.h"
#import "DPButton.h"

#define SCREEN_WIDTH self.frame.size.width

@interface  DPTabBar()

@property (nonatomic, strong) DPButton *selectBtn;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) DPButton *forumButton;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation DPTabBar

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        [self addBarButton];
    }
    return self;
}

- (void)addBarButton{
    
    self.lineView = [UIView new];
    self.lineView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0.5);
    self.lineView.backgroundColor = [UIColor grayColor];
    [self addSubview:self.lineView];
    
    self.buttons = [NSMutableArray array];
    
    NSMutableArray *imageNames = [NSMutableArray array];
    NSMutableArray *selImageNames = [NSMutableArray array];
    
    imageNames = [self addEveryImage];
    selImageNames = [self addEverySelImage];
    
    for (int i = 0; i<5; i++) {
        DPButton *btn = [[DPButton alloc] init];
        CGFloat btnW = self.frame.size.width/5;
        CGFloat btnX = i * btnW;
        CGFloat btnY = 0.5;
        CGFloat btnH = 49;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);

        [btn setImage:[UIImage imageNamed:imageNames[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selImageNames[i]] forState:UIControlStateSelected];
        btn.tag = i;
        [self.buttons addObject:btn];
        
        [self addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i==2) {
            self.forumButton = btn;
        }
        
        if (i == 0) {
            [self btnClick:btn];
        }
    }
}

- (void)btnClick:(DPButton *)button{
    
    [self updateFrameWithBtn:button];
    
    self.selectBtn.selected = NO;
    
    if (self.DPdelegate &&[self.DPdelegate respondsToSelector:@selector(tabbarFrom:to:)]) {
        [self.DPdelegate
         tabbarFrom:self.selectBtn.tag to:button.tag];
    }
    
    self.selectBtn = button;
    self.selectBtn.selected = YES;
}

- (void)updateFrameWithBtn:(DPButton *)button{
    
    if (button==self.forumButton) {
        self.forumButton.frame = CGRectMake(button.frame.origin.x, -23, button.frame.size.width, 72);
        self.forumButton.backgroundColor = [UIColor clearColor];
        self.forumButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    } else {
        self.forumButton.frame = CGRectMake(self.forumButton.frame.origin.x, 0, self.forumButton.frame.size.width, 49);
    }
    
}

- (NSMutableArray *)addEveryImage{
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@"tab_home_normal"];
    [array addObject:@"tab_category_normal"];
    [array addObject:@"tab_forum_normal"];
    [array addObject:@"tab_buycar_normal"];
    [array addObject:@"tab_center_normal"];
    
    return array;
}

- (NSMutableArray *)addEverySelImage{
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@"tab_home_select"];
    [array addObject:@"tab_category_select"];
    [array addObject:@"tab_forum_select"];
    [array addObject:@"tab_buycar_select"];
    [array addObject:@"tab_center_select"];
    
    return array;
}

@end
