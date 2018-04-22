//
//  DPLDeepLinkRouter+OO.h
//  OODeepLinkKit
//
//  Created by emsihyo on 2018/4/23.
//  Copyright © 2018年 emsihyo. All rights reserved.
//

#import <DeepLinkKit/DeepLinkKit.h>

@interface DPLDeepLinkRouter (OO)


- (BOOL)oo_canHandleURL:(NSURL*)url;

- (BOOL)oo_handleURL:(NSURL *)url paramters:(NSDictionary*)parameters withCompletion:(DPLRouteCompletionBlock)completionHandler;

- (BOOL)oo_handleUserActivity:(NSUserActivity *)userActivity paramters:(NSDictionary*)parameters withCompletion:(DPLRouteCompletionBlock)completionHandler;

@end
