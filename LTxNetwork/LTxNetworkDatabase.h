//
//  LTxNetworkDatabase.h
//  AFNetworking
//
//  Created by liangtong on 2019/3/28.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface LTxNetworkDatabase : NSObject
///#begin
/**
 *    @brief    获取实例化对象
 *
 */
///#end
+(LTxNetworkDatabase*)sharedInstance;

///#begin
/**
 *    @brief    初始化数据表
 *
 */
///#end
+(void)tablesInit;

///#begin
/**
 *    @brief    用户登出
 */
///#end
+(void)userLogout;

///#begin
/**
 *    @brief    清理数据表
 *
 */
///#end
+(void)clearTables;

#pragma mark - 断点下载
/**
 * 增加断点下载任务
 * 源地址，下载后移动的地址，保存的文件名称，是否需要解压
 **/
+(void)addDownloadTaskWithURL:(NSString*)url pathInSandbox:(NSString*)path name:(NSString*)name;
/**
 * 完成断点下载任务
 **/
+(void)finishDownloadTaskWithURL:(NSString*)url;
/**
 * 断点下载任务
 **/
+(NSDictionary*)downloadTaskWithURL:(NSString*)url;
/**
 * 未完成的断点下载任务
 **/
+(NSMutableArray*)unFinishedDownloadTasks;
@end

NS_ASSUME_NONNULL_END
