using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FunWithConstructorsAndPartials
{
    class Program
    {
        static void Main(string[] args)
        {
            Player p1 = new Player("Player 1");
            Player p2 = new Player();

            GameWorkflow game = new GameWorkflow();
            game.Player1 = p1;
            game.Player2 = p2;

            game.PlayGame();

            Console.ReadLine();
        }
    }
}
