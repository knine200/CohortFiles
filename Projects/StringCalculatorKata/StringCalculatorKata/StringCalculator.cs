using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StringCalculatorKata
{
    public class StringCalculator
    {
        public int Add(string numbers)
        {
            if (numbers == "")
            {
                return 0;
            }

            string[] array = numbers.Split(',', '\n', ';');
            

            int sum = 0;

            foreach (string number in array)
            {
                sum += int.Parse(number);

            }

            return sum;
        }

       
   

    }
}
