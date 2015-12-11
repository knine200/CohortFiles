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

        [HttpPost]
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
            // retrieve the contact id we passed in
            int contactId = int.Parse(RouteData.Values["id"].ToString());

            // get the contact from the repo
            var repo = Factory.CreateContactRepository();
            var contact = repo.GetById(contactId);

            return View(contact);
        }

        [HttpPost]
        public ActionResult EditContact()
        {
            // create a new contact
            var c = new Contact();

            // set the values from the form
            c.Name = Request.Form["Name"];
            c.PhoneNumber = Request.Form["PhoneNumber"];
            c.ContactID = int.Parse(Request.Form["ContactID"]);

            // edit the contact in the repo
            var repo = Factory.CreateContactRepository();
            repo.Edit(c);

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult DeleteContact()
        {
            // get the id that we passed in
            int contactID = int.Parse(Request.Form["ContactID"]);

            // delete the contact from the repo
            var repo = Factory.CreateContactRepository();
            repo.Delete(contactID);

            // get the contacts and go to the Index
            var contacts = repo.GetAll();
            return View("Index", contacts);
        }
    }
}