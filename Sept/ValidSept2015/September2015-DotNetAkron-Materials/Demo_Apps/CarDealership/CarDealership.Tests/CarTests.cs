using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CarDealership.Data;
using CarDealership.Data.Config;
using CarDealership.Models;
using NUnit.Framework;

namespace CarDealership.Tests
{
    [TestFixture]
    public class CarTests
    {
        [Test]
        public void GetAllCars_CheckCount()
        {
            int expected = 0;
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT COUNT(*) FROM Cars";
                cmd.Connection = cn;

                cn.Open();

                expected = int.Parse(cmd.ExecuteScalar().ToString());
            }

            CarDealershipRepository repo = new CarDealershipRepository();
            Assert.AreEqual(expected, repo.GetAllCars().Count());
        }

        [Test]
        public void AddCar_CheckLastIndex()
        {
            Car newCar = new Car()
            {
                Make = "Ford",
                Model = "Flex",
                Year = DateTime.Now,
                Mileage = 0,
                Price = 19000,
                Condition = CarCondition.New,
                Status = 0
            };

            int expected = 0;
            int newId = 0;
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                cn.Open();

                expected = RetrieveLastCar(cn) + 1;

                CarDealershipRepository repo = new CarDealershipRepository();
                repo.AddCar(newCar);

                newId = RetrieveLastCar(cn);
            }
            Assert.AreEqual(expected, newId);
        }

        [Test]
        public void UpdateCarStatus_SetToSold()
        {
            int id = 0;
            CarStatus statusToSet = CarStatus.Sold;
            CarStatus newStatus;
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                cn.Open();

                id = RetrieveLastCar(cn);

                CarDealershipRepository repo = new CarDealershipRepository();
                repo.UpdateCarStatus(id, statusToSet);

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT Status FROM Cars WHERE CarId = " + id;
                cmd.Connection = cn;

                newStatus = (CarStatus)cmd.ExecuteScalar();
            }

            Assert.AreEqual(statusToSet, newStatus);
        }

        [Test]
        public void GetCar_RetrieveLastCar()
        {
            int id = 0;
            Car car = null;
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                cn.Open();

                id = RetrieveLastCar(cn);

                CarDealershipRepository repo = new CarDealershipRepository();
                car = repo.GetCar(id);
            }

            Assert.NotNull(car);
        }

        private int RetrieveLastCar(SqlConnection cn)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT MAX(CarId) FROM Cars";
            cmd.Connection = cn;

            int id = int.Parse(cmd.ExecuteScalar().ToString());

            return id;
        }
    }
}
