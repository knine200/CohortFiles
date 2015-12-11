using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FunWithConstructorsAndPartials
{
    public class GameWorkflow
    {
        // public properties for Player objects
        public Player Player1 { get; set; }
        public Player Player2 { get; set; }

        // static readonly property
        // this can be set in the constructor
        // if it were const it could not be set in constructor and would need value in declaration.
        private static readonly Random _randomKey;

        // static constructor
        // only accessing static properties
        // cannot take parameters
        // cannot have more than 1 constructor
        static GameWorkflow()
        {
            _randomKey = new Random();
        }

        // simply demonstrating a private method.
        // we only need to call this in this class so make it private
        private int RollDice()
        {
            return _randomKey.Next(1, 7);
        }

        public void PlayGame()
        {
            while (Player1.Score < 100 && Player2.Score < 100)
            {
                Player1.Score += RollDice();
                Player2.Score += RollDice();
            }

            Console.ForegroundColor = ConsoleColor.Cyan;
            Console.WriteLine("GAME OVER");
            Console.WriteLine("{0}: {1}  vs  {2}: {3}", Player1.Name, Player1.Score, Player2.Name, Player2.Score);
        }
    }
}
