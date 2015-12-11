using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SamuraiDI.Models
{
    class Samurai
    {
        // property injection
        private readonly IWeapon _weapon;

        public List<IITem> items { get; set; } 

        //constructor injection
        public Samurai(IWeapon weapon)
        {
            _weapon = weapon;
            items = new List<IITem>();

        }


        public void Attack(string Target)
        {
            _weapon.Hit(Target);
        }


        //method injection
        public void PickupItem(IITem item)
        {
            items.Add(item);
        }



    }
}
