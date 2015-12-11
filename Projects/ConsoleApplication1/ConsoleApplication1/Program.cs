using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {

           SecondAttempt();
           //fizzbuzz();

            Console.ReadLine();
        }


        public static void FirstSample()
        {

            int count = 0;

            int count1 = 0;

            string statement =
                "There are beautiful days out there, when you think about your are some days out out such disgust ain't what " +
                "you need to worry about there you disgust don't you is some some some days are along the road is is such ways disgust ain't";

            string[] newS = statement.Split(' ');

            foreach (var word in newS)
            {
                if (word == "ain't")
                {
                    count++;
                }
                else if (word == "you")
                {
                    count1++;
                }

                if (count > count1)
                {
                    Console.WriteLine("ain't");
                    Console.WriteLine("you");
                }

            }

            //if (count > count1)
            //{
            //    Console.WriteLine("ain't");
            //}
            //else
            //{
            //    Console.WriteLine("you");
            //}
        }


        public static void SecondAttempt()
        {
           

            string statement =
                "There are beautiful days out there, when you think about your are some days out out such disgust ain't what " +
                "you need to worry about there you disgust don't you is some some some days are along the road is is such ways disgust ain't";




            List<string> newS = new List<string>(statement.Split(' '));



            var result = newS.GroupBy(x => x).OrderByDescending(l => l.Count());

            //var result = from p in newS
            //    where p.StartsWith("y")
            //    select p;





            foreach (var i in result)
            {
                Console.WriteLine("{0} occurred {1} times ", i.Key, i.Count());

            }

        }


        public static void fizzbuzz()
        {
            for (int i = 1; i <= 100; i++)
            {
                if (i%5 == 0 && i%3 == 0)
                {
                    Console.WriteLine("{0}: fizzbuzz", i);
                }
                if (i%5 == 0)
                {
                    Console.WriteLine("{0}: fizz", i);
                }
                else if (i%3 == 0)
                {
                    Console.WriteLine("{0}: buzz", i);
                }
            }
        }



    }
}
