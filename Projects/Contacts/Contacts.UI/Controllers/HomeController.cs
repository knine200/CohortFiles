using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Contacts.Data;
using Contacts.Models;

namespace Contacts.UI.Controllers
{
    public class HomeController : Controller
    {
       

        // GET: Home
        //[HttpGet] is the default
        public ActionResult Index()
        {
            // retrieve all the contacts
            var repo = Factory.CreateContactRepository();
            var contacts = repo.GetAll();

            return View(contacts);
        }

        public ActionResult Add()
        {
            return View();
        }

        [HttpPost] //can also do [HttpDelete or HttpPut or HttpGet which is the default]

        public ActionResult AddContact()
        {
            // create a contact
            var c = new Contact();
            
            // get the data from the input fields
            c.Name = Request.Form["Name"];
            c.PhoneNumber = Request.Form["PhoneNumber"];

            // create out contact in the repository
            var repo = Factory.CreateContactRepository();

            // add the contact
            repo.Add(c);

            return RedirectToAction("Index");
        }

        public ActionResult Edit()
        {
            //retrieve the contact id we pass in
            int contactId = int.Parse(RouteData.Values["id"].ToString());

            var repo = Factory.CreateContactRepository();
            var contact = repo.GetById(contactId);

            return View(contact);

        }

        [HttpPost]
        public ActionResult EditContact()
        {
            var c = new Contact();

            c.Name = Request.Form["Name"];
            c.PhoneNumber = Request.Form["PhoneNnumber"];
            c.ContactID = int.Parse(Request.Form["ContactID"]);

            var repo = Factory.CreateContactRepository();
            repo.Edit(c);

            return RedirectToAction("Index");

        }


        [HttpPost]

        public ActionResult DeleteContact()
        {
            int contactID = int.Parse(Request.Form["ContactID"]);

            var repo = Factory.CreateContactRepository();

            repo.Delete(contactID);

            var contacts = repo.GetAll();
            return View("Index", contacts);

        }
    }
}