//
//  WPViewController.m
//  Weather Playground
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WPViewController.h"
#import "WeatherController.h"

@interface WPViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconlabel;


@end

@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)searchButton:(id)sender {
    
    [[WeatherController sharedInstance] getWeatherWithName:[self.textField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] completion:^(Weather *weather) {
        
        self.nameLabel.text = weather.locationName;
        self.mainLabel.text = weather.weatherMain;
        self.descriptionLabel.text = weather.weatherDescription;
        self.tempLabel.text = [NSString stringWithFormat:@"%@",weather.weatherTemp];
        self.iconlabel.image = weather.weatherIcon;
        
    }];
    
}

@end
