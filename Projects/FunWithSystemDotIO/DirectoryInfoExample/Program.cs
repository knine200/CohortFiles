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
            Console.WriteLine("******* Fun with Directory(info) **************");
            Console.WriteLine();

            //ShowWindowsDirectoryInfo();
            //ModifyDirectory();
            //RemoveDirectory();

            //ListDrives();

            ListDriveInfo();

            Console.ReadLine();
        }

        static void ShowWindowsDirectoryInfo()
        {
            DirectoryInfo dir = new DirectoryInfo(@"C:\Windows");
            Console.WriteLine("FullName: {0}", dir.FullName);
            Console.WriteLine("Name: {0}", dir.Name);
            Console.WriteLine("Parent: {0}", dir.Parent);
            Console.WriteLine("Creation: {0}", dir.CreationTime);
            Console.WriteLine("Attributes: {0}", dir.Attributes);
            Console.WriteLine("Root: {0}", dir.Root);
            Console.WriteLine("************************************************");


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
            DirectoryInfo dir = new DirectoryInfo(@".\MyFolder");
            dir.Delete();
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



    }
}
