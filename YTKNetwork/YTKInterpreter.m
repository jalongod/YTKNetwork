//
//  YTKInterpreter.m
//  YTKNetwork iOS
//
//  Created by rong on 2018/3/30.
//  Copyright © 2018年 skyline. All rights reserved.
//

#import "YTKInterpreter.h"

@interface YTKInterpreter(){
    dispatch_queue_t queue;
}

@property (atomic, assign)BOOL loadingToken;
@property (nonatomic, copy)NSString *accessToken;
@property (nonatomic, copy)NSString *refreshToken;

@end

@implementation YTKInterpreter

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static YTKInterpreter *globalYTKInterpreter = nil;
    dispatch_once(&onceToken, ^{
        globalYTKInterpreter = [YTKInterpreter new];
    });
    return globalYTKInterpreter;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _accessToken = @"accessToken";
        _refreshToken = @"refreshToken";
        
        queue = dispatch_get_global_queue(0 , 0);
    }
    return self;
}

- (BOOL)validToken:(NSString *)accessToken refreshToken:(NSString *)refreshToken{
    return YES;
}

- (void)requestToken{
    if (self.loadingToken) {
        return;
    }
    //子线程串行请求网络
    self.loadingToken = YES;
    //
    __weak typeof(self) weakself = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        __strong typeof(self) strongself = weakself;
        __weak typeof(self) weakself = strongself;
        sleep(3);
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof(self) strongself = weakself;
            strongself.loadingToken = YES;
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ytknetworktokensuccess"  object:@{@"atoken":@"newAccessToken",@"ntoken":@"newRefreshToken"}];
            if (strongself.delegate && [strongself.delegate respondsToSelector:@selector(requestTokenSuccess:refreshToken:)]) {
                [strongself.delegate requestTokenSuccess:@"newAccessToken"  refreshToken:@"newRefreshToken"];
            }
        });
    });
}



@end
