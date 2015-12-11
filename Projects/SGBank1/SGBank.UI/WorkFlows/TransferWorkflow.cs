using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SGBank.Models;

namespace SGBank.UI.WorkFlows
{
    class TransferWorkflow
    {
        private Account _currentAccount;

        public void Execute(Account account)
        {
            _currentAccount = account;

        }

        public decimal GetTransferAmountFromUser()
        {
            do
            {
                Console.Write("Enter Transfer amount: ");
                string input = Console.ReadLine();

                decimal transferAmount;
                if (decimal.TryParse(input, out transferAmount))
                {
                    return transferAmount;
                }

                Console.WriteLine("That was not a valid amount...");
                Console.WriteLine("Press enter to continue...");
                Console.ReadLine();

            } while (true);

        }

    }
}
