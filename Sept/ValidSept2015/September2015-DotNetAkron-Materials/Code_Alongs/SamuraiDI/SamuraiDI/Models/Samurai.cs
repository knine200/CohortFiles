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
        public List<IITem> Items { get; set; } 
        private readonly IWeapon _weapon;

        // constructor injection
        public Samurai(IWeapon weapon)
        {
            _weapon = weapon;
            Items = new List<IITem>();
        }

        public void Attack(string Target)
        {
            _weapon.Hit(Target);
        }

        // method injection
        public void PickupItem(IITem Item)
        {
            Items.Add(Item);
        }
    }
}
