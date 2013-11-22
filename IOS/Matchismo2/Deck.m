//
//  Deck.m
//  Matchismo
//
//  Created by Satish Umapathy on 11/13/13.
//  Copyright (c) 2013 satishumapathy. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong,nonatomic) NSMutableArray *cards; //of card

@end

@implementation Deck

- (NSMutableArray *) cards{
    if (_cards == nil)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop{
    if (atTop)
        [self.cards insertObject:(card) atIndex:0];
    else
        [self.cards addObject:card];
    
    NSLog(@"Cards count %d", [self.cards count]);
}

- (void)addCard:(Card *)card{
    [self addCard:card atTop:NO];
}

- (Card *)drawRandomCard{
 
    
    Card *randomCard = nil;
    
    unsigned index = arc4random() % [self.cards count];
    
    NSLog(@"drawRandomCard - Total cards %d ", [self.cards count]);

    randomCard = self.cards[index];
    
    [self.cards removeObjectAtIndex:index];
    
    return randomCard;
}

@end
