using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityFramework_ModelFirst
{
    class Program
    {
        static void Main(string[] args)
        {
            LoadSampleData();
            DisplayContacts();

            Console.ReadLine();
        }

        private static void LoadSampleData()
        {
            using (var context = new ContactsContext())
            {
                if (context.People.Count() == 0)
                {
                    var person = new Person
                    {
                        FirstName = "Robert",
                        MiddleName = "Allen",
                        LastName = "Doe",
                        PhoneNumber = "867-5309"
                    };
                    context.People.Add(person);

                    person = new Person
                    {
                        FirstName = "John",
                        MiddleName = "K.",
                        LastName = "Smith",
                        PhoneNumber = "824-3031"
                    };
                    context.People.Add(person);

                    person = new Person
                    {
                        FirstName = "Billy",
                        MiddleName = "Albert",
                        LastName = "Minor",
                        PhoneNumber = "907-2212"
                    };
                    context.People.Add(person);

                    context.SaveChanges();
                }
            }
        }

        private static void DisplayContacts()
        {
            using (var context = new ContactsContext())
            {
                foreach (var person in context.People)
                {
                    Console.WriteLine("{0} {1} {2}, Phone: {3}", person.FirstName, person.MiddleName, person.LastName,
                        person.PhoneNumber);
                }
            }
        }
    }
}
