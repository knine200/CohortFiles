using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VariableScope.Library.AnotherFolder;

namespace VariableScope
{
    class Program
    {
        static void Main(string[] args)
        {
            // Main is static and doesnt have an instance of Program
            // Display text is an instance method and requires an instance of the program class
            //DisplayText();    // invalid
            Program prog = new Program();
            prog.DisplayText();     // this is valid, because prog is an instance of Program

            string name = "Software Guild";
            if (true)
            {
                int age = 21;

                // perfectly valid
                // declared outside the loop, therefore the loop can see it
                Console.WriteLine(name);
                name = "Victor";
            }

            // because age is declared in the if statement
            // nothing outside the if statement can see it
            //Console.WriteLine(age); // invalid due to no sight of age

            // name is still accessible, it was declared outside the if but inside the method
            Console.WriteLine(name);

            // valid because classes default to internal
            // internal means any class within same assemply\project can see it
            Contact newContact = new Contact();

            // I can't create this class
            // default is internal, this class is in the library not this project
            //Class1 newClass = new Class1();

            // private class in library, can't be created from here.
            //PrivateClass newPClass = new PrivateClass();

            // accessing public class ALWAYS allowed
            AnotherClass aClass = new AnotherClass();

            // cannot access private member
            //aClass._number = 31;

            // for visual assistance to minimize this code
            // still active code and will execute even when minimized
            #region value versus property

            // returns the value, not the property
            Console.WriteLine(aClass.ReturnNumber());
            Console.WriteLine(aClass.Name);

            string newName = aClass.ReturnName();
            newName = "Andrew";

            Console.WriteLine(aClass.Name);
            Console.WriteLine(newName);

            aClass.Name = "Patrick";

            Console.WriteLine(aClass.Name);
            Console.WriteLine(newName);
            
            #endregion

            Console.ReadLine();
        }

        void DisplayText()
        {
            Console.WriteLine("Text to display");
        }
    }
}
