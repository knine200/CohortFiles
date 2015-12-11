using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VariableScope.Library
{
    class Class1
    {
        public Class1()
        {
            // can't access private class even in same assembly
            //PrivateClass newPClass = new PrivateClass();
        }
    }
}
