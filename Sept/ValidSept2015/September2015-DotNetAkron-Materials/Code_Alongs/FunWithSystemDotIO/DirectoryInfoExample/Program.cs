using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DirectoryInfoExample
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("***** Fun with Directory(Info) *****");
            Console.WriteLine();

            //ShowWindowsDirectoryInfo();
            //ModifyDirectory();
            //RemoveDirectory();
            //ListDrives();
            //ListDriveInfo();
            //SimpleFileIO();
            //FileStreamMethod();
            StreamReaderWriter();

            Console.ReadLine();
        }

        static void ShowWindowsDirectoryInfo()
        {
            Console.WriteLine("***** DirectoryInfo ******");
            DirectoryInfo dir = new DirectoryInfo(@"C:\Windows");
            Console.WriteLine("FullName: {0}", dir.FullName);
            Console.WriteLine("Name: {0}", dir.Name);
            Console.WriteLine("Parent: {0}", dir.Parent);
            Console.WriteLine("Creation: {0}", dir.CreationTime);
            Console.WriteLine("Attributes: {0}", dir.Attributes);
            Console.WriteLine("Root: {0}", dir.Root);
            Console.WriteLine("***************************");
        }

        static void ModifyDirectory()
        {
            DirectoryInfo dir = new DirectoryInfo(".");

            Console.WriteLine("Current Directory is {0}", dir.FullName);

            DirectoryInfo subDir = dir.CreateSubdirectory("MyFolder");

            Console.WriteLine("New Directory is {0}", subDir.FullName);
        }

        static void RemoveDirectory()
        {
            try
            {
                DirectoryInfo dir = new DirectoryInfo(@".\MyFolder");
                dir.Delete();
            }
            catch (IOException ex)
            {
                Console.WriteLine(ex.Message);
            }
            catch (Exception e)
            {
                Console.WriteLine("SORRY TRY AGAIN!!!");
            }
        }

        static void ListDrives()
        {
            string[] drives = Directory.GetLogicalDrives();
            foreach (var drive in drives)
            {
                Console.WriteLine(drive);
            }
        }

        static void ListDriveInfo()
        {
            DriveInfo[] myDrives = DriveInfo.GetDrives();

            foreach (var drive in myDrives)
            {
                Console.WriteLine("Name: {0}", drive.Name);
                Console.WriteLine("Type: {0}", drive.DriveType);

                if (drive.IsReady)
                {
                    Console.WriteLine("Free Space: {0}", drive.TotalFreeSpace);
                    Console.WriteLine("Format: {0}", drive.DriveFormat);
                    Console.WriteLine("Label: {0}", drive.VolumeLabel);
                }
                Console.WriteLine();
            }
        }

        static void SimpleFileIO()
        {
            string[] myTasks =
            {
                "Prep Lecture", "Upgrade my phone", "Take back equipment", "Eat Dinner"
            };

            File.WriteAllLines(@".\tasks.txt", myTasks);

            foreach (string task in File.ReadAllLines(@".\tasks.txt"))
            {
                Console.WriteLine("TODO: {0}", task);
            }
        }

        static void FileStreamMethod()
        {
            using (FileStream fStream = File.Open(@"myMessage.dat", FileMode.Create))
            {
                string msg = "Hello!";
                byte[] msgAsBytes = Encoding.Default.GetBytes(msg);

                // wrote the file out
                fStream.Write(msgAsBytes, 0, msgAsBytes.Length);

                //reset our position in the file
                fStream.Position = 0;

                // read the file one byte at a time
                byte[] bytesFromFile = new byte[msgAsBytes.Length];
                for (int i = 0; i < msgAsBytes.Length; i++)
                {
                    bytesFromFile[i] = (byte) fStream.ReadByte();
                    Console.Write(bytesFromFile[i]);
                }

                Console.WriteLine();

                // wrote out what we read as a string.
                Console.WriteLine(Encoding.Default.GetString(bytesFromFile));
            }
        }

        static void StreamReaderWriter()
        {
            using (StreamWriter writer = File.CreateText("reminder.txt"))
            {
                writer.WriteLine("Dont forget your Anniversary!");
                writer.WriteLine("Don't forget your birthday!");
                writer.WriteLine("Don't forget these numbers: ");
                for (int i = 0; i < 10; i++)
                {
                    writer.Write(i + " ");
                }

                writer.Write(writer.NewLine);
            }

            using (StreamReader sr = File.OpenText("reminder.txt"))
            {
                string input = null;
                while ((input = sr.ReadLine()) != null)
                {
                    Console.WriteLine(input);
                }
            }
        }
    }
}
