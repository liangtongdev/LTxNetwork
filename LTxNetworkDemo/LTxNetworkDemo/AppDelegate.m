//
//  AppDelegate.m
//  LTxNetworkDemo
//
//  Created by liangtong on 2019/3/28.
//  Copyright © 2019 LIANGTONG. All rights reserved.
//

#import "AppDelegate.h"
#import <LTxNetwork/LTxNetwork.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self testDownload];
    return YES;
}

-(void)testDownload{
    for (NSInteger i = 1; i < 20; ++i) {
        [[LTxNetworkDownloadService sharedInstance] addDownloadTaskWithURL:@"https://developer.apple.com/ibeacon/Getting-Started-with-iBeacon.pdf?t=2" pathInSandbox:@"Library/Caches" saveName:[NSString stringWithFormat:@"test_download_%td.pdf",i]];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
