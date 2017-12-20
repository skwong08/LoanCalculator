//
//  Home_ViewController.h
//  Loan Calculator
//
//  Created by Trinity  Wizards  on 12/19/17.
//  Copyright © 2017 SK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home_ViewController : UIViewController<UITextFieldDelegate>
{
    CGFloat rate;
    NSInteger year;
    CGFloat installment;
}

@property (weak, nonatomic) IBOutlet UILabel *lblItemPrice;
@property (weak, nonatomic) IBOutlet UITextField *txtItemPrice;

@property (weak, nonatomic) IBOutlet UILabel *lblDownPayment;
@property (weak, nonatomic) IBOutlet UITextField *txtDownPayment;

@property (weak, nonatomic) IBOutlet UILabel *lblInterestRate;
@property (weak, nonatomic) IBOutlet UISlider *interestRateSlider;

@property (weak, nonatomic) IBOutlet UILabel *lblLoanPeriod;
@property (weak, nonatomic) IBOutlet UISlider *loanPeriodSlider;

@property (weak, nonatomic) IBOutlet UILabel *lblInstallment;
@property (weak, nonatomic) IBOutlet UILabel *lblMontlyInstallment;
@property (weak, nonatomic) IBOutlet UILabel *lblMonth;

@property (weak, nonatomic) IBOutlet UILabel *lblNotes;

@property (weak, nonatomic) IBOutlet UIButton *btnReset;
- (IBAction)btnResetDidPressed:(id)sender;
- (IBAction)interestRateSliderPressed:(id)sender;
- (IBAction)loanPeriodPressed:(id)sender;

@end
