//
//  Deck.h
//  MatchIt
//
//  Created by Bharat Murali on 12/17/13.
//  Copyright (c) 2013 BharatMurali. All rights reserved.
//

#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;

-(Card *) drawRandomCard;

@end
