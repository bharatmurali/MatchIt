//
//  CardGameViewController.m
//  MatchIt
//
//  Created by Bharat Murali on 12/17/13.
//  Copyright (c) 2013 BharatMurali. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMemoryGame.h"
#import "SettingsPageViewController.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMemoryGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *StateLabel;
@property (nonatomic) NSInteger currentDifficulty;
@property (nonatomic) NSInteger diffLevel;
@property (nonatomic) NSInteger numCards;

@end

@implementation CardGameViewController

- (void)setData:(NSInteger)difficultyLevel
{
    _diffLevel = difficultyLevel;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController* controller = [segue destinationViewController];
    if ([controller isKindOfClass:[SettingsPageViewController class]])
    {
        SettingsPageViewController* settingController = (SettingsPageViewController *)controller;
        settingController.delegate = self;
        settingController.diffLevel = _currentDifficulty;
    }
}

-(void) viewWillAppear:(BOOL)animated
{
    if (_diffLevel != _currentDifficulty)
    {
        _currentDifficulty = _diffLevel;
        [self newGame:_currentDifficulty];
    }
}

-(void) viewDidLoad
{
    _currentDifficulty = 0;
    [self newGame:_currentDifficulty];
}

-(CardMemoryGame *) game
{
    if (!_game) _game = [[CardMemoryGame alloc] initWithCardCount:_numCards usingDeck:[self createDeck]];
    return _game;
}

-(void) newGame:(NSInteger) diff
{
    switch (diff) {
        case 0:
            _numCards = 4;
            break;
            
        case 1:
            _numCards = 8;
            break;
            
        case 2:
            _numCards = 16;
            break;
            
        default:
            _numCards = 4;
            break;
    }
    
    _game = nil;
    [self game];
    [self updateUI];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [self newGame:_currentDifficulty];
    }
}

- (IBAction)ClickNewGameButton
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Game"
                                                    message:@"You will lose the current game state. Continue?"
                                                   delegate:self
                                          cancelButtonTitle:@"No"
                                          otherButtonTitles:@"Yes", nil];
    [alert show];
}

-(Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)TouchCardButton:(UIButton *)sender
{
    NSInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

-(void) updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        NSInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtindex:cardButtonIndex];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        cardButton.hidden = NO;
        if (cardButtonIndex >= _numCards)
        {
            cardButton.hidden = YES;
        }

    }
    self.ScoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    
    if ([self.game isGameFinished])
    {
        self.StateLabel.text = @"Congratulations! You are done!";
    }
}

- (UIImage *) backgroundImageForCard:(Card *) card
{
    NSString *cardContents = card.contents;
    return [UIImage imageNamed:card.isChosen ? cardContents : @"cardBackground"];
}


@end
