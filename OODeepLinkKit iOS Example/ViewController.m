//
//  ViewController.m
//  OODeepLinkKit iOS Example
//
//  Created by emsihyo on 2018/4/23.
//  Copyright © 2018年 emsihyo. All rights reserved.
//

@import OODeepLinkKit;

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong)DPLDeepLinkRouter *router;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.router=[[DPLDeepLinkRouter alloc]init];
    self.router[@"https://*.google.com/root"]=^(DPLDeepLink* link){
        
    };
    
    [self.router handleURL:[NSURL URLWithString:@"https://www.google.com/root"] parameters:nil withCompletion:^(BOOL handled, NSError *error) {
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
