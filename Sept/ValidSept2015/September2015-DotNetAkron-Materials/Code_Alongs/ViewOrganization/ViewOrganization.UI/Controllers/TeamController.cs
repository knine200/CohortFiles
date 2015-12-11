using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewOrganization.UI.Models;

namespace ViewOrganization.UI.Controllers
{
    public class TeamController : Controller
    {
        // GET: Team
        public ActionResult Index()
        {
            var players = new List<Player>
            {
                new Player {Name = "Joe Thomas", Number = 73, Position = "OL"},
                new Player {Name = "Travis Benjamin", Position = "WR", Number = 11}
            };

            return View(players);
        }
    }
}