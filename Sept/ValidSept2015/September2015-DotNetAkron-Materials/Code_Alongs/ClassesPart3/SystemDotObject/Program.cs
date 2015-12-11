using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SystemDotObject
{
    class Program
    {
        static void Main(string[] args)
        {
            Point newPoint = new Point(5,6);
            Console.WriteLine(newPoint);

            Point secondPoint = newPoint.Copy();

            Console.WriteLine(Object.Equals(newPoint, secondPoint));

            Console.WriteLine(Object.ReferenceEquals(newPoint, secondPoint));

            Console.ReadLine();
        }
    }
}
