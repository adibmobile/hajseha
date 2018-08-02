//
//  vc_Home.m
//  AppRTC
//
//  Created by adib almaraabeh on 02/08/2018.
//  Copyright © 2018 ISBX. All rights reserved.
//

#import "vc_Home.h"
#import "ARTCRoomViewController.h"
#import "vc_map.h"
@interface vc_Home ()

@end

@implementation vc_Home

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}




- (IBAction)btnCallDoc:(UIButton *)sender {
    
    @try
    {
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ARTCRoomViewController *callDoc = [[ARTCRoomViewController alloc]init];
        
        
        callDoc = [main instantiateViewControllerWithIdentifier:@"ARTCRoomViewController"];
        
        [self.navigationController presentViewController:callDoc animated:YES completion:nil];
    }
    @catch(NSException *ex)
    {
        NSLog(@"You have error in function btnCallDoc %@ ",ex.description);
    }
}

- (IBAction)btnNearByHospital:(UIButton *)sender {
    
    @try
    {
        
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        vc_map *_vc_map = [[vc_map alloc]init];
        
        
        _vc_map = [main instantiateViewControllerWithIdentifier:@"vc_map"];
        
        [self.navigationController presentViewController:_vc_map animated:YES completion:nil];
        
    }
    @catch(NSException *ex)
    {
        NSLog(@"You have error in function btnNearByHospital %@ ",ex.description);
    }
}

- (IBAction)btnCallSOS:(UIButton *)sender {
    
    @try
    {
        
        NSString *phoneNumber = [@"tel://" stringByAppendingString:@"911"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
        
    }
    @catch(NSException *ex)
    {
        NSLog(@"You have error in function btnCallSOS %@ ",ex.description);
    }
}
@end
