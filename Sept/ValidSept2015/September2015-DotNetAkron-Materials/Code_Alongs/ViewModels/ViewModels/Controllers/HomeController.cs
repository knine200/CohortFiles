using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewModels.Models;

namespace ViewModels.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            var listOfStates = new List<State>
            {
                new State() {Name = "Ohio", Abbreviation = "OH"},
                new State() {Name = "Pennsylvania", Abbreviation = "PA"},
                new State() {Name = "Tennesse", Abbreviation = "TN"}
            };

            AddressToAddVM address = new AddressToAddVM();
            address.address = new Address();
            address.CreateStateList(listOfStates);

            return View(address);
        }

        [HttpPost]
        public ActionResult AddAddress(AddressToAddVM newAddress)
        {
            return View("Result", newAddress.address);
        }
    }
}