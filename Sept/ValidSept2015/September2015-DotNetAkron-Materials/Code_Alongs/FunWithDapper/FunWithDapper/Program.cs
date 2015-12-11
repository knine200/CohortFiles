using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using FunWithDapper.Config;
using FunWithDapper.Models;

namespace FunWithDapper
{
    class Program
    {
        static void Main(string[] args)
        {
            //ReturnAllQuery();
            //RunParameterizedQuery(5);
            //ExecuteStoredProcedure();
            RetrieveOutputParameter();

            Console.ReadLine();
        }

        public static void ReturnAllQuery()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var employees = cn.Query<Employee>("SELECT * FROM Employees").ToList();

                ReturnEmployees(employees);
            }
        }

        public static void RunParameterizedQuery(int EmployeeId)
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("EmployeeId", EmployeeId);
                //p.Add("MyParameter", 5);  // adding a second parameter

                var employees = cn.Query<Employee>("SELECT * FROM Employees WHERE EmployeeId > @EmployeeId",
                    //new {EmployeeId = EmployeeId}).ToList(); // anonymous type
                    p).ToList();    // using dynamic properties

                ReturnEmployees(employees);
            }
        }

        public static void ExecuteStoredProcedure()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var employees = cn.Query<Employee>("EmployeeGetAll",
                    commandType: CommandType.StoredProcedure).ToList();

                ReturnEmployees(employees);
            }
        }

        public static void RetrieveOutputParameter()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("RegionDescription", "New Region");
                p.Add("RegionId", DbType.Int32, direction: ParameterDirection.Output);

                cn.Execute("RegionInsert", p, commandType: CommandType.StoredProcedure);

                int regionId = p.Get<int>("RegionId");

                Console.Write("Id = {0}", regionId);
            }
        }

        private static void ReturnEmployees(List<Employee> employees)
        {
            foreach (var employee in employees)
            {
                Console.WriteLine("{0}, {1} - {2}", employee.LastName, employee.FirstName, employee.Title);
            }
        }
    }
}
