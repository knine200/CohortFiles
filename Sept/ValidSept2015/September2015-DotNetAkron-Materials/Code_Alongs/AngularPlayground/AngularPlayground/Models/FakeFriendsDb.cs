using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AngularPlayground.Models
{
    public class FakeFriendsDb
    {
        private static readonly List<Friend> _friends = new List<Friend>();

        static FakeFriendsDb()
        {
            _friends.AddRange(new[]
            {
                new Friend() {Age=32, Name="Jenny", Phone="876-5309" },
                new Friend() {Age=33,Name="Joe",Phone="876-5310" },
                new Friend() {Age=34,Name="Mark",Phone="876-5311" },
                new Friend() {Age=35,Name="Bob",Phone="876-5312" }
            });
        }

        public List<Friend> GetAll()
        {
            return _friends;
        }

        public void Add(Friend friend)
        {
            _friends.Add(friend);
        }
    }
}