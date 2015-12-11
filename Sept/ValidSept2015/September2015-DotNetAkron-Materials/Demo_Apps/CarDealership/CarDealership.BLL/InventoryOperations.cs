using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CarDealership.Data;
using CarDealership.Models;

namespace CarDealership.BLL
{
    public class InventoryOperations
    {
        public List<Car> ReturnAllInventory()
        {
            var repo = new CarDealershipRepository();
            var cars = repo.GetAllCars();

            return cars;
        }

        public Car ReturnCarDetails(int id)
        {
            var repo = new CarDealershipRepository();
            var car = repo.GetCar(id);

            return car;
        }
    }
}
