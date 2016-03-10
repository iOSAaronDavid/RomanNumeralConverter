//
//  ViewController.h
//  ArabicRomanNumeralConverter
//
//  Created by User on 3/9/16.
//  Copyright © 2016 tgm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Converter.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *romanNumeralLabel;

@property (strong, nonatomic) IBOutlet UILabel *arabicLabel;
@property (strong, nonatomic) IBOutlet UITextField *symbolTextField;
@property (strong, nonatomic) IBOutlet UIButton *convertButton;

@end

