using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Polymorphism
{
    class Program
    {
        static void Main(string[] args)
        {
            Shape[] myShapes = new Shape[3];
            myShapes[0] = new Shape();
            myShapes[1] = new Circle() {Radius = 10};
            myShapes[2] = new Square();

            foreach (Shape shape in myShapes)
            {
                Console.WriteLine(shape.Draw());

                if (shape is Circle)
                {
                    Console.WriteLine("\tThe radius is {0}", ((Circle)shape).Radius);
                }
            }

            Console.ReadLine();
        }
    }
}
