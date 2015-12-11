using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RPG.Inventory.Base;

namespace RPG.Inventory.Containers
{
    public class ReagentPouch : SpecificContainer
    {
        public ReagentPouch() : base(ItemType.Reagent, 12)
        {
            Name = "A small pouch";
            Description = "This belt pouch could hold a few small reagents";
            Weight = 1;
            Value = 150;
        }
    }
}
