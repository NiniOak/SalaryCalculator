//
//  ViewController.h
//  Anita_Assignment1
//
//  Created by Anita Conestoga on 2017-01-23.
//  Copyright © 2017 Anita Conestoga. All rights reserved.
//

#import <UIKit/UIKit.h>

int timercount;

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *LabelTotalSalary;
@property (weak, nonatomic) IBOutlet UILabel *LabelSalaryPerSecond;
@property (weak, nonatomic) IBOutlet UILabel *LabelTotalSalaryPerSecond;
@property double NewSalary, TotalTime, SalaryPerSecond;
@property double Months, Hours, Weeks, Seconds;
@property double CostText;
- (IBAction)StartButton:(id)sender;
- (IBAction)StopButton:(id)sender;
- (IBAction)SalarySlider:(id)sender;


@end

