using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SamuraiDI.Models
{
    public class Ration : IITem
    {
        public void Use()
        {
            Console.WriteLine("Eating a ration");


        }
    }
}
