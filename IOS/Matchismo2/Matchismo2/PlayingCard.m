//
//  PlayingCard.m
//  Matchismo
//
//  Created by Satish Umapathy on 11/13/13.
//  Copyright (c) 2013 satishumapathy. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard(){
    
}

@end

@implementation PlayingCard

@synthesize suit = _suit;

+ (NSArray *)validSuits{
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
}

+ (NSArray *) rankStrings{
    return @[@"?",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank {
    return [[PlayingCard rankStrings] count]-1;
}

- (NSString *)contents
{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

- (NSString *) suit{
    return _suit ? _suit : @"?";
}

- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit])
         _suit = suit;
}

- (void)setRank:(NSUInteger)rank{
    if (_rank<= [PlayingCard maxRank])
        _rank=rank;
}

- (int) match:(NSArray *)cards{
    int score=0;
    int finalscore=0;
    
    NSArray *chosenCards = [cards arrayByAddingObject:self];
    
    for (int i=0;i < [chosenCards count]-1; i++ ){
        PlayingCard *card = [chosenCards objectAtIndex:i];
        for (PlayingCard *otherCard in chosenCards){
            if (card != otherCard){
                score = [card matchCard:otherCard];
                if (score ==0)
                    return 0;
                else
                    finalscore += score;
            }
        }
    }
    
    return finalscore;
}

-(int) matchCard: (PlayingCard *)otherCard{
    
        int score=0;

        if (otherCard.rank == self.rank)
            score = 4;
        else if([otherCard.suit isEqualToString:self.suit])
            score=1;
        
    return score;
}


@end
