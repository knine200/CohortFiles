using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AngularPlayground.Models;

namespace AngularPlayground.Controllers
{
    public class FriendsController : ApiController
    {
        public List<Friend> Get()
        {
            var repo = new FakeFriendsDb();
            return repo.GetAll();
        }

        public HttpResponseMessage Post(Friend friend)
        {
            var repo = new FakeFriendsDb();
            repo.Add(friend);

            return new HttpResponseMessage(HttpStatusCode.Created);
        }
    }
}
