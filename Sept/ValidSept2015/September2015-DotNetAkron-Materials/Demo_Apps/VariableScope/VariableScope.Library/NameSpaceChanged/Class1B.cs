using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VariableScope.Library.NameSpaceChanged
{
    // Class1B can see Class1
    // they are in different namespaces but they are in the same project\assembly
    class Class1B : Class1
    {
    }
}
