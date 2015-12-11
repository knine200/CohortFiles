using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Factorizer
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            Console.WriteLine("Welcome to Factorizer!");
            Console.WriteLine("-----------------------------");

            GamePlay();

            Console.ReadLine();
        }

        public static void GamePlay()
        {
            Console.Write("Please select a number: ");
            int UserInput = int.Parse(Console.ReadLine());

            int p = 0;            
                for (int i = 1; i < UserInput; i++)
                {   
                    if (UserInput%i == 0)
                    {
                        Console.WriteLine("{0}", i);
                        p += i;
                    }
                }
            if (p == 1)
            {
                Console.WriteLine("{0} is a prime number", UserInput);
            }
            else
            {
                Console.WriteLine("{0} is not a prime number", UserInput);
                if (p == UserInput)
                {
                    Console.WriteLine("{0} is a perfect number", UserInput);
                }
            }

        }




    }
}
