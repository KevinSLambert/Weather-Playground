//
//  WeatherController.m
//  Weather Playground
//
//  Created by Kevin Lambert on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "WeatherController.h"
#import "NetworkController.h"

@implementation WeatherController

+ (WeatherController *)sharedInstance {
    static WeatherController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WeatherController alloc] init];
    });
    return sharedInstance;
}

- (void)getWeatherWithName:(NSString *)name completion:(void (^)(Weather *weather))completion {
    
    NSString *path = [NSString stringWithFormat:@"weather?q=/%@", name];
    
    [[NetworkController api] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseWeather = responseObject;
        
        Weather *weatherObject = [[Weather alloc] initWithDictionary:responseWeather];;
        
        completion(weatherObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil);
    }];

}

@end
