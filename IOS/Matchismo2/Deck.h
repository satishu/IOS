//
//  Deck.h
//  Matchismo
//
//  Created by Satish Umapathy on 11/13/13.
//  Copyright (c) 2013 satishumapathy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *) card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end
