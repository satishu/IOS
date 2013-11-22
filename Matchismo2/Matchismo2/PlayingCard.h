//
//  PlayingCard.h
//  Matchismo
//
//  Created by Satish Umapathy on 11/13/13.
//  Copyright (c) 2013 satishumapathy. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString * suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;

+ (NSUInteger)maxRank;

@end
