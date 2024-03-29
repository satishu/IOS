//
//  CardMatchingGame.h
//  Matchismo2
//
//  Created by Satish Umapathy on 11/15/13.
//  Copyright (c) 2013 satishumapathy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

//designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, setter=setGameMode:) NSInteger gameMode;



@end
