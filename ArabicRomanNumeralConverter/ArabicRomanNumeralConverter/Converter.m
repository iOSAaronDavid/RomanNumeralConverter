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
//    if ([romanNumeral isEqualToString:@"I"])
//        return 1;
//    else if ([romanNumeral isEqualToString:@"V"])
//        return 5;
//    else if ([romanNumeral isEqualToString:@"X"])
//        return 10;
//    else if ([romanNumeral isEqualToString:@"L"])
//        return 50;
//    else
//    {
        int highestNumeralWorth = [self findHighNumeralWorth:romanNumeral];
        
        if (highestNumeralWorth == 1)
            return [[NSNumber numberWithUnsignedInteger:romanNumeral.length] doubleValue];
        else
        {
            int ICount = 0;
            int VCount = 0;
            int XCount = 0;
            int LCount = 0;
            int CCount = 0;
            int valueToAdd = 0;
            
            for (int i = 0; i < romanNumeral.length; i++)
            {
                NSRange range = NSMakeRange(i, 1);
                
                NSString *test = [romanNumeral substringWithRange:range];
                
                if ([[romanNumeral substringWithRange:range] isEqualToString:@"I"])
                    ICount++;
                else if ([[romanNumeral substringWithRange:range] isEqualToString:@"V"])
                    VCount++;
                else if ([[romanNumeral substringWithRange:range] isEqualToString:@"X"])
                    XCount++;
                else if ([[romanNumeral substringWithRange:range] isEqualToString:@"L"])
                    LCount++;
                else if ([[romanNumeral substringWithRange:range] isEqualToString:@"C"])
                    CCount++;
                
                if (romanNumeral.length > 1 && i < romanNumeral.length - 1)
                {
                    range = NSMakeRange(i, 2);
                    
                    if ([[romanNumeral substringWithRange:range] isEqualToString:@"IV"])
                    {
                        valueToAdd += 4;
                        ICount--;
                        VCount--;
                    }
                    else if ([[romanNumeral substringWithRange:range] isEqualToString:@"IX"])
                    {
                        valueToAdd += 9;
                        ICount--;
                        XCount--;
                    }
                    else if ([[romanNumeral substringWithRange:range] isEqualToString:@"XL"])
                    {
                        valueToAdd += 40;
                        XCount--;
                        LCount--;
                    }
                }
            }
            
            double arabicValue = 0;
            
            if (ICount > 0)
                arabicValue += ICount;
            if (VCount > 0)
                arabicValue += VCount * 5;
            if (XCount > 0)
                arabicValue += XCount * 10;
            if (LCount > 0)
                arabicValue += LCount * 50;
            if (CCount > 0)
                arabicValue += CCount * 100;
            
            arabicValue +=  valueToAdd;
            return arabicValue;
        }
//    }
    
    return 0;
}

-(int)findHighNumeralWorth:(NSString *)romanNumeral
{
    int highestNumeralWorth = 0;
    
    for (int i = 0; i < 3 && i < romanNumeral.length; i++)
    {
        NSRange range = NSMakeRange(i, 1);
        NSString *numeral = [romanNumeral substringWithRange:range];
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
