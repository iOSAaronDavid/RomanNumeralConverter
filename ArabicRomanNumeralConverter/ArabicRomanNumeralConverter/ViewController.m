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
        self.arabicLabel.text = [NSString stringWithFormat:@"%i", [self convertRomanNumeralToArabic]];
        self.romanNumeralLabel.text = self.symbolTextField.text;
    }
    else if ([self labelTextIsNumeric])
    {
        self.errorLabel.text = @"";
        self.romanNumeralLabel.text = [self convertArabicToRomanNumeral];
        self.arabicLabel.text = self.symbolTextField.text;
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

-(int)convertRomanNumeralToArabic
{
    Converter *converter = [[Converter alloc] init];
    return [converter convertRomanNumeralToArabic:self.symbolTextField.text];
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

-(NSString *)convertArabicToRomanNumeral
{
    Converter *converter = [[Converter alloc] init];
    return [converter convertArabicToRomanNumeral:[self.symbolTextField.text intValue]];
}

@end
