using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MaskingAndBase
{
    class Program
    {
        static void Main(string[] args)
        {
            DerivedClass d = new DerivedClass();
            d.PrintField1();

            Console.WriteLine();

            Console.WriteLine(d.Field1);
            Console.WriteLine(((BaseClass)d).Field1);

            Console.ReadLine();
        }
    }
}
