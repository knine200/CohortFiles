using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HResourceData
{
    public class HPolicyRepository
    {
        public string RootPath1 { get; set; }



        private string _filePath(string category)
        {
           
                var currentData = String.Format(@"DataFiles/{0}.txt", category);

                return RootPath1 + currentData;
        
        }





    }
}
