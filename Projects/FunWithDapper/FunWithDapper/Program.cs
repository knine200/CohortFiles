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
            //RunParameterizedQuery();
            // RunParameterizedQueryD();
            RetrieveOutputParammeter();
            Console.ReadLine();
        }


        public static void ReturnAllQuery()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var employees = cn.Query<Employee>("Select * From Employees").ToList();

                foreach (var employee in employees)
                {
                    Console.WriteLine("{0}, {1} - {2}", employee.LastName, employee.FirstName, employee.Title);
                }

            }


        }


        public static void RunParameterizedQuery()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var employees = cn.Query<Employee>("Select * From Employees Where EmployeeId > @EmployeeId", new {EmployeeId = 5}).ToList();


                foreach (var employee in employees)
                {
                    Console.WriteLine("{0}, {1} - {2}", employee.LastName, employee.FirstName, employee.Title);
                }

            }

        }



        public static void RunParameterizedQueryD(int employeeid)
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("EmployeeId", 5);
                var employees = cn.Query<Employee>("Select * From Employees Where EmployeeId > @EmployeeId", p).ToList();

               ReturnEmployees(employees);
            }
         
        }


        private static void ReturnEmployees(List<Employee> employees)
        {
            foreach (var employee in employees)
            {
                Console.WriteLine("{0}, {1} - {2}", employee.LastName, employee.FirstName, employee.Title);
            }
        }


        private static void ExecuteStoredProcedure()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var employees = cn.Query<Employee>("EmployeeGetAll",
                    commandType: CommandType.StoredProcedure).ToList();

                ReturnEmployees(employees);
            }
        }


        public static void RetrieveOutputParammeter()
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

    }
}
