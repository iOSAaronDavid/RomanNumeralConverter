//
//  Converter.m
//  ArabicRomanNumeralConverter
//
//  Created by User on 3/9/16.
//  Copyright © 2016 tgm. All rights reserved.
//

#import "Converter.h"

@implementation Converter

-(double)convertRomanNumeralToArabic:(NSString *)romanNumeral
{
    if ([romanNumeral isEqualToString:@"I"])
    {
        return 1;
    }
    else if ([romanNumeral isEqualToString:@"V"])
    {
        return 5;
    }
    else if ([romanNumeral isEqualToString:@"X"])
    {
        return 10;
    }
    else if ([romanNumeral isEqualToString:@"L"])
    {
        return 50;
    }
    else
    {
        int highestNumeralWorth = [self findHighNumeralWorth:romanNumeral];
        
        
        
    }
    
    return 0;
}

-(int)findHighNumeralWorth:(NSString *)romanNumeral
{
    int highestNumeralWorth = 0;
    
    for (int i = 0; i < 3; i++)
    {
        NSString *numeral = [romanNumeral substringToIndex:i];
        if ([numeral isEqualToString:@"I"])
        {
            if (highestNumeralWorth < 1)
                highestNumeralWorth = 1;
        }
        else if ([numeral isEqualToString:@"V"])
        {
            if (highestNumeralWorth < 5)
                highestNumeralWorth = 5;
        }
        else if ([numeral isEqualToString:@"X"])
        {
            if (highestNumeralWorth < 10)
                highestNumeralWorth = 10;
        }
        else if ([numeral isEqualToString:@"L"])
        {
            if (highestNumeralWorth < 50)
                highestNumeralWorth = 50;
        }
    }
    return highestNumeralWorth;
}


@end
