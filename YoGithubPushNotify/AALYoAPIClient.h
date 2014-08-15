//
//  AALYoAPIClient.h
//  YoGithubPushNotify
//
//  Created by Albert Lardizabal on 7/19/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface AALYoAPIClient : NSObject

+ (void) getRepositoriesWithCompletion:(void (^)(NSArray *repoArray))completionBlock;

+ (void) createHookWithFullName:(NSString *)fullName
                completionBlock:(void (^)(void))completionBlock;

+ (void) getHookWithFullName:(NSString *)fullName
             completionBlock:(void (^)(void))completionBlock;

+ (void) postYoAllSubscribersWithCompletion:(void (^)(void))completionBlock;

+ (void) getNumberOfSubscribersWithCompletion:(void (^)(void))completionBlock;

+ (void) getTestWithCompletion:(void (^)(void))completionBlock;

@end
