using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SGBank.BLL;
using SGBank.Models;

namespace SGBank.UI.Workflows
{
    public class DepositWorkflow
    {
        private Account _currentAccount;

        public void Execute(Account account)
        {
            _currentAccount = account;
            decimal amount = GetDepositAmountFromUser();
            MakeDeposit(amount);

        }

        public decimal GetDepositAmountFromUser()
        {
            do
            {
                Console.Write("Enter deposit amount: ");
                string input = Console.ReadLine();

                decimal depositAmount;
                if (decimal.TryParse(input, out depositAmount))
                {
                    return depositAmount;
                }

                Console.WriteLine("That was not a valid amount...");
                Console.WriteLine("Press enter to continue...");
                Console.ReadLine();

            } while (true);
        }

        public void MakeDeposit(decimal Amount)
        {
            var ops = new AccountOperations();
            var response = ops.Deposit(_currentAccount, Amount);

            if (response.Success)
            {
                Console.WriteLine();
                Console.WriteLine("Deposited {0:c} to account {1}.", response.DepositInfo.DepositAmount, 
                    response.DepositInfo.AccountNumber);
                Console.WriteLine("New Balance: {0:c}", response.DepositInfo.NewBalance);
                Console.WriteLine("Press Enter to continue...");
                Console.ReadLine();
            }
        }
    }
}
