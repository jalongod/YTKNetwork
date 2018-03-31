//
//  YTKInterpreter.h
//  YTKNetwork iOS
//
//  Created by rong on 2018/3/30.
//  Copyright © 2018年 skyline. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YTKTokenDelegate<NSObject>

- (BOOL)requestTokenSuccess:(NSString *)accessToken refreshToken:(NSString *)refreshToken;

@end

@interface YTKInterpreter : NSObject

@property (atomic, assign, readonly)BOOL loadingToken;
@property (nonatomic, copy, readonly)NSString *accessToken;
@property (nonatomic, copy, readonly)NSString *refreshToken;

+ (instancetype)sharedInstance;

@property (nonatomic, weak)id <YTKTokenDelegate> delegate;

- (void)requestToken;

@end
