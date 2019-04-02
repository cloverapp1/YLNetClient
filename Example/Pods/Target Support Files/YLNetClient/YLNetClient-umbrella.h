#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "YLBaseResult.h"
#import "YLNetConfig.h"
#import "YLNetworkClient.h"
#import "YLNetworkTool.h"

FOUNDATION_EXPORT double YLNetClientVersionNumber;
FOUNDATION_EXPORT const unsigned char YLNetClientVersionString[];

