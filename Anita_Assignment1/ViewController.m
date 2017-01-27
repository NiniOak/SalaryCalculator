//
//  ViewController.m
//  Anita_Assignment1
//
//  Created by Anita Conestoga on 2017-01-23.
//  Copyright © 2017 Anita Conestoga. All rights reserved.
//

#import "ViewController.h"
NSTimer *counttimer;
NSString *NewValue;
UISlider *slider;

@interface ViewController ()

@end

@implementation ViewController

-(void)TickMethod: (NSTimer *)timer{
    timercount = timercount + 1;
    _Months = 12;
    _Hours = 40;
    _Weeks = 4;
    _Seconds = 3600;
    _TotalTime = (_Months * _Hours * _Weeks * _Seconds);
    _SalaryPerSecond = (_NewSalary/_TotalTime) * timercount;
    
    //Calculate time in seconds
    int seconds = timercount % 60;
    int minutes = (timercount / 60) % 60;
    int hours = timercount / 3600;
    
    _LabelTotalSalaryPerSecond.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds ];
    
    _LabelSalaryPerSecond.text =  [NSString stringWithFormat:@"Salary Per Second: $%.02f", _SalaryPerSecond];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:_NewSalary forKey:@"SavedTotalSalary"];
    [defaults setInteger:hours forKey:@"SaveHour"];
    [defaults setInteger:minutes forKey:@"SaveMinutes"];
    [defaults setInteger:seconds forKey:@"SaveSeconds"];
    [defaults setDouble:_SalaryPerSecond forKey:@"SalaryPerSecond"];
    [defaults synchronize];
    
    
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double savedcurrentSalary = [defaults doubleForKey:@"SavedTotalSalary"];
    _LabelTotalSalary.text = [NSString stringWithFormat:@"$%.02f", savedcurrentSalary];
    
    NSInteger savedHour = [defaults integerForKey:@"SaveHour"];
    NSInteger savedMinute = [defaults integerForKey:@"SaveMinutes"];
    NSInteger savedSeconds = [defaults integerForKey:@"SaveSeconds"];
    _LabelTotalSalaryPerSecond.text = [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)savedHour, (long)savedMinute, (long)savedSeconds];
    
    double SavdSalperSecond = [defaults doubleForKey:@"SalaryPerSecond"];
    _LabelSalaryPerSecond.text = [NSString stringWithFormat:@"Salary Per Second: $%.02f", SavdSalperSecond];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-(void)count {
    timercount = timercount + 1;
    _LabelTotalSalaryPerSecond.text = [NSString stringWithFormat:@"%i", timercount];
    
}*/


- (IBAction)StartButton:(id)sender {
    counttimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(TickMethod:) userInfo:nil repeats:true];
    
    
}

- (IBAction)StopButton:(id)sender {
    [counttimer invalidate];
}

- (IBAction)SalarySlider:(id)sender {
    slider = (UISlider *)sender;
    _NewSalary = slider.value;
    
    NewValue = [NSString stringWithFormat:@"Total Salary: $%.02f", slider.value];
    
    
    self.LabelTotalSalary.text = NewValue;
    
}
@end
