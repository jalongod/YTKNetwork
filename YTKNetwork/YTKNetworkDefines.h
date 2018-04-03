//
//  YTKNetworkDefines.h
//  Pods
//
//  Created by rong on 2018/4/3.
//

#ifndef YTKNetworkDefines_h
#define YTKNetworkDefines_h

#import <Foundation/Foundation.h>

@class YTKBaseRequest;

typedef void (^YTKGetTokenCallback)(BOOL success);

@protocol YTKGetTokenProtocol <NSObject>

- (BOOL) loadingToken;
- (void) requestTokenWithCallBack:(YTKGetTokenCallback)callBack;

@end

@protocol YTKNetBreakProtocol <NSObject>

- (BOOL) shouldBreakByRequest:(YTKBaseRequest*)quest;
- (BOOL) shouldRefreshTimeByRequest:(YTKBaseRequest*)quest;//本地时间与服务器时间校验不一致

@end


#endif /* YTKNetworkDefines_h */
