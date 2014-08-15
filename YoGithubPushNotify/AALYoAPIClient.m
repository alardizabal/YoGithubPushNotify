//
//  AALYoAPIClient.m
//  YoGithubPushNotify
//
//  Created by Albert Lardizabal on 7/19/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALYoAPIClient.h"
#import "AALConstants.h"
#import <AFNetworking.h>

@interface AALYoAPIClient ()

@property (nonatomic) AFHTTPSessionManager *manager;

@end

@implementation AALYoAPIClient

+ (void) getRepositoriesWithCompletion:(void (^)(NSArray *repoArray))completionBlock
{

    NSString *githubGetRepoURL = [NSString stringWithFormat:@"%@/user/repos?sort=updated&direction=desc", kGITHUB_API_URL];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    AFHTTPRequestSerializer *serializer = [[AFHTTPRequestSerializer alloc] init];
    [serializer setAuthorizationHeaderFieldWithUsername:kGITHUB_API_TOKEN password:@""];
    manager.requestSerializer = serializer;
    
    [manager GET:githubGetRepoURL
      parameters:nil
         success:^(NSURLSessionDataTask *task, id responseObject)
    {
        NSLog(@"%@", responseObject);
        completionBlock(responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error)
    {
        NSLog(@"Fail: %@",error.localizedDescription);
    }];
    
}

+ (void) createHookWithFullName:(NSString *)fullName
                completionBlock:(void (^)(void))completionBlock
{

    NSString *githubPostHookURL = [NSString stringWithFormat:@"%@/repos/%@/hooks", kGITHUB_API_URL, fullName];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    AFHTTPRequestSerializer *serializer = [[AFHTTPRequestSerializer alloc] init];
    [serializer setAuthorizationHeaderFieldWithUsername:kGITHUB_API_TOKEN password:@""];
    manager.requestSerializer = serializer;

    NSDictionary *params = @{@"name" : @"web", @"config" : @{@"url" : @"http://shielded-wildwood-4812.herokuapp.com", @"content_type" : @"json"}};
    //NSDictionary *params = @{@"name" : @"web", @"active" : @"true", @"events" : @[@"push"], @"config" : @{@"url" : @"http://shielded-wildwood-4812.herokuapp.com", @"content_type" : @"json"}};
    
    [manager POST:githubPostHookURL
       parameters:params
         success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSLog(@"%@", responseObject);
         completionBlock();
         
     } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         NSLog(@"Fail: %@ %@", githubPostHookURL, error.localizedDescription);
     }];
    
}

+ (void) getHookWithFullName:(NSString *)fullName
             completionBlock:(void (^)(void))completionBlock
{
    
    NSString *githubPostHookURL = [NSString stringWithFormat:@"%@/repos/%@/hooks", kGITHUB_API_URL, fullName];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    AFHTTPRequestSerializer *serializer = [[AFHTTPRequestSerializer alloc] init];
    [serializer setAuthorizationHeaderFieldWithUsername:kGITHUB_API_TOKEN password:@""];
    manager.requestSerializer = serializer;
    
    //NSDictionary *params = @{@"name" : @"web", @"active" : @"TRUE", @"events" : @[@"pull"], @"config" : @{@"url" : @"http://shielded-wildwood-4812.herokuapp.com", @"content_type" : @"json"}};
    
    [manager GET:githubPostHookURL
      parameters:nil
         success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSLog(@"Hook %@", responseObject);
         completionBlock();
         
     } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         NSLog(@"Fail: %@",error.localizedDescription);
     }];
    
}

+ (void) postYoAllSubscribersWithCompletion:(void (^)(void))completionBlock
{
    
    NSString *yoAll = [NSString stringWithFormat:@"%@/yoall/", kYO_API_URL];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSDictionary *params = @{@"api_token" : kYO_API_TOKEN};
    
    [manager POST:yoAll
      parameters:params
         success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSLog(@"%@", responseObject);
         completionBlock();
         
     } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         NSLog(@"Fail: %@",error.localizedDescription);
     }];
    
}

+ (void) getNumberOfSubscribersWithCompletion:(void (^)(void))completionBlock
{

    NSString *yoSubCountURL = [NSString stringWithFormat:@"%@/subscribers_count/?api_token=%@", kYO_API_URL, kYO_API_TOKEN];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:yoSubCountURL
       parameters:nil
          success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSLog(@"Count: %@", responseObject);
         completionBlock();
         
     } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         NSLog(@"Fail: %@",error.localizedDescription);
     }];
    
}

+ (void) getTestWithCompletion:(void (^)(void))completionBlock
{
    
//    NSString *githubGetRepoURL = [NSString stringWithFormat:@"%@/user/repos?sort=updated&direction=desc", kGITHUB_API_URL];
//    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    AFHTTPRequestSerializer *serializer = [[AFHTTPRequestSerializer alloc] init];
//    [serializer setAuthorizationHeaderFieldWithUsername:kGITHUB_API_TOKEN password:@""];
//    manager.requestSerializer = serializer;
    
    [manager GET:@"http://www.google.com"//@"https://shielded-wildwood-4812.herokuapp.com"
      parameters:@{@"content_type" : @"json"}
         success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSLog(@"%@", responseObject);
         completionBlock();
         
     } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         NSLog(@"Fail: %@",error.localizedDescription);
     }];
    
}

@end
