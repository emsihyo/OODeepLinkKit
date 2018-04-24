//
//  DPLDeepLinkRouter+OO.m
//  OODeepLinkKit
//
//  Created by emsihyo on 2018/4/23.
//  Copyright © 2018年 emsihyo. All rights reserved.
//

#import <JRSwizzle/JRSwizzle.h>
#import <objc/message.h>

#import "DPLDeepLinkRouter+OO.h"
#import "DPLMutableDeepLink+OO.h"

NSString * DeepLinkRouterAdditionalParametersKey=@"__addition_parameters_key";

@interface DPLDeepLinkRouter (OO_)

@property (readonly)NSMutableDictionary *oo_parametersRoot;

@end

@implementation DPLDeepLinkRouter (OO_)

- (NSMutableDictionary*)oo_parametersRoot{
    NSMutableDictionary *paramtersRoot=objc_getAssociatedObject(self, @selector(oo_parametersRoot));
    if (!paramtersRoot) {
        paramtersRoot=[NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, @selector(oo_parametersRoot), paramtersRoot, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return paramtersRoot;
}

@end


@implementation DPLDeepLinkRouter (OO)

- (BOOL)canHandleURL:(id)u{
    NSURL *url=[u isKindOfClass:NSURL.class]?u:[NSURL URLWithString:u];
    id  deepLink;
    for (NSString *route in [self valueForKey:@"routes"]) {
        id matcher = ((id (*)(Class, SEL,id))(void *) objc_msgSend)(NSClassFromString(@"DPLRouteMatcher"), NSSelectorFromString(@"matcherWithRoute:"),route);
        deepLink = ((id (*)(id, SEL,id))(void *) objc_msgSend)(matcher, NSSelectorFromString(@"deepLinkWithURL:"),url);
        if (!deepLink) continue;
        break;
    }
    return deepLink!=nil;
}

- (BOOL)handleURL:(NSURL *)url{
    return [self handleURL:url parameters:nil];
}

- (BOOL)handleURL:(NSURL *)url parameters:(NSDictionary*)parameters{
    return [self handleURL:url parameters:parameters withCompletion:nil];
}

- (BOOL)handleURL:(NSURL *)url parameters:(NSDictionary*)parameters withCompletion:(DPLRouteCompletionBlock)completionHandler{
    if (!parameters) return [self handleURL:url withCompletion:completionHandler];
    NSString *key=[[NSUUID UUID] UUIDString];
    self.oo_parametersRoot[key]=parameters;
    DPLMutableDeepLink *link=[[DPLMutableDeepLink alloc]initWithString:url.absoluteString];
    link[DeepLinkRouterAdditionalParametersKey]=key;
    BOOL res=[self handleURL:link.URL withCompletion:completionHandler];
    self.oo_parametersRoot[key]=nil;
    return res;
}

- (BOOL)__handleRoute:(NSString *)route withDeepLink:(DPLDeepLink *)deepLink error:(NSError *__autoreleasing *)error{
    DPLMutableDeepLink *link=[deepLink mutableCopy];
    NSMutableDictionary *parameters=self.oo_parametersRoot[link[DeepLinkRouterAdditionalParametersKey]];
    link[DeepLinkRouterAdditionalParametersKey]=nil;
    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        link.additionalParameters[key]=obj;
    }];
    return [self __handleRoute:route withDeepLink:link error:error];
}

+ (void)load{
    NSParameterAssert([self jr_swizzleMethod:NSSelectorFromString(@"handleRoute:withDeepLink:error:") withMethod:@selector(__handleRoute:withDeepLink:error:) error:nil]);
}

@end
