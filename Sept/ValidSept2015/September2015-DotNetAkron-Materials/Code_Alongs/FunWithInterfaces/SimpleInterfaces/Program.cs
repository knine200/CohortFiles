using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimpleInterfaces
{
    class Program
    {
        static void Main(string[] args)
        {
            Chihuahua smallDog = new Chihuahua();
            Console.WriteLine(smallDog.GoForAWalk());

            GermanShepherd bigDog = new GermanShepherd();
            Console.WriteLine(bigDog.GoForAWalk());

            Bark(smallDog);
            Bark(bigDog);

            smallDog.Name = "TacoBell";

            Console.ReadLine();
        }

        public static void Bark(IDog dog)
        {
            dog.Bark();
        }
    }
}
