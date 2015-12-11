using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IComparableExample
{
    class Program
    {
        static void Main(string[] args)
        {
            var temperatures = new Temperature[]
            {
                new Temperature {Fahrenheit = 32},
                new Temperature {Fahrenheit = 120},
                new Temperature {Fahrenheit = 75},
                new Temperature {Fahrenheit = 54}
            };

            Array.Sort(temperatures);

            foreach (var temp in temperatures)
            {
                Console.WriteLine(temp.Fahrenheit);
            }

            Console.ReadLine();
        }
    }
}
