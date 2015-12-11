using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Statement


namespace Data
{
    public class data
    {
        private const string _filePath = @"DataFiles\statement.txt";

        public List<string> GetAllStatement()
        {
            List<string> newStatement = new List<string>();

            var reader = File.ReadAllLines(_filePath);

            for (int i = 1; i < reader.Length; i++)
            {
                var columns = reader[i].Split(',');

                var newState = new 

            }

            return 
        }

    }
}
