//
//  SettingsPageViewController.m
//  MatchIt
//
//  Created by Bharat Murali on 12/20/13.
//  Copyright (c) 2013 BharatMurali. All rights reserved.
//

#import "SettingsPageViewController.h"


@interface SettingsPageViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *DifficultySegmentedControl;
@end

@implementation SettingsPageViewController

-(void) viewWillAppear:(BOOL)animated
{
    self.DifficultySegmentedControl.selectedSegmentIndex = _diffLevel;
}

-(void) viewWillDisappear:(BOOL)animated
{
    [self sendData:[self.DifficultySegmentedControl selectedSegmentIndex]];
}

- (void)sendData:(NSInteger)difficultyLevel
{
    [self.delegate setData:difficultyLevel];
}

@end
