//
//  DPLDeepLinkRouter+OO.h
//  OODeepLinkKit
//
//  Created by emsihyo on 2018/4/23.
//  Copyright © 2018年 emsihyo. All rights reserved.
//

#import <DeepLinkKit/DeepLinkKit.h>

@interface DPLDeepLinkRouter (OO)

- (BOOL)canHandleURL:(NSURL*)url;

- (BOOL)handleURL:(NSURL *)url parameters:(NSDictionary*)parameters;

- (BOOL)handleURL:(NSURL *)url parameters:(NSDictionary*)parameters withCompletion:(DPLRouteCompletionBlock)completionHandler;

@end
