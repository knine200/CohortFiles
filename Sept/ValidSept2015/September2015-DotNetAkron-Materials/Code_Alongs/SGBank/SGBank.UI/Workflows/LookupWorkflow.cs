using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SGBank.BLL;
using SGBank.Models;

namespace SGBank.UI.Workflows
{
    public class LookupWorkflow
    {
        private Account _currentAccount;

        public void Execute()
        {
            int accountNumber = GetAccountNumberFromUser();
            DisplayAccountInformation(accountNumber);
        }

        public int GetAccountNumberFromUser()
        {
            do
            {
                Console.Clear();
                Console.Write("Enter an account number: ");
                string input = Console.ReadLine();

                int accountNumber;
                if (int.TryParse(input, out accountNumber))
                {
                    return accountNumber;
                }

                Console.WriteLine("That was not a valid account number...");
                Console.WriteLine("Press enter to continue...");
                Console.ReadLine();

            } while (true);
        }

        public void DisplayAccountInformation(int AccountNumber)
        {
            var ops = new AccountOperations();
            var response = ops.GetAccount(AccountNumber);

            if (response.Success)
            {
                _currentAccount = response.AccountInfo;
                PrintAccountInformation(response.AccountInfo);
                DisplayAccountMenu();
            }
            else
            {
                Console.WriteLine("Error Occurred!!!");
                Console.WriteLine(response.Message);
                Console.WriteLine("Move Along...");
                Console.ReadLine();
            }
        }

        public void PrintAccountInformation(Account AccountInfo)
        {
            Console.Clear();
            Console.WriteLine("Account Information");
            Console.WriteLine("-----------------------");
            Console.WriteLine("Account Number: {0}", AccountInfo.AccountNumber);
            Console.WriteLine("Name: {0}, {1}", AccountInfo.LastName, AccountInfo.FirstName);
            Console.WriteLine("Account Balance: {0:c}", AccountInfo.Balance);
        }

        public void DisplayAccountMenu()
        {
            string input = "";
            do
            {
                Console.WriteLine();
                Console.WriteLine("1. Deposit");
                Console.WriteLine("2. Withdraw");
                Console.WriteLine("3. Transfer");
                Console.WriteLine();
                Console.WriteLine("(Q) to Quit");
                Console.WriteLine();
                Console.WriteLine();
                Console.Write("Enter Choice: ");

                input = Console.ReadLine();

                if (input.ToUpper() != "Q")
                {
                    ProcessChoice(input);
                }

            } while (input.ToUpper() != "Q");
        }

        public void ProcessChoice(string Choice)
        {
            switch (Choice)
            {
                case "1":
                    var depositWF = new DepositWorkflow();
                    depositWF.Execute(_currentAccount);
                    break;
                case "2":
                case "3":
                    Console.WriteLine("This feature is not implemented!");
                    Console.WriteLine("Press Enter to continue...");
                    Console.ReadLine();
                    break;
                default:
                    Console.WriteLine("Invalid Entry...");
                    Console.WriteLine("Press Enter to continue...");
                    Console.ReadLine();
                    break;
            }

            PrintAccountInformation(_currentAccount);
        }
    }
}
