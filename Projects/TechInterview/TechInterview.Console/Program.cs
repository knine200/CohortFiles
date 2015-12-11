using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;


namespace TechInterview.Console
{
    class Program
    {
        static void Main(string[] args)
        {



            WordCount();
            System.Console.ReadLine();

        }


        public static void WordCount()
        {

            string _filePath = @"statement.txt";

            StreamReader read = new StreamReader(_filePath);

            string statement = read.ReadToEnd();

           List<string> currentStatement = statement.Split(' ',  '?', '"', '.', '\n', '\r', ',' ).ToList();

          
            var result = currentStatement.GroupBy(x => x.Trim()).OrderByDescending(y => y.Count());
            int i = 0;
            foreach (var x in result)
            {
                i++;
                System.Console.WriteLine("Word: {0}\t\tOccurred: \t{1} times", x.Key, x.Count());
                if (i != 50) continue;
                System.Console.ReadLine();
                i = 0;
            }


        }
    }
}
