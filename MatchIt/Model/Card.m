//
//  Card.m
//  MatchIt
//
//  Created by Bharat Murali on 12/17/13.
//  Copyright (c) 2013 BharatMurali. All rights reserved.
//

#import "Card.h"

@implementation Card : NSObject

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards)
    {
        if ([card.contents isEqualToString: self.contents])
        {
            score += 1;
        }
    }
    return score;
}
@end
