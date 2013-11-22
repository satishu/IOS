//
//  Card.h
//  Matchismo
//
//  Created by Satish Umapathy on 11/13/13.
//  Copyright (c) 2013 satishumapathy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (nonatomic, strong) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

-(int) match:(NSArray *)otherCards;


@end
