using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SamuraiDI.Models
{
    public class Sword : IWeapon
    {
        public void Hit(string Target)
        {
            Console.WriteLine("Chopped {0} clean in half!", Target);

        }
    }
}
