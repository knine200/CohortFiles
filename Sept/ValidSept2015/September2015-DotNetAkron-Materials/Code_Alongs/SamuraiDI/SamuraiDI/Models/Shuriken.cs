using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SamuraiDI.Models
{
    public class Shuriken : IWeapon
    {
        public void Hit(string Target)
        {
            Console.WriteLine("Pierced {0}'s armor!", Target);
        }
    }
}
