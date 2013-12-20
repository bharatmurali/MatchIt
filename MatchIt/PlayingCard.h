//
//  PlayingCard.h
//  MatchIt
//
//  Created by Bharat Murali on 12/17/13.
//  Copyright (c) 2013 BharatMurali. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger) maxRank;

@end
