//
//  UIImage+Color.h
//  TableViewStretchImage
//
//  Created by dengweihao on 16/5/20.
//  Copyright © 2016年 dengweihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

// 根据颜色生成一张尺寸为1*1的相同颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
