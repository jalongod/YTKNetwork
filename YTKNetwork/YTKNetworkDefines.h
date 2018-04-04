//
//  YTKNetworkDefines.h
//  Pods
//
//  Created by rong on 2018/4/3.
//

#ifndef YTKNetworkDefines_h
#define YTKNetworkDefines_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class YTKBaseRequest;

typedef void (^YTKGetTokenCallback)(BOOL success);

@protocol YTKGetTokenProtocol <NSObject>

- (BOOL) requestingToken;
- (void) requestTokenWithCallBack:(nullable YTKGetTokenCallback)callBack;

@end

@protocol YTKNetBreakProtocol <NSObject>

- (BOOL) shouldResumeRequestImmediately:(YTKBaseRequest *)request;
- (BOOL) shouldBreakForTokenInvalid:(YTKBaseRequest *)request;
- (BOOL) shouldBreakNetwork:(YTKBaseRequest *)request;//本地时间与服务器时间校验不一致

@end

NS_ASSUME_NONNULL_END
#endif /* YTKNetworkDefines_h */
