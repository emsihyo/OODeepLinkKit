//
//  DPLDeepLinkRouter+OO.m
//  OODeepLinkKit
//
//  Created by emsihyo on 2018/4/23.
//  Copyright © 2018年 emsihyo. All rights reserved.
//

#import "DPLDeepLinkRouter+OO.h"

@implementation DPLDeepLinkRouter (OO)

- (BOOL)oo_canHandleURL:(NSURL*)url{
    return YES;
}

- (BOOL)oo_handleURL:(NSURL *)url paramters:(NSDictionary*)parameters withCompletion:(DPLRouteCompletionBlock)completionHandler{
    return YES;
}

- (BOOL)oo_handleUserActivity:(NSUserActivity *)userActivity paramters:(NSDictionary*)parameters withCompletion:(DPLRouteCompletionBlock)completionHandler{
    return YES;
}

@end
