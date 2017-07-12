require 'irb'
# Input
#  Loan amount
#  APR
#  Duration of Loan

# Output
#  Monthly interest rate
#  loan duration in months

################################################
# Formula: m = p * (j / (1 - (1 + j)**(-n)))   #
# m = monthly payment                          #
# p = principla/loan amount                    #
# j = monthly interest rate                    #
# n = loan duration in months                  #
################################################

def prompt(msg, newline_bool=true)
  if newline_bool
    puts "=> #{msg}"
  else
    print "=> #{msg}"
  end
end

def calculate_monthly_payment(principal, apr_monthly, duration_of_loan_in_months)
  principal * (apr_monthly /
  (1 - (1 + apr_monthly)**-duration_of_loan_in_months))
end

def loan_period
  loop do
    prompt 'Please enter the duration of your loan in years:', false
    duration_of_loan = gets.chomp
    return duration_of_loan if duration_of_loan.match?(/^\d+$/)
    puts 'Please enter a valid duration (number of years).'
  end
  duration_of_loan
end

def loan_principal
  loop do
    prompt 'Enter principal amount ( will rounded to 2 decimal places): ', false
    principal = gets.chomp
    return principal if principal.match?(/^\d+\.?\d{0,2}$/)
    puts 'Please enter a valid principal amount.'
  end
  principal
end

def loan_apr
  loop do
    prompt 'Enter your APR for the loan (ex: 2.4%): ', false
    apr = gets.chomp
    # needs work
    return apr if apr.match?(/^\d+\.?\d{0,4}%$/)
    puts 'Please enter a valid APR amount. Use percent value (ex 5%).'
  end
  apr
end

loop do
  duration_of_loan = loan_period
  duration_of_loan_in_months = duration_of_loan.to_i * 12
  principal = loan_principal
  apr = loan_apr
  apr_normalized = apr.delete('%').to_f / 100
  apr_monthly = apr_normalized / 12
  monthly_payment = calculate_monthly_payment(principal.to_f, apr_monthly, \
                                              duration_of_loan_in_months)
  prompt "You will have a monthly payment of $#{format('%.2f', monthly_payment)}."
  prompt "Your monthly interest rate will be #{format('%.2f', apr_monthly * 100)}%."
  prompt "Another calculation?"
  break unless gets.chomp.downcase.start_with?('y')
end
