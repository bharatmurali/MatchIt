//
//  CardGameViewController.h
//  MatchIt
//
//  Created by Bharat Murali on 12/17/13.
//  Copyright (c) 2013 BharatMurali. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CardGameViewProtocol
- (void)setData:(NSInteger)difficultyLevel;
@end

@interface CardGameViewController : UIViewController <UIAlertViewDelegate, CardGameViewProtocol>
@end
