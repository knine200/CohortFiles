using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace FunWithExceptions
{
    class Program
    {
        static void Main(string[] args)
        {
            //CauseException();
            //HandleException();
            //HandleSpecificException();
            //FinallyExample();
            //CallStackExample();
            ThrowCustomException();

            Console.ReadLine();
        }

        static void CauseException()
        {
            int x = 5;
            int y = 0;

            Console.WriteLine(x/y);
        }

        static void HandleException()
        {
            try
            {
                CauseException();
            }
            catch
            {
                Console.WriteLine("You did something bad, " +
                    "but I'm going to keep running!");
            }
        }

        static void HandleSpecificException()
        {
            try
            {
                int[] ints = new int[2];

                //TODO: I need to fix this!
                ints[20] = 50;

                ints[0] = 5;
            }
            catch (IndexOutOfRangeException)
            {
                Console.WriteLine("Index out of range!");
            }
            catch
            {
                Console.WriteLine("AN EXCEPTION OCCURED!");
            }
        }

        static void FinallyExample()
        {
            try
            {
                int x = 5;
                int y = 3;

                Console.WriteLine(x/y);
            }
            catch (DivideByZeroException dex)
            {
                Console.WriteLine("Exception Occurred");
                Console.WriteLine(dex.Message);
                Console.WriteLine(dex.StackTrace);
                Console.WriteLine("********************************");
            }
            finally
            {
                Console.WriteLine("In the Finally!");
            }
        }

        static void CallStackExample()
        {
            try
            {
                Method1();
            }
            catch (DivideByZeroException)
            {
                Console.WriteLine("Catch clause in CallStackExample()");
            }
            finally
            {
                Console.WriteLine("Finally clause in CallStackExample()");
            }

            Console.WriteLine("Keep Running!");
        }

        static void Method1()
        {
            try
            {
                Method2();
            }
            catch (NullReferenceException)
            {
                Console.WriteLine("Catch clause in Method1()");
            }
            finally
            {
                Console.WriteLine("Finally clause in Method1()");
            }
        }

        static void Method2()
        {
            try
            {
                CauseException();
            }
            catch (IndexOutOfRangeException)
            {
                Console.WriteLine("Catch clause in Method2()");
            }
            finally
            {
                Console.WriteLine("Finally clause in Method2()");
            }
        }

        static void ThrowCustomException()
        {
            try
            {
                throw new MySpecificException("Not a chance!");

                // creating an exception type that already exists
                throw new DivideByZeroException();
            }
            catch (MySpecificException mex)
            {
                Console.WriteLine(mex.Message);
                Console.WriteLine(mex.StackTrace);
                Console.WriteLine(mex.HelpLink);
            }
        }
    }
}
