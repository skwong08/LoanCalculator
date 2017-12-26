# LoanCalculator
A simple iOS app using Objective-C for calculating monthly installment for car loan, house loan and etc.


For a loan calculator, the most important thing is the formula. 

    Loan Payment = Amount / Discount Factor
                 or
               P = A / D

You’ll need the following values:

  - Number of Periodic Payments (n) = Payments per year times number of years
  - Periodic Interest Rate (i) = Annual rate divided by number of payments per
  - Discount Factor (D) = {[(1 + i) ^n] - 1} / [i(1 + i)^n]

And I have simplified the formula for the calculation.


    //Remove comma in the string and convert to Integer
    NSInteger itemPrice = [[self.txtItemPrice.text stringByReplacingOccurrencesOfString:@"," withString:@""] integerValue];
    NSInteger downPayment = [[self.txtDownPayment.text stringByReplacingOccurrencesOfString:@"," withString:@""] integerValue];

    //Calculation Formula
    CGFloat balance = itemPrice - downPayment;
    CGFloat totalInterest = (rate/100.0) * balance * year;
    newInstallment = (balance + totalInterest) / (year * 12);
            
            
Hope you are enjoy learning how to build a loan calculator. Thank you.            
