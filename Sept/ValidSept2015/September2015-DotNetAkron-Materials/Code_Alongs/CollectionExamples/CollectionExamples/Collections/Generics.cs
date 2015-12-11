using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CollectionExamples.Collections
{
    public class Generics
    {
        public void MakeStack()
        {
            Console.WriteLine("Generic Stack");

            Stack<Person> stack = new Stack<Person>();

            stack.Push(new Person { FirstName = "Homer", LastName = "Simpson", ID = 1 });
            stack.Push(new Person { FirstName = "Marge", LastName = "Simpson", ID = 2 });
            stack.Push(new Person { FirstName = "Bart", LastName = "Simpson", ID = 3 });

            Person simpson;
            for (int i = 0; i < 3; i++)
            {
                simpson = stack.Pop();

                Console.WriteLine("{0}, {1}", simpson.LastName, simpson.FirstName);
            }

            Console.WriteLine();
        }

        public void MakeQueue()
        {
            Console.WriteLine("Generic Queue");

            Queue<Person> myQueue = new Queue<Person>();

            myQueue.Enqueue(new Person {FirstName = "Homer", LastName = "Simpson", ID = 1});
            myQueue.Enqueue(new Person { FirstName = "Marge", LastName = "Simpson", ID = 2 });
            myQueue.Enqueue(new Person { FirstName = "Bart", LastName = "Simpson", ID = 3 });

            Person simpson;

            simpson = myQueue.Peek();
            Console.WriteLine("First Elemenet is {0}, {1}", simpson.LastName, simpson.FirstName);

            for (int i = 0; i < 3; i++)
            {
                simpson = myQueue.Dequeue();

                Console.WriteLine("{0}, {1}", simpson.LastName, simpson.FirstName);
            }

            Console.WriteLine();
        }

        public void SimpleList()
        {
            Console.WriteLine("Simple List");

            List<int> numbers = new List<int>();

            numbers.Add(1);
            numbers.AddRange(new int[] {5,6,7,8});

            numbers.Insert(2, 100);

            foreach (var num in numbers)
            {
                Console.WriteLine(num);
            }

            numbers.Remove(6);

            numbers.RemoveRange(1,2);

            numbers.RemoveAt(2);

            Console.WriteLine();
        }

        public void PersonList()
        {
            Console.WriteLine("List of People");

            List<Person> simpsons = new List<Person>
            {
                new Person {FirstName = "Homer", LastName = "Simpson", ID = 1},
                new Person {FirstName = "Marge", LastName = "Simpson", ID = 2}
            };

            Person bart = new Person();
            bart.FirstName = "Bart";
            bart.LastName = "Simpson";
            bart.ID = 3;

            simpsons.Add(bart);

            foreach (Person simpson in simpsons)
            {
                Console.WriteLine("{0}, {1}", simpson.LastName, simpson.FirstName);
            }

            Person marge = simpsons[1];

            simpsons.Remove(marge);
            Console.WriteLine("You just removed {0}, {1}", marge.LastName, marge.FirstName);

            foreach (Person simpson in simpsons)
            {
                Console.WriteLine("{0}, {1}", simpson.LastName, simpson.FirstName);
            }

            Console.WriteLine();
        }

        public void PersonDictionary()
        {
            Console.WriteLine("Person Dictionary");

            Person homer = new Person() {FirstName = "Homer", LastName = "Simpson", ID = 1};
            Person marge = new Person() { FirstName = "Marge", LastName = "Simpson", ID = 2 };
            Person bart = new Person() { FirstName = "Bart", LastName = "Simpson", ID = 3 };

            Dictionary<int, Person> simpsons = new Dictionary<int, Person>();

            simpsons.Add(homer.ID, homer);
            simpsons.Add(marge.ID, marge);
            simpsons.Add(bart.ID, bart);

            foreach (int key in simpsons.Keys)
            {
                Console.WriteLine("{0}, {1}", simpsons[key].LastName, simpsons[key].FirstName);
            }

            Console.WriteLine("Key 3 belongs to {0}, {1}", simpsons[3].LastName, simpsons[3].FirstName);


            Console.WriteLine();
        }
    }
}
