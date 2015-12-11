using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CarDealership.BLL;

namespace CarDealership.UI.Controllers
{
    public class InventoryController : Controller
    {
        // GET: Inventory
        public ActionResult Display()
        {
            var ops = new InventoryOperations();
            var cars = ops.ReturnAllInventory();
            return View(cars);
        }

        public ActionResult Details(int id)
        {
            var ops = new InventoryOperations();
            var car = ops.ReturnCarDetails(id);

            return View(car);
        }
    }
}