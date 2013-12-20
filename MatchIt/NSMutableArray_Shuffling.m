//
//  NSMutableArray_Shuffling.m
//  MatchIt
//
//  Created by Bharat Murali on 12/18/13.
//  Copyright (c) 2013 BharatMurali. All rights reserved.
//

#import "NSMutableArray_Shuffling.h"

@implementation NSMutableArray (Shuffling)
- (void)shuffle
{
    NSInteger count = [self count];
    for (NSInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSInteger n = arc4random_uniform(nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}
@end
