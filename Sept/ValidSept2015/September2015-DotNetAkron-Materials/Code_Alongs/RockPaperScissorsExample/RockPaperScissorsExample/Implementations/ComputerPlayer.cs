using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RockPaperScissorsExample.Enums;

namespace RockPaperScissorsExample.Implementations
{
    public class ComputerPlayer : Player
    {
        private static Random _randomGenerator = new Random();

        public ComputerPlayer(string Name) : base(Name)
        {
        }

        public override Choice GetChoice()
        {
            int i = _randomGenerator.Next(1, 4);

            return (Choice) i;
        }
    }
}
