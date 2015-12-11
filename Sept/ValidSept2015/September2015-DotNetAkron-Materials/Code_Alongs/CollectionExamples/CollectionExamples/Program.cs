using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CollectionExamples.Collections;

namespace CollectionExamples
{
    class Program
    {
        static void Main(string[] args)
        {
            //NonGenerics.ShowArrayList();
            //NonGenerics.ShowHashTable();
            //NonGenerics.ShowStack();
            //NonGenerics.ShowQueue();

            Generics collections = new Generics();
            collections.MakeStack();
            collections.MakeQueue();
            collections.SimpleList();
            collections.PersonList();
            collections.PersonDictionary();

            Console.ReadLine();
        }
    }
}
