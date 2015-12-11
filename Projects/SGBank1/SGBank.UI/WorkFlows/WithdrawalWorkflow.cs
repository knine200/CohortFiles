﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SGBank.BLL;
using SGBank.Models;

namespace SGBank.UI.WorkFlows
{
    public class WithdrawalWorkflow
    {
        private Account _currentAccount;

        public void Execute(Account account)
        {
            _currentAccount = account;
            decimal amount = GetWithdrawalAmountFromUser();
            MakeWithdrawal(amount);


        }

        public decimal GetWithdrawalAmountFromUser()
        {
            do
            {
                Console.Write("Enter Withdrawal amount: ");
                string input = Console.ReadLine();

                decimal withdrawalAmount;
                if (decimal.TryParse(input, out withdrawalAmount))
                {
                    return withdrawalAmount;
                }

                Console.WriteLine("That was not a valid amount...");
                Console.WriteLine("Press enter to continue...");
                Console.ReadLine();

            } while (true);
        }

        public void MakeWithdrawal(decimal Amount)
        {
            var ops = new AccountOperations();
            var response = ops.Withdraw(_currentAccount, Amount);

            if (response.Success)
            {
                Console.WriteLine();
                Console.WriteLine("Withdrawed {0:c} to account {1}.", response.WithdrawalInfo.WithdrawalAmount,
                    response.WithdrawalInfo.AccountNumber);
                Console.WriteLine("New Balance: {0:c}", response.WithdrawalInfo.NewBalance);
                Console.WriteLine("Press Enter to continue...");
                Console.ReadLine();
            }
        }


    }
}
