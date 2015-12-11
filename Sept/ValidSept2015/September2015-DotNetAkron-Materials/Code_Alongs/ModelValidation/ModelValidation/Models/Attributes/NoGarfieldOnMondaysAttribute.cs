using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ModelValidation.Models.Attributes
{
    public class NoGarfieldOnMondaysAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            Appointment appt = value as Appointment;
            if (appt == null || string.IsNullOrEmpty(appt.ClientName))
            {
                return true;
            }

            return !(appt.ClientName == "Garfield" && appt.Date.DayOfWeek == DayOfWeek.Monday);
        }
    }
}