using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using ModelBinding101.CustomBinders;
using ModelBinding101.Models;

namespace ModelBinding101
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            ModelBinders.Binders[typeof(BirthdayPerson)] = new BirthdayPersonBinder();
        }
    }
}
