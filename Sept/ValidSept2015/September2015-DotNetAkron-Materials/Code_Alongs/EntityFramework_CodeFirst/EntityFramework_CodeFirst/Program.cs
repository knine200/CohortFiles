using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntityFramework_CodeFirst.Models;

namespace EntityFramework_CodeFirst
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var db = new BlogContext())
            {
                Console.Write("Enter a name for a new blog: ");
                var name = Console.ReadLine();

                var blog = new Blog() {Name = name};
                db.Blogs.Add(blog);
                db.SaveChanges();

                var query = from b in db.Blogs
                    orderby b.Name
                    select b;

                foreach (var item in query)
                {
                    Console.WriteLine(item.Name);
                }
            }
        }
    }
}
