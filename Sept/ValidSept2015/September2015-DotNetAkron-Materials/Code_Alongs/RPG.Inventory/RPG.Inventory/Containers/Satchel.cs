using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RPG.Inventory.Base;

namespace RPG.Inventory.Containers
{
    public class Satchel : Container
    {
        public Satchel() : base(4)
        {
            Name = "A small cloth satchel";
            Description = "This can carry your knick-knacks";
            Weight = 1;
            Value = 50;
        }

        public override void AddItem(Item itemToAdd)
        {
            if (itemToAdd.Weight > 1)
            {
                Console.WriteLine("That is way too big for the satchel!");
            }
            else
            {
                base.AddItem(itemToAdd);
            }
        }
    }
}
