using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TicTacToek
{
    class Program
    {
        static void Main(string[] args)
        {
            GuessNumber();

            Console.ReadLine();


        }


        public static void GuessNumber()
        {
            Random com = new Random();

            int compchoice;
            int myChoice;
            int gameWon= 0;

            do
            {
                Console.WriteLine("Kooshin, Guess the computer guess between (1-10)?");

                myChoice = int.Parse(Console.ReadLine());

                compchoice = com.Next(1, 11);

                if (myChoice == compchoice)
                {
                    Console.WriteLine("You have guessed the correct number {0} by the computer, congratulations!", compchoice);

                    gameWon++;

                }
                else if (myChoice != compchoice)
                {
                    Console.WriteLine("Incorrect guess!");
                    Console.WriteLine("The computer chose {0} ", compchoice);                   

                }


            } while (gameWon == 0);



            


        }
    }
}
