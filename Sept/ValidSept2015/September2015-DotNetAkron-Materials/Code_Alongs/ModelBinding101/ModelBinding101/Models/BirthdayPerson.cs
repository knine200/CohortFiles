using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ModelBinding101.Models
{
    public class BirthdayPerson
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime Birthday { get; set; }
    }
}