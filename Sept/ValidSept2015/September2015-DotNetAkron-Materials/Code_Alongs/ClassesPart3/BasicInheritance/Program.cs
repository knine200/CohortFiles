using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasicInheritance
{
    class Program
    {
        static void Main(string[] args)
        {
            // create an object of type car
            Car myCar = new Car(80);
            myCar.Speed = 50;
            Console.WriteLine("My car is going {0} MPH", myCar.Speed);

            // create an object of type minivan 
            MiniVan myVan = new MiniVan();
            // note that speed is inherited from Car
            myVan.Speed = 10;
            Console.WriteLine("My van is going {0} MPH", myVan.Speed);

            // create a list of cars
            List<Car> myCars = new List<Car>();
            for (int i = 40; i < 90; i += 10)
            {
                // insert new minivans, note this is possible since minivan IS-A car
                myCars.Add(new MiniVan(i));
            }

            // loop to write everything out
            foreach (Car c in myCars)
            {
                Console.WriteLine("The car has a max speed of {0}", c.maxspeed);
            }

            Console.ReadLine();
        }
    }
}
