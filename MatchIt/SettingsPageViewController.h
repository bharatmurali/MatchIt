//
//  SettingsPageViewController.h
//  MatchIt
//
//  Created by Bharat Murali on 12/20/13.
//  Copyright (c) 2013 BharatMurali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardGameViewController.h"

@interface SettingsPageViewController : UIViewController
@property (nonatomic) NSInteger diffLevel;
@property (nonatomic, weak) id<CardGameViewProtocol> delegate;
@end
