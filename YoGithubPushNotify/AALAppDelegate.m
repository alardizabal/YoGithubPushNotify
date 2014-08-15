//
//  AALAppDelegate.m
//  YoGithubPushNotify
//
//  Created by Albert Lardizabal on 7/19/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALAppDelegate.h"
#import "AALYoAPIClient.h"
#import "AALConstants.h"
#import "Venmo-iOS-SDK/Venmo.h"

@implementation AALAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Post YO to all subscribers
//    [AALYoAPIClient postYoAllSubscribersWithCompletion:^{
//        NSLog(@"YO");
//    }];
    
    // Get total number of subscribers
    //[AALYoAPIClient getNumberOfSubscribersWithCompletion:nil];
//    [AALYoAPIClient getTestWithCompletion:^{
//        NSLog(@"Visited");
//    }];
    
    [AALYoAPIClient createHookWithFullName:@"alardizabal/theFinalCountdown-ios-002" completionBlock:^{
    }];

//    [AALYoAPIClient getHookWithFullName:@"alardizabal/theFinalCountdown-ios-002" completionBlock:^{
//    }];
    
    [Venmo startWithAppId:kVENMO_APP_ID secret:kVENMO_APP_SECRET name:kVENMO_APP_NAME];
    
    if (![Venmo isVenmoAppInstalled]) {
        [[Venmo sharedInstance] setDefaultTransactionMethod:VENTransactionMethodAPI];
    }
    else {
        [[Venmo sharedInstance] setDefaultTransactionMethod:VENTransactionMethodAppSwitch];
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([[Venmo sharedInstance] handleOpenURL:url]) {
        return YES;
    }
    // You can add your app-specific url handling code here if needed
    return NO;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
