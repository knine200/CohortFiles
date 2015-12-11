using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TicTacToe
{
    class Program
    {
        static void Main(string[] args)
        { 
            PlayGame();
            Console.ReadLine();

        }


        public static void PlayGame()
        {
            string playerInput1;
            string playerInput2;
            string player1Name;
            string player2Name;
            int gameWon = 0;
            string box0 = "1";
            string box1 = "2";
            string box2 = "3";
            string box3 = "4";
            string box4 = "5";
            string box5 = "6";
            string box6 = "7";
            string box7 = "8";
            string box8 = "9";
           

            Console.WriteLine("Welcome to TicTacToe!!");


            Console.WriteLine(@" 

                                 |  {0}  |   {1}  |   {2}
                                 ___________________

                                 |  {3}  |   {4}  |   {5}
                                 ___________________
                             
                                 |  {6}  |   {7}  |   {8}


", box0, box1, box2, box3, box4, box5, box6, box7, box8);


            Console.Write("Player1, input your Name: ");
            player1Name = Console.ReadLine();

            Console.Write("Player2, input your Name: ");
            player2Name = Console.ReadLine();



            do
            {
                
                GamePlay(player1Name, player2Name);
              


            } while (gameWon == 0);


        }


        public static void GamePlay(string a, string b)
        {
            string playerInput1;
            string playerInput2;          
            int gameWon = 0;
            string box0 = "1";
            string box1 = "2";
            string box2 = "3";
            string box3 = "4";
            string box4 = "5";
            string box5 = "6";
            string box6 = "7";
            string box7 = "8";
            string box8 = "9";




            Console.WriteLine("{0} make your selection: ", a);
            int oChoice1 = int.Parse(Console.ReadLine());

            Console.WriteLine("{0} make your selection: ", b);
            int oChoice2 = int.Parse(Console.ReadLine());

            if (oChoice1 == 1)
            {
                box0 = "O";
            }
            else if (oChoice2 == 1)
            {
                box0 = "X";
            }

            if (oChoice1 == 2)
            {
                box1 = "O";
            }
            else if (oChoice2 == 2)
            {
                box1 = "X";
            }
            if (oChoice1 == 3)
            {
                box2 = "O";
            }
            else if (oChoice2 == 3)
            {
                box2 = "X";
            }
            if (oChoice1 == 4)
            {
                box3 = "O";
            }
            else if (oChoice2 == 4)
            {
                box3 = "X";
            }

            if (oChoice1 == 5)
            {
                box4 = "O";
            }
            else if (oChoice2 == 5)
            {
                box4 = "X";
            }

            if (oChoice1 == 6)
            {
                box5 = "O";
            }
            else if (oChoice2 == 6)
            {
                box5 = "X";
            }
            if (oChoice1 == 7)
            {
                box6 = "O";
            }
            else if (oChoice2 == 7)
            {
                box6 = "X";
            }
            if (oChoice1 == 8)
            {
                box7 = "O";
            }
            else if (oChoice2 == 8)
            {
                box7 = "X";
            }

            if (oChoice1 == 9)
            {
                box8 = "O";
            }
            else if (oChoice2 == 9)
            {
                box8 = "X";
            }

            Console.Clear();
            Console.WriteLine(@" 

                                 |  {0}  |   {1}  |   {2}
                                 ___________________

                                 |  {3}  |   {4}  |   {5}
                                 ___________________
                             
                                 |  {6}  |   {7}  |   {8}


", box0, box1, box2, box3, box4, box5, box6, box7, box8);

        }
    }
}
