using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LINQSamples
{
    class Program
    {
        static void Main(string[] args)
        {
            List<Student> students = MakeStudents();
            List<StudentCourse> courses = MakeCourses();

            Program prog = new Program();
            prog.AnonymousTypes(students);
            prog.Joins(students, courses);
            prog.GroupBy(students);

            Console.ReadLine();
        }

        public void AnonymousTypes(List<Student> students)
        {
            Console.WriteLine("Anonymous Types");

            var ladies = from student in students
                where student.Gender == "F"
                select new { Name = student.FirstName + " " + student.LastName, student.Major };

            foreach (var l in ladies)
            {
                Console.WriteLine("{0} is majoring in {1}", l.Name, l.Major);
            }

            Console.WriteLine();
        }

        public void Joins(List<Student> students, List<StudentCourse> courses)
        {
            Console.WriteLine("Joins");

            var results = from student in students
                join course in courses
                    on student.ID equals course.StudentID
                // One Option for output
                //select new {course, student};

                // A second option
                // notice the fields are right off object created.
                select new
                {
                    CourseName = course.CourseName,
                    StudentName = student.FirstName + " " + student.LastName
                };

            foreach (var result in results)
            {
                // Option 1 output
                //Console.WriteLine("{0} {1} is taking {2}", result.student.FirstName, 
                //    result.student.LastName, result.course.CourseName);

                // Option 2 output
                Console.WriteLine("{0} is taking {1}", result.StudentName, result.CourseName);
            }

            Console.WriteLine();
        }

        public void GroupBy(List<Student> students)
        {
            Console.WriteLine("Group By");

            var results = from student in students
                          where student.Major != "Chemistry"
                group student by student.Major;

            foreach (var group in results)
            {
                Console.WriteLine(group.Key);

                foreach (var student in group)
                {
                    Console.WriteLine("\t{0} {1} - {2}", student.FirstName, student.LastName, student.Major);
                }
            }

            Console.WriteLine();
        }

        static List<Student> MakeStudents()
        {
            return new List<Student>
            {
                new Student { ID = 1, FirstName = "Bart", LastName = "Simpson", Gender = "M", Major = "Chemistry" },
                new Student { ID = 2, FirstName = "Lisa", LastName = "Simpson", Gender = "F", Major = "Political Science" },
                new Student { ID = 3, FirstName = "Bugs", LastName = "Bunny", Gender = "M", Major = "Psychology" },
                new Student { ID = 4, FirstName = "Daffy", LastName = "Duck", Gender = "M", Major = "Political Science" }
            };
        }

        static List<StudentCourse> MakeCourses()
        {
            return new List<StudentCourse>
            {
                new StudentCourse { StudentID = 2, CourseName = "Government" },
                new StudentCourse { StudentID = 2, CourseName = "Math" },
                new StudentCourse { StudentID = 1, CourseName = "Math" },
                new StudentCourse { StudentID = 3, CourseName = "Math" },
                new StudentCourse { StudentID = 4, CourseName = "Math" },
                new StudentCourse { StudentID = 3, CourseName = "Intro to Programming" }
            };
        } 
    }
}
