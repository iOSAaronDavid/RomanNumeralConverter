//
//  Converter.m
//  ArabicRomanNumeralConverter
//
//  Created by User on 3/9/16.
//  Copyright © 2016 tgm. All rights reserved.
//

#import "Converter.h"

@implementation Converter

-(int)convertRomanNumeralToArabic:(NSString *)romanNumeral
{
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
        int DCount = 0;
        int MCount = 0;
        int valueToAdd = 0;
        
        for (int i = 0; i < romanNumeral.length; i++)
        {
            NSRange range = NSMakeRange(i, 1);
            
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
            else if ([[romanNumeral substringWithRange:range] isEqualToString:@"D"])
                DCount++;
            else if ([[romanNumeral substringWithRange:range] isEqualToString:@"M"])
                MCount++;
            
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
                else if ([[romanNumeral substringWithRange:range] isEqualToString:@"XC"])
                {
                    valueToAdd += 90;
                    XCount--;
                    CCount--;
                }
                else if ([[romanNumeral substringWithRange:range] isEqualToString:@"CD"])
                {
                    valueToAdd += 400;
                    DCount--;
                    CCount--;
                }
                else if ([[romanNumeral substringWithRange:range] isEqualToString:@"CM"])
                {
                    valueToAdd += 900;
                    MCount--;
                    CCount--;
                }
            }
        }
        
        int arabicValue = 0;
        
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
        if (DCount > 0)
            arabicValue += DCount * 500;
        if (MCount > 0)
            arabicValue += MCount * 1000;
        
        arabicValue +=  valueToAdd;
        return arabicValue;
    }
    
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

-(NSString *)convertArabicToRomanNumeral:(int)arabic
{
    NSMutableString *romanNumeral = [[NSMutableString alloc] init];
    
    NSString *arabicString = [NSString stringWithFormat:@"%i", arabic];
    
    
    if (arabic >= 1000)
    {
        NSString *mString = [arabicString substringToIndex:arabicString.length - 3];
        
        for (int i = 0; i < [mString intValue]; i++)
        {
            [romanNumeral appendString:@"M"];
            arabic -= 1000;
            arabicString = [NSString stringWithFormat:@"%i", arabic];
        }
    }
    if (arabic >= 500)
    {
        NSString *dString = [arabicString substringWithRange:NSMakeRange(arabicString.length - 3, 1)];
    
        if ([dString intValue] >= 5)
        {
            [romanNumeral appendString:@"D"];
            arabic -= 500;
            arabicString = [NSString stringWithFormat:@"%i", arabic];
        }
    }
    if (arabic >= 100)
    {
        NSString *cString = [arabicString substringWithRange:NSMakeRange(arabicString.length - 3, 1)];
        
        for (int i = 0; i < [cString intValue]; i++)
        {
            [romanNumeral appendString:@"C"];
            arabic -= 100;
            arabicString = [NSString stringWithFormat:@"%i", arabic];
        }
    }
    if (arabic >= 50)
    {
        [romanNumeral appendString:@"L"];
        arabic -= 50;
        arabicString = [NSString stringWithFormat:@"%i", arabic];
    }

    
    
    
    
    return romanNumeral;
}

@end
