using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterviewExercises
{
    class Program
    {
        static void Main(string[] args)
        {

            string mystatement = "Today I had a tough task to complete";
             var after = mystatement.Reverse();
            foreach (var a in after)
            {
                Console.WriteLine();
            }

            Console.WriteLine();

            Console.ReadLine();
        }


      
    }
}
