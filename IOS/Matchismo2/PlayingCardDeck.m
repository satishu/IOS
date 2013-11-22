//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Satish Umapathy on 11/13/13.
//  Copyright (c) 2013 satishumapathy. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init{
    
    NSLog(@"Starting to initialize");
    self = [super init];
    
    if (self)
    {
        NSLog(@"Maxrank %d",[PlayingCard maxRank]);
        
        for (NSString * suit in [PlayingCard validSuits])
        {
            for (NSUInteger rank=1; rank<= [PlayingCard maxRank]; rank++)
            {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                NSLog(@"Initializing card with suit %@ and rank %d",suit,rank);
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
