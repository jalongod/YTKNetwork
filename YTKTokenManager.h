//
//  YTKTokenManager.h
//  YTKNetwork iOS
//
//  Created by rong on 2018/3/30.
//  Copyright © 2018年 skyline. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//token刷新成功后的通知
extern NSString * const YTKNotificationTokenGetSuccess;
extern NSString * const YTKNotificationAccessTokenKey;
extern NSString * const YTKNotificationRefreshTokenKey;

@interface YTKTokenManager : NSObject

@property (atomic, assign, readonly)BOOL loadingToken;
@property (nonatomic, copy, readonly)NSString *accessToken;
@property (nonatomic, copy, readonly)NSString *refreshToken;

+ (instancetype)sharedInstance;

- (void)refreshWithAccessToken:(NSString *)accessToken refreshToken:(NSString *)refreshToken;

@end

NS_ASSUME_NONNULL_END
