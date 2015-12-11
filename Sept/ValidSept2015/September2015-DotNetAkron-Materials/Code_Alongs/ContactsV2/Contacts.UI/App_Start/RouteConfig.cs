using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Contacts.UI
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Add Contact",
                url: "AddContact",
                defaults: new {controller = "Home", action = "Add"}
                );

            routes.MapRoute(
                name: "All Contact",
                url: "AllContacts",
                defaults: new {controller = "Home", action = "Index"}
                );

            routes.MapRoute(
                name: "Edit Contact",
                url: "Edit/{id}",
                defaults: new {controller = "Home", action = "Edit"}
                );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
