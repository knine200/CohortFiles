using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RockPaperScissorsExample.Enums;

namespace RockPaperScissorsExample
{
    public class MatchResult
    {
        public Choice Player1_Choice { get; set; }
        public Choice Player2_Choice { get; set; }
        public Result Match_Result { get; set; }
    }
}
