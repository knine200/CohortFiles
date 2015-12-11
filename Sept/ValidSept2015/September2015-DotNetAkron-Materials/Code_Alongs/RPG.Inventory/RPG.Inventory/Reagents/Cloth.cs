﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RPG.Inventory.Base;

namespace RPG.Inventory.Reagents
{
    public class Cloth : Item
    {
        public Cloth()
        {
            Name = "A piece of cloth";
            Description = "No really, it's just a piece of cloth";
            Weight = 0;
            Value = 10;
            Type = ItemType.Reagent;
        }
    }
}
