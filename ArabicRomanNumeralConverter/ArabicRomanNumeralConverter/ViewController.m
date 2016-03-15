//
//  ViewController.m
//  ArabicRomanNumeralConverter
//
//  Created by User on 3/9/16.
//  Copyright © 2016 tgm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

static int newInt(NSString *somestring)
{
    return [somestring intValue];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.validNumerals = [[NSArray alloc] initWithObjects:@"I", @"V", @"X", @"L", @"C", @"M", nil];
    self.errorLabel.text = @"";
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convert:(id)sender
{
    if ([self inputIsValidNumeral])
    {
        self.errorLabel.text = @"";
        [self convertRomanNumeralToArabic];
    }
    else if ([self labelTextIsNumeric])
    {
        [self convertArabicToRomanNumeral];
        self.errorLabel.text = @"";
    }
    else
        self.errorLabel.text = @"Invalid input";
    
}

-(BOOL)labelTextIsNumeric
{
    int value = [self.symbolTextField.text intValue];
    
    if (value > 0 && [NSString stringWithFormat:@"%i", value].length == self.symbolTextField.text.length)
        return YES;
    
    return NO;
}

-(double)convertRomanNumeralToArabic
{
    Converter *converter = [[Converter alloc] init];
    
    return 0;
}

-(BOOL)inputIsValidNumeral
{
    BOOL valid = YES;
    
    for (int i = 0; i < self.symbolTextField.text.length; i++)
    {
        bool isValidNumeral = false;
        
        for (int x = 0; x < self.validNumerals.count; x++)
        {
            NSString *validNumeral = self.validNumerals[x];
            NSString *test = [self.symbolTextField.text substringWithRange:NSMakeRange(i, 1)];
            if ([[self.symbolTextField.text substringWithRange:NSMakeRange(i, 1)] isEqualToString:validNumeral])
            {
                isValidNumeral = YES;
                break;
            }
        }
        
        if (!isValidNumeral)
        {
            valid = NO;
            break;
        }
    }
    return valid;
}

-(id)convertArabicToRomanNumeral
{
    
    return self;
}

@end
