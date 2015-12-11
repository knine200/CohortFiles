using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SamuraiDI.Models;

namespace SamuraiDI
{
    class Program
    {
        static void Main(string[] args)
        {
            //IWeapon weapon = new Shuriken();
            //weapon.Hit("Bad Guy");

            Samurai warrior1 = new Samurai(new Shuriken());
            Samurai warrior2 = new Samurai(new Sword());

            warrior1.Attack("the evildoers");
            warrior2.Attack("the evildoers");

            warrior1.PickupItem(new Ration());
            warrior1.items[0].Use();



            Console.ReadLine();
        }
    }
}
