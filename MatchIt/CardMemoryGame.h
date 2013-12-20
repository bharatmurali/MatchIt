//
//  CardMemoryGame.h
//  MatchIt
//
//  Created by Bharat Murali on 12/18/13.
//  Copyright (c) 2013 BharatMurali. All rights reserved.
//

#import "PlayingCard.h"
#import "PlayingCardDeck.h"
#import "NSMutableArray_Shuffling.h"

@interface CardMemoryGame : NSObject

// designated init
-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *) deck;
-(void) chooseCardAtIndex:(NSUInteger) index;
-(Card*) cardAtindex:(NSUInteger) index;
-(BOOL) isGameFinished;

@property (nonatomic, readonly) NSInteger score;
@end
