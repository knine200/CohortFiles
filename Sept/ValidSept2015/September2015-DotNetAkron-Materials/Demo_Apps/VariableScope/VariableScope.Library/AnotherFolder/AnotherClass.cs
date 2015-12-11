using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using VariableScope.Library.NameSpaceChanged;

namespace VariableScope.Library.AnotherFolder
{
    public class AnotherClass
    {
        private int _number; //= 15; // this will not be used if this is also set in constructor
        public string Name = "Victor";

        public AnotherClass()
        {
            // no reference necessary
            // I do have to add using statement for the namespace
            Class1B newClass = new Class1B();
            _number = 17;
        }

        public int ReturnNumber()
        {
            // NOT returning the actual property
            // just the value
            return _number;
        }

        public string ReturnName()
        {
            return Name;
        }
    }
}
