//
//  LTxConfig.h
//  Pods-LTxConfigDemo
//
//  Created by liangtong on 2019/3/28.
//

#import <Foundation/Foundation.h>
#import "LTxMacroDef.h"//宏定义
#import "LTxError.h"//错误码

NS_ASSUME_NONNULL_BEGIN
/**
 * 配置文件
 * 默认从工程Bundle中读取LTxConfig.plist文件
 **/
@interface LTxConfig : NSObject

/**
 * 单例模式
 **/
+ (instancetype)sharedInstance;

/**
 * 系统初始化
 **/
- (void)appSetup;

#pragma mark - 颜色
@property (nonatomic, strong) UIColor* skinColor;
@property (nonatomic, strong) UIColor* hintColor;
@property (nonatomic, strong) UIColor* activityViewBackgroundColor;
@property (nonatomic, strong) UIColor* viewBackgroundColor;
@property (nonatomic, strong) UIColor* cellContentViewColor;
@property (nonatomic, assign) CGColorRef cellContentViewShadowColor;

#pragma mark

@property (nonatomic, readonly) BOOL isDebug;

#pragma mark - 签名验证
@property (nonatomic, readonly) BOOL signature;//是否开启签名验证
@property (nonatomic, readonly) NSString* signatureToken;//签名验证时的Token

#pragma mark - host
@property (nonatomic, copy) NSString* host;
@property (nonatomic, copy) NSString* messageHost;
@property (nonatomic, copy) NSString* eepmHost;
@property (nonatomic, copy) NSString* serviceHost;
@property (nonatomic, copy) NSString* shareHost;

#pragma mark - 系统配置
@property (nonatomic, copy) NSString* appId;
@property (nonatomic, copy) NSString* pushId;
@property (nonatomic, copy) NSNumber* userId;
@property (nonatomic, copy) NSString* userNumber;
@property (nonatomic, assign) NSInteger pageSize;

#pragma mark - 其他
@property (nonatomic, copy) NSString* instalUrl;
@property (nonatomic, copy) NSString* instalTip;
@property (nonatomic, copy) NSString* aboutTip;
@property (nonatomic, copy) NSString* loginTip;
@property (nonatomic, assign) BOOL cameraAlbumCustom;// 保存相片/视频时，是否使用自定义相册

#pragma mark - 下载
//是否后台下载
@property (nonatomic, readonly) BOOL enableBackgroundDownload;
//某个时间点上最大的下载个数(大于0)，默认为2
@property (nonatomic, readonly) NSInteger maxDownloadingCount;
@end

NS_ASSUME_NONNULL_END
