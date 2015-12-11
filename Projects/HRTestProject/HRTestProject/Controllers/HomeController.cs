using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HResourceData;
using HResourceModel;

namespace HRTestProject.Controllers
{

    public class HomeController : Controller
    {

        //Trying new things

       private  HumanResourceRepository Policy { get; set; }
        //public Hfactory hfactory;

        //public HomeController()
        //{
        //    hfactory = new Hfactory();
        //}
        public HomeController()
        {
         
        }

        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Apply()
        {
            return View(new Resume());
        }

        [HttpPost]

        public ActionResult Apply(Resume r)
        {
            var applicant = Hfactory.CreateHrepository();

            if (applicant is HumanResourceRepository)
            {
                var applicant1 = new HumanResourceRepository();
                applicant1.RootPath = Server.MapPath("~/");
                applicant1.Add(r);
                return View("Result", r);

            }


            applicant.Add(r);
            return View("Result", r);
        }


        public ActionResult Display()
        {

           
                var applicant1 = new HumanResourceRepository();
                applicant1.RootPath = Server.MapPath("~/");
                var applicants = applicant1.GetAll();
            return View(applicants);
        }


        public ActionResult DisplayPolicy()
        {
            Policy = new HumanResourceRepository { RootPath = HttpContext.Server.MapPath("~/") };

            var policies = Policy.GetCategories();
            var dropdown = new SelectList(policies);

            return View(dropdown);
        }

        public ActionResult DisplayDressList(string category)
        {
            Policy = new HumanResourceRepository {RootPath = HttpContext.Server.MapPath("~/")};
            var policies = Policy.GetAllP().Where(c=>c.CategoryType.CategoryType==category).ToList();
            return View(policies);
        }

        public ActionResult ViewDressPolicy(int id)
        {
            Policy = new HumanResourceRepository { RootPath = HttpContext.Server.MapPath("~/") };

            var dressP = Policy.GetByIdP(id);
            return View(dressP);
        }




        public ActionResult ManagePolicies()
        {
            Policy = new HumanResourceRepository {RootPath = HttpContext.Server.MapPath("~/")};

            var categories = Policy.GetCategories();
            var dropdown = new SelectList(categories);
            return View(dropdown);
        }

        public ActionResult AddPolicy()
        {
            return View(new Policy());
        }

        [HttpPost]
        public ActionResult AddPolicy(Policy p)
        {
            Policy = new HumanResourceRepository { RootPath = HttpContext.Server.MapPath("~/") };

            Policy.AddP(p);

            return View("Result2", p);

        }


        [HttpPost]
        public ActionResult DeletePolicy(int id)
        {
            Policy = new HumanResourceRepository { RootPath = HttpContext.Server.MapPath("~/") };

            Policy.DeleteP(id);

            return RedirectToAction("ManagePolicies");

        }


        public ActionResult ViewPolicyList(string category)
        {
            Policy = new HumanResourceRepository { RootPath = HttpContext.Server.MapPath("~/") };
            var policies = Policy.GetAllP().Where(c => c.CategoryType.CategoryType == category).ToList();
            return View(policies);
        }

    }
}