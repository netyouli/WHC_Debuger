//
//  WHC_Debuger.h
//  WHC_Debuger
//
//  Created by WHC on 17/1/14.
//  Copyright © 2017年 WHC. All rights reserved.
//

#import <UIKit/UIKit.h>

#if DEBUG
@interface WHC_Debuger : NSObject

/**
 调试器单利

 @return 调试器
 */
+ (instancetype)share;

/// 自定义要显示的信息
@property (nonatomic, copy)NSString * whc_CustomNote;

/// 显示信息标签
@property (nonatomic, strong, readonly)UILabel * whc_NoteLabel;

@end

#endif
