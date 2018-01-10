//
//  Home_ViewController.h
//  Loan Calculator
//
//  Created by Trinity  Wizards  on 12/19/17.
//  Copyright © 2017 SK. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define ConvertSizeByDensity(A)  (A*SCREEN_MIN_LENGTH/414.0)

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

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lblItemPriceTopMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *txtItemPriceTopMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lblDownPaymentTopMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *txtDownPaymentTopMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lblInterestRateTopMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *interestRateSliderTopMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lblLoanPeriodTopMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loanPeriodSliderTopMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lblInstallmentTopMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lblMontlyInstallmentTopMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lblNotesTopMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnResetTopMargin;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lblMontlyInstallmentHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lblMonthHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lblMonthWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnResetHeight;



- (IBAction)btnResetDidPressed:(id)sender;
- (IBAction)interestRateSliderPressed:(id)sender;
- (IBAction)loanPeriodPressed:(id)sender;

@end
