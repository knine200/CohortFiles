using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FunWithConstructorsAndPartials
{
    public partial class Player
    {
        // property with a private set
        // property can only be set in this class
        public string Name { get; private set; }

        // property
        public int Score { get; set; }

        // constructor
        public Player()
        {
            // defaulting a property in the constructor
            Name = "New Player";
        }
    }
}
