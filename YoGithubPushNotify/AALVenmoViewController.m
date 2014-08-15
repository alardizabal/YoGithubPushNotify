//
//  AALVenmoViewController.m
//  YoGithubPushNotify
//
//  Created by Albert Lardizabal on 7/22/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALVenmoViewController.h"
#import "Venmo.h"

@interface AALVenmoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation AALVenmoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    if (![Venmo isVenmoAppInstalled]) {
        [[Venmo sharedInstance] setDefaultTransactionMethod:VENTransactionMethodAPI];
    }
    else {
        [[Venmo sharedInstance] setDefaultTransactionMethod:VENTransactionMethodAppSwitch];
    }

    [[Venmo sharedInstance] requestPermissions:@[VENPermissionMakePayments,
                                                 VENPermissionAccessProfile]
                         withCompletionHandler:^(BOOL success, NSError *error) {
                             if (success) {

                                 [[Venmo sharedInstance] sendPaymentTo:@"albie06albie.@gmail.com"
                                                                amount:100
                                                                  note:@"YO you PUSHed"
                                                     completionHandler:^(VENTransaction *transaction, BOOL success, NSError *error) {
                                                         if (success) {
                                                             self.statusLabel.text = @"YO you just paid $1";
                                                             NSLog(@"Transaction succeeded!");
                                                         }
                                                         else {
                                                             self.statusLabel.text = @"Payment Failed!";
                                                             NSLog(@"Transaction failed with error: %@", [error localizedDescription]);
                                                         }
                                                     }];
                                 
                             }
                             else {
                                 // :(
                             }
                         }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
