using CarDealership.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CarDealership.Data.Config;
using Dapper;

namespace CarDealership.Data
{
    public class CarDealershipRepository
    {
        public List<Car> GetAllCars()
        {
            using (var cn = new SqlConnection(Settings.ConnectionString))
            {
                var cars = cn.Query<Car>("SELECT * FROM Cars").ToList();

                return cars;
            }
        }

        public Car GetCar(int id)
        {
            using (var cn = new SqlConnection(Settings.ConnectionString))
            {
                var car = cn.Query<Car>("SELECT * FROM Cars WHERE CarId = @id", new {id = id}).FirstOrDefault();

                return car;
            }
        }

        public void AddCar(Car newCar)
        {
            using (var cn = new SqlConnection(Settings.ConnectionString))
            {
                cn.Execute(
                    "INSERT Cars(Make, Model, Year, Mileage, Price, Status, Condition) " +
                    "VALUES (@Make, @Model, @Year, @Mileage, @Price, @Status, @Condition)",
                    newCar);
            }
        }

        public void UpdateCarStatus(int id, CarStatus status)
        {
            using (var cn = new SqlConnection(Settings.ConnectionString))
            {
                cn.Execute("UPDATE Cars SET Status = @Status WHERE CarId = @CarId", 
                    new {CarId = id, Status = (int)status});
            }
        }
    }
}
