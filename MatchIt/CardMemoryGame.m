//
//  CardMemoryGame.m
//  MatchIt
//
//  Created by Bharat Murali on 12/18/13.
//  Copyright (c) 2013 BharatMurali. All rights reserved.
//

#import "CardMemoryGame.h"

@interface CardMemoryGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation CardMemoryGame

-(BOOL) isGameFinished
{
    for (Card *card in self.cards) {
        if (!card.isMatched) return NO;
    }
    return YES;
}

-(NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    
    return _cards;
}

-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self)
    {
        for (int i = 0; i < count / 2; i++)
        {
            Card *card = [deck drawRandomCard];
            Card *dupeCard = [[Card alloc] init];
            if (card)
            {
                dupeCard.contents = card.contents;
                dupeCard.chosen = NO;
                dupeCard.matched = NO;
                [self.cards addObject:card];
                [self.cards addObject:dupeCard];
            }
            else
            {
                self = nil;
                break;
            }
        }
    }
    
    if (self)
    {
        [self.cards shuffle];
    }
    
    return self;
}

-(void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self.cards objectAtIndex:index];
    
    if (!card.isMatched)
    {
        if (card.isChosen)
        {
            card.chosen = NO;
        }
        else
        {
            for (Card *otherCard in self.cards)
            {
                if (otherCard.isChosen && !otherCard.isMatched)
                {
                    if ([card match:@[otherCard]])
                    {
                        card.matched = YES;
                        otherCard.matched = YES;
                        self.score += 4;
                    }
                    else
                    {
                        card.chosen = NO;
                        otherCard.chosen = NO;
                        self.score -= 1;
                    }
                    break;
                }
            }
            card.chosen = YES;
        }
    }
}

-(Card *) cardAtindex:(NSUInteger)index
{
    return (index < [self.cards count]) ? [self.cards objectAtIndex:index] : nil;
}

@end
