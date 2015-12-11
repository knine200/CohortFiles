﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RPG.Inventory.Base;

namespace RPG.Inventory.Containers
{
    public class Backpack : Container
    {
        public Backpack() : base(8)
        {
            Name = "A leather backpack";
            Description = string.Format("This is a {0} slot backpack", _capacity);
            Weight = 5;
            Value = 1500;
        }
    }
}
