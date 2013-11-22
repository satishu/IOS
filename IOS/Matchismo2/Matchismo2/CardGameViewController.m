//
//  CardGameViewController.m
//  Matchismo2
//
//  Created by Satish Umapathy on 11/15/13.
//  Copyright (c) 2013 satishumapathy. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *Score;
@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *GameMode;
    @end

@implementation CardGameViewController
- (IBAction)changedGameMode:(UISegmentedControl *)sender {
    
    [self.game setGameMode:self.GameMode.selectedSegmentIndex=1?3:2];

}

- (IBAction)ResetGame:(UIButton *)sender {
    self.Score.text = @"Score: 0";
    self.game=nil;
    
    for(UIButton * button in self.cardButtons){
        [self resetButton:button];
    }
}

- (void) resetButton:(UIButton *)button{
    [button setTitle:@"" forState:(UIControlStateNormal)];
    [button setBackgroundImage:[UIImage imageNamed:@"cardback"]
                      forState:UIControlStateNormal];
    button.enabled=YES;
}

- (CardMatchingGame *) game {
    
    if(_game==nil)
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                  usingDeck:[self createDeck]];
    
    return _game;
}
                 
- (PlayingCardDeck *) createDeck{
    return [[PlayingCardDeck alloc]init];
}


- (IBAction)cardTouch:(UIButton *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (void) updateUI{
    for (UIButton *button in self.cardButtons){
        int chosenButtonIndex = [self.cardButtons indexOfObject:button];
        Card * card = [self.game cardAtIndex:chosenButtonIndex];
        
        [button setTitle: [self titleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self backgroundImageForCard:card]
                          forState:UIControlStateNormal];
        button.enabled = !card.isMatched;
        [self.scoreLabel setText:[NSString stringWithFormat:@"Score %d",self.game.score]];
    }
}

- (NSString *) titleForCard:(Card *) card{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *) backgroundImageForCard:(Card *) card{
    return [UIImage imageNamed: card.isChosen ? @"cardfront": @"cardback"];
}



@end
