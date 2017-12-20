//
//  Home_ViewController.m
//  Loan Calculator
//
//  Created by Trinity  Wizards  on 12/19/17.
//  Copyright © 2017 SK. All rights reserved.
//

#import "Home_ViewController.h"

@interface Home_ViewController ()

@end

@implementation Home_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view endEditing:YES];

    
    self.lblItemPrice.text = @"Item price (RM)";
    self.lblDownPayment.text = @"Down payment (RM)";
    self.lblInstallment.text = @"Your monthly installment";
    self.lblMonth.text = @"per month";
    self.lblNotes.text = @"Please use this calculator as a guide only. All amounts, interest rates and terms are simulating based on your assumptions. The results in every case are approximate and do not guarantee its accuracy or applicability to your circumstances.";

    self.txtItemPrice.delegate = self;
    self.txtDownPayment.delegate = self;

    self.txtItemPrice.keyboardType = UIKeyboardTypeNumberPad;
    self.txtDownPayment.keyboardType = UIKeyboardTypeNumberPad;

    [self resetView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnResetDidPressed:(id)sender {
    [self resetView];
    [self.view endEditing:YES];
}

- (IBAction)interestRateSliderPressed:(id)sender {
    [self.view endEditing:YES];

    rate = self.interestRateSlider.value;
   
    self.lblInterestRate.text = [NSString stringWithFormat:@"Interest rate (%.01f %%)",rate];
    
    [self updateInstallmentLabel];
}

- (IBAction)loanPeriodPressed:(id)sender {
    [self.view endEditing:YES];

    year = self.loanPeriodSlider.value;
  
    self.lblLoanPeriod.text = [NSString stringWithFormat:@"Loan period (%ld Years)",year];
    
    [self updateInstallmentLabel];
}

-(void)updateInstallmentLabel{
    
    NSNumberFormatter * formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMinimumFractionDigits:2]; // Set this if you need 2 digits
    [formatter setMaximumFractionDigits:2]; // Set this if you need 2 digits
    NSString * currency_format =  [NSString stringWithFormat:@"%@", [formatter stringFromNumber:[NSNumber numberWithDouble:[self calculateMonthlyInstallment]]]];
    
    self.lblMontlyInstallment.text = [NSString stringWithFormat:@"RM %@",currency_format];

}

-(void)resetView{
    
    installment = 0.0;
    rate = 1.0;
    year = 1;
    
    self.lblInterestRate.text = [NSString stringWithFormat:@"Interest rate (%.01f %%)",rate];
    self.lblLoanPeriod.text = [NSString stringWithFormat:@"Loan period (%ld Years)",year];
    self.lblMontlyInstallment.text = [NSString stringWithFormat:@"RM %.02f",installment];
    
    self.txtItemPrice.text = @"";
    self.txtDownPayment.text = @"";
    self.lblMontlyInstallment.text = [NSString stringWithFormat:@"RM 0.00"];
    
    self.interestRateSlider.value = self.interestRateSlider.minimumValue;
    self.loanPeriodSlider.value = self.loanPeriodSlider.minimumValue;
    
}

-(CGFloat)calculateMonthlyInstallment{
    
    CGFloat newInstallment = 0.0;
    
    if (self.txtItemPrice.text.length > 0)
    {
        if (self.txtDownPayment.text.length > 0)
        {
            NSInteger itemPrice = [self.txtItemPrice.text integerValue];
            NSInteger downPayment = [self.txtDownPayment.text integerValue];
            
            CGFloat balance = itemPrice - downPayment;
            CGFloat balancePerMonth = balance / (year * 12);
            newInstallment = balancePerMonth * (1 + (rate/100.0));
        }
    }
    
    return newInstallment;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField.text.length >= 11 && range.length == 0)
    {
        return NO; // return NO to not change text
    }else{
        return YES;

    }
    

}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSInteger num = [textField.text integerValue];
    
    NSNumberFormatter * formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMinimumFractionDigits:0]; // Set this if you need 2 digits
    [formatter setMaximumFractionDigits:0]; // Set this if you need 2 digits
    NSString * currency_format =  [NSString stringWithFormat:@"%@", [formatter stringFromNumber:[NSNumber numberWithInteger:num]]];
    
    textField.text = [NSString stringWithFormat:@"%@",currency_format];
    
    [self updateInstallmentLabel];
}

-(IBAction)resignBackground:(id)sender{
    [self.view endEditing:YES];
}

@end
