using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ViewModels.Models
{
    public class AddressToAddVM
    {
        public Address address { get; set; }
        public List<SelectListItem> states { get; set; }

        public void CreateStateList(List<State> listOfStates)
        {
            states = new List<SelectListItem>();

            foreach (var s in listOfStates)
            {
                var newItem = new SelectListItem();
                newItem.Text = s.Abbreviation;
                newItem.Value = s.Name;

                states.Add(newItem);
            }
        }  
    }
}