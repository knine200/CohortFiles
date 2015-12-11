using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Channels;
using System.Text;
using System.Threading.Tasks;

namespace CollectionExamples.Collections
{
    public class NonGenerics
    {
        public static void ShowArrayList()
        {
            Console.WriteLine("Show ArrayList");

            ArrayList intList = new ArrayList();
            
            intList.Add(1);
            intList.Add(5);
            intList.Add(10);
            intList.Add(4);
            //intList.Add("Hello");

            int sum = 0;
            foreach (object o in intList)
            {
                sum += (int)o;
            }

            Console.WriteLine("The sum is {0}", sum);

            Console.WriteLine();
        }

        public static void ShowHashTable()
        {
            Console.WriteLine("Show HashTable");

            Hashtable applicationMap = new Hashtable();

            applicationMap.Add("txt", "notepad.exe");
            applicationMap.Add("bmp", "paint.exe");
            applicationMap.Add("jpg", "paint.exe");
            applicationMap.Add("docx", "word.exe");

            foreach (var key in applicationMap.Keys)
            {
                Console.WriteLine("{0} - {1}", key, applicationMap[key]);
            }

            string extension;
            do
            {
                Console.Write("Enter an extension: ");
                extension = Console.ReadLine();
            } while (!applicationMap.ContainsKey(extension));
             
            Console.WriteLine("For extension {0} your value is {1}", extension, applicationMap[extension]);

            Console.WriteLine();
        }

        public static void ShowStack()
        {
            Console.Write("Show Stack");

            Stack myStack = new Stack();
            myStack.Push("Hello");
            myStack.Push("World");
            myStack.Push("!");

            for (int i = 0; i < 3; i++)
            {
                Console.WriteLine(myStack.Pop());
            }

            Console.WriteLine();
        }

        public static void ShowQueue()
        {
            Console.WriteLine("Show Queue");

            Queue myQueue = new Queue();
            myQueue.Enqueue("Hello");
            myQueue.Enqueue("World");
            myQueue.Enqueue("!");

            for (int i = 0; i < 3; i++)
            {
                Console.WriteLine(myQueue.Dequeue());
            }

            Console.WriteLine();
        }
    }
}
