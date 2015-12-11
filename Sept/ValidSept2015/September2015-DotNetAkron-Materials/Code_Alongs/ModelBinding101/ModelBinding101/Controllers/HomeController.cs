using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ModelBinding101.CustomBinders;
using ModelBinding101.Models;

namespace ModelBinding101.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult RequestForm()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RequestFormPost()
        {
            var p = new Person();

            p.PersonId = int.Parse(Request.Form["PersonId"]);
            p.FirstName = Request.Form["FirstName"];
            p.LastName = Request.Form["LastName"];

            return View("Result", p);
        }

        public ActionResult SimpleBinding()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SimpleBinding(int personId, string firstName, string lastName)
        {
            var p = new Person();

            p.PersonId = personId;
            p.FirstName = firstName;
            p.LastName = lastName;

            return View("Result", p);
        }

        public ActionResult ObjectBinding()
        {
            return View(new Person());
        }

        [HttpPost]
        public ActionResult ObjectBinding(Person p)
        {
            return View("Result", p);
        }

        public ActionResult BindingComplexClassTypes()
        {
            return View(new Person() {HomeAddress = new Address()});
        }

        [HttpPost]
        public ActionResult BindingComplexClassTypes(Person p)
        {
            return View("Result2", p);
        }

        public ActionResult BindingMultipleObjects()
        {
            return View();
        }

        [HttpPost]
        public ActionResult BindingMultipleObjects(List<Address> addresses)
        {
            return View("Result3", addresses);
        }

        public ActionResult CustomModelBinding()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CustomModelBinding(BirthdayPerson person)
        {
            return View("Result4", person);
        }
    }
}