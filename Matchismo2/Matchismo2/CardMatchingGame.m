//
//  CardMatchingGame.m
//  Matchismo2
//
//  Created by Satish Umapathy on 11/15/13.
//  Copyright (c) 2013 satishumapathy. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;

@property (nonatomic, strong) NSMutableArray *cards; //of cards


@end

@implementation CardMatchingGame

@synthesize gameMode = _gameMode;


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TOCHOOSE = 1;

- (NSMutableArray*) cards{
    
    if (_cards ==nil)
        _cards = [[NSMutableArray alloc]init];
    
    return _cards;
}

- (NSInteger)gameMode{
    if (!_gameMode) _gameMode=2;
    return _gameMode;
}

- (void) setGameMode: (NSInteger)gameMode{
    _gameMode = (gameMode==2 || gameMode==3)?gameMode:2; //default mode is 2
}


- (instancetype) initWithCardCount: (NSUInteger)count
                         usingDeck: (Deck *)deck{
    
    self = [super init];
    
    if (self){
    
        for (int i=0; i<count;i++){
            Card * card = [deck drawRandomCard];
            if (card)
                [self.cards addObject:card];
            else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card *) cardAtIndex: (NSUInteger) index{
    return (index < [self.cards count]) ?
         self.cards[index] : nil;
}

- (void) chooseCardAtIndex:(NSUInteger)index{

    Card * card = [self cardAtIndex:index] ;
    
    if (!card.isMatched)
    {
        if (card.isChosen) {
            card.Chosen = NO;
        }
        else{
        
           
            NSMutableArray *chosenCards = [[NSMutableArray alloc]init];
             int matchscore=0;
            
            for (Card *othercard in self.cards){
                
                if (othercard.isChosen && !othercard.isMatched){
                    [chosenCards addObject:othercard];
                 }
            }
            
            if ((self.gameMode==3 && [chosenCards count]==2) || (self.gameMode==2 && [chosenCards count]==1)){
            
                matchscore = [card match:chosenCards];
            
            
                if (matchscore) {
                self.score += matchscore*MATCH_BONUS;
                
                    for (Card *chosencard in chosenCards){
                    chosencard.matched = YES;
                    }
                    card.matched=YES;
                    
            }
            else{
                
                self.score -= MISMATCH_PENALTY;
                
                for (Card *chosencard in chosenCards){
                    chosencard.matched = NO;
                    chosencard.chosen=NO;
                }
            }
                
            }
            self.score-=COST_TOCHOOSE;
            card.chosen=YES;
            
            }
        
        }
    }
    

@end
