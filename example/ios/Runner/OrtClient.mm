//
//  OrtClient.m
//  Runner
//
//  Created by Eric Ng on 2024/7/17.
//

#import "OrtClient.h"
#import <Foundation/Foundation.h>

#include <array>
#include <cstdint>
#include <stdexcept>
#include <string>
#include <vector>

#include <onnxruntime_cxx_api.h>
#include <onnxruntime_extensions.h>

@implementation OrtClient

+ (void)dummy:(NSError **)error{
    try {
      const auto ort_log_level = ORT_LOGGING_LEVEL_INFO;
      auto ort_env = Ort::Env(ort_log_level, "OrtExtensionsUsage");
      auto session_options = Ort::SessionOptions();

      if (RegisterCustomOps(session_options, OrtGetApiBase()) != nullptr) {
        throw std::runtime_error("RegisterCustomOps failed");
      }
        
        NSLog(@"Hello");
      
    } catch (std::exception &e) {
      NSLog(@"%s error: %s", __FUNCTION__, e.what());
        
      static NSString *const kErrorDomain = @"OrtExtensionsUsage";
      constexpr NSInteger kErrorCode = 0;
      if (error) {
        NSString *description =
            [NSString stringWithCString:e.what() encoding:NSASCIIStringEncoding];
        *error =
            [NSError errorWithDomain:kErrorDomain
                                code:kErrorCode
                            userInfo:@{NSLocalizedDescriptionKey : description}];
      }
    }
}

@end
