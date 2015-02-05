//
//  WeatherController.h
//  Weather Playground
//
//  Created by Kevin Lambert on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface WeatherController : NSObject

+ (WeatherController *)sharedInstance;

- (void)getWeatherWithName:(NSString *)name completion:(void (^)(Weather *weather))completion;

@end
