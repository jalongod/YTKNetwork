//
//  YTKTokenManager.m
//  YTKNetwork iOS
//
//  Created by rong on 2018/3/30.
//  Copyright © 2018年 skyline. All rights reserved.
//

#import "YTKTokenManager.h"

NSString * const YTKNotificationTokenGetSuccess = @"YTKNotificationTokenGetSuccess";
NSString * const YTKNotificationAccessTokenKey  = @"YTKNotificationAccessTokenKey";
NSString * const YTKNotificationRefreshTokenKey = @"YTKNotificationRefreshTokenKey";

NSString * const YTKUserDefaultAccessTokenKey = @"YTKUserDefaultAccessTokenKey";
NSString * const YTKUserDefaultRefreshTokenKey = @"YTKUserDefaultRefreshTokenKey";

@interface YTKTokenManager(){
    dispatch_queue_t queue;
}

@property (atomic, assign)BOOL loadingToken;
@property (nonatomic, copy)NSString *accessToken;
@property (nonatomic, copy)NSString *refreshToken;

@end

@implementation YTKTokenManager

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static YTKTokenManager *globalYTKTokenManager = nil;
    dispatch_once(&onceToken, ^{
        globalYTKTokenManager = [YTKTokenManager new];
    });
    return globalYTKTokenManager;
}

- (NSString *)accessToken{
    if (!_accessToken) {
        _accessToken = [[NSUserDefaults standardUserDefaults]objectForKey:YTKUserDefaultAccessTokenKey];
        _accessToken = _accessToken?:@"";
    }
    return _accessToken;
}

- (NSString *)refreshToken{
    if (!_refreshToken) {
        _refreshToken = [[NSUserDefaults standardUserDefaults]objectForKey:YTKUserDefaultRefreshTokenKey];
        _refreshToken = _accessToken?:@"";
    }
    return _accessToken;
}

- (void)refreshWithAccessToken:(NSString *)accessToken refreshToken:(NSString *)refreshToken{
    if (self.loadingToken) {
        return;
    }
    if (![accessToken isEqualToString:self.accessToken]||![refreshToken isEqualToString:self.refreshToken]) {
        return;
    }
    //子线程串行请求网络
    self.loadingToken = YES;
    //
    
//    NSDictionary *json = @{@"DeviceId"      : [TLDUUID getUUID],
//                           @"DeviceType"    : @"APP",
//                           @"ReqSource"     : @"4",
//                           @"refreshToken"  : refreshToken
//                           };
//    NSString *encrypJson = [TLDDesEncrytor DESEncrypUserApiSGPlainText:[json toJSONString]];
//    NSDictionary *encrypParamsDic = @{@"SID"            : @"UserAPI-APP-NRefreshToken",
//                                      @"refreshToken"   : encrypJson};
    
    
    __weak typeof(self) weakself = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        __strong typeof(self) strongself = weakself;
        __weak typeof(self) weakself = strongself;
        sleep(3);
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof(self) strongself = weakself;
            strongself.loadingToken = YES;
            [[NSNotificationCenter defaultCenter]postNotificationName:YTKNotificationTokenGetSuccess  object:@{YTKNotificationAccessTokenKey:@"new--AccessToken",YTKNotificationRefreshTokenKey:@"new--RefreshToken"}];
        });
    });
}

@end
