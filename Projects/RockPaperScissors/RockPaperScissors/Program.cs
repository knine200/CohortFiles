using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RockPaperScissors
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Rock, Paper, Scissors......");
            Game newGame = new Game();

            string Input = "";

            do
            {
                newGame.PlayRound();

                Console.Write("Would you like to play again? (enter \"Q\" to Quit); ");
                Input = Console.ReadLine();
            } while (Input.ToUpper() != "Q");

        }
    }
}
