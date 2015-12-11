using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using ReviewForIdentity.EmptyTemplate.Models;

namespace ReviewForIdentity.EmptyTemplate.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(AppUser newUser)
        {
            // connected to the user database
            var userStore = new UserStore<IdentityUser>();
            // created an object to deal with users
            var userManager = new UserManager<IdentityUser>(userStore);

            // create the user
            var user = new IdentityUser
            {
                UserName = newUser.UserName,
                Email = newUser.EmailAddress
            };

            // add the user to the user database
            IdentityResult result = userManager.Create(user, newUser.Password);

            if (result.Succeeded)
            {
                var authenticationManager = HttpContext.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                authenticationManager.SignIn(new AuthenticationProperties(), userIdentity);
            }

            return RedirectToAction("Index", "Home");
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(AppUser loginUser)
        {
            // connected to the user database
            var userStore = new UserStore<IdentityUser>();
            // created an object to deal with users
            var userManager = new UserManager<IdentityUser>(userStore);

            // find the user
            var user = userManager.Find(loginUser.UserName, loginUser.Password);

            if (user != null)
            {
                var authenticationManager = HttpContext.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                authenticationManager.SignIn(new AuthenticationProperties(), userIdentity);
            }

            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult LogOut()
        {
            var authenticationManager = HttpContext.GetOwinContext().Authentication;
            authenticationManager.SignOut();

            return RedirectToAction("Index", "Home");
        }
    }
}