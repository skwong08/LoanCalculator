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


            //Loan Calculation Formula

            NSInteger itemPrice = [self.txtItemPrice.text integerValue];
            NSInteger downPayment = [self.txtDownPayment.text integerValue];
            
            CGFloat balance = itemPrice - downPayment;
            CGFloat balancePerMonth = balance / (year * 12);
            newInstallment = balancePerMonth * (1 + (rate/100.0));
            
            
Hope you are enjoy learning how to build a loan calculator. Thank you.            
