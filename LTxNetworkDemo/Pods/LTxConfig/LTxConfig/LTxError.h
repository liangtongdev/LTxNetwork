//
//  LTxError.h
//  LTxConfig
//
//  Created by liangtong on 2019/3/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LTxError : NSObject
/**
 * @brief 错误代码分析
 *
 * @param     statusCode     HTTP状态编码
 * @param     code     业务返回编码
 * @param     message     业务返回描述
 *
 *  （一）HTTP网络相关
 *  2?:OK
 *  3?:OK
 *  404:访问资源已失效！->log
 *  4？:访问异常(4XX)，我们将尽快解决此问题！  ->log
 *  500:服务异常，请稍后再试！ ->log
 *  5？：服务异常(5XX)，我们将尽快解决此问题！ ->log
 *
 * （二）业务处理相关
 *
 */
+(NSString*)errorTipsWithHttpStatusCode:(NSInteger)statusCode
                                   code:(NSInteger)code
                                   message:(NSString*)message;
@end

NS_ASSUME_NONNULL_END
