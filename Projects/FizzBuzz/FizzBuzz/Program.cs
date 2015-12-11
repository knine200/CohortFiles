using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FizzBuzz
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            FizzBuzz();
            Console.ReadLine();
        }

        public static void FizzBuzz()
        {
            int count = 0;
            int count1 = 0;
            int count2 = 0;

            for (int i = 1; i <= 100; i++)
            {


                if ((i%3 == 0) && (i%5 == 0))
                {
                    Console.WriteLine("{0} : FizzBuzz", i);
                    count++;
                }

                if (i%3 == 0)
                {
                    Console.WriteLine("{0} : Fizz", i);
                    count1++;
                }
                else if (i%5 == 0)
                {
                    Console.WriteLine("{0} : Buzz", i);
                    count2++;
                }


            }

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("*************************************************");
            Console.WriteLine("{0} is the amount of times FizzBuzz was found", count);
            Console.WriteLine("{0} is the amount of times Fizz was found", count1);
            Console.WriteLine("{0} is the amount of times Buzz was found", count2);

        }
    }
}
