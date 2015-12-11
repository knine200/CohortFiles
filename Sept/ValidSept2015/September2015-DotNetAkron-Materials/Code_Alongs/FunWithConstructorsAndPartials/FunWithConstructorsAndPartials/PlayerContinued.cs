using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FunWithConstructorsAndPartials
{
    // demonstrating a partial class with Player.cs
    // the majority of the implementation is in other file.
    public partial class Player
    {
        // constructor to take Name
        // this also overloads the constructor since the other file has one.
        // more than one instance construstor can exist in same file
        public Player(string Name)
        {
            // the this keyword is allowing me to visually see that I am accessing the class property
            this.Name = Name;
        }
    }
}
