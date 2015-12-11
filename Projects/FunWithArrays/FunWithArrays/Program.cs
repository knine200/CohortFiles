using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace FunWithArrays
{
    class Program
    {
        static void Main(string[] args)
        {
            Program prog = new Program();
           // prog.IterateString();

           // prog.SplitString();



           // prog.SimpleArray();

            //prog.ReverseString();

            //prog.DeclareImplicitArrays();



            //prog.ArrayofObjects();

            prog.RectMultiDimensionalArray();


            Console.ReadLine();
        }

        public void IterateString()
        {
            string s1 = "this is a string of characters.";

            foreach (char c in s1)
            {
                Console.WriteLine(c);

            }

            Console.WriteLine("The character at index 3 is {0}", s1[3]);
            Console.WriteLine("The length of s1 is {0}", s1.Length);

        }

        public void SplitString()
        {
            string[] words = "This is a sentence".Split(' ');

            foreach (string s in words)
            {
                Console.WriteLine(s);

            }
        }

        public void SimpleArray()
        {
            int[] myInts = new int[3];
            myInts[0] = 100;
            myInts[1] = 200;

            foreach (int i in myInts)
            {
                Console.WriteLine(i);
            }

        }

        public void ReverseString()
        {
            string myString = "String to Reverse";

            for (int i = 0; i < myString.Length; i++)
            {
                Console.Write(myString[myString.Length-1-i]);
            }

            Console.WriteLine();

            for (int i = myString.Length - 1; i >= 0; i--)
            {
                Console.Write(myString[i]);
            }
        }

        public void DeclareImplicitArrays()
        {
            var a = new[] {1, 10, 100, 1000};
            Console.WriteLine("a is a: {0}", a.ToString());

            var b = new[] {1, 1.5, 2, 2.5};
            Console.WriteLine("b is a: {0}", b.ToString());

            var c = new[] {"hello", null, "world"};
            Console.WriteLine("c is a: {0}", c.ToString());


        }

        public void ArrayofObjects()
        {
            object[] myObjects = new object[4];
            myObjects[0] = 10;
            myObjects[1] = false;
            myObjects[2] = new DateTime(2015, 09,21);
            myObjects[3] = "THis is a string";

            foreach (object myObject in myObjects)
            {
                Console.WriteLine("Type: {0}, Value:{1}", myObject.GetType(), myObjects);
            }
        }

        public void RectMultiDimensionalArray()
        {
            int [,] myGrid = new int[5, 6];

            for (int i = 0; i < 5; i++)
            {
                for (int j = 0; j < 6; j++)
                {
                    Console.Write(myGrid[i, j] + "/t");
                }

                Console.WriteLine();
            }

        }

    }
}
