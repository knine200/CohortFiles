using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MaskingAndBase
{
    class DerivedClass : BaseClass
    {
        public new string Field1 = "Derived class Field1";

        public void PrintField1()
        {
            Console.WriteLine(Field1);
            Console.WriteLine(base.Field1);
        }
    }
}
