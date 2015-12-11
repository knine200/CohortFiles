using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using ModelValidation.Models.Attributes;

namespace ModelValidation.Models
{
    //[NoGarfieldOnMondays(ErrorMessage = "Garfield, YOU ARE NOT COMING IN ON MONDAYS!")]
    public class Appointment : IValidatableObject
    {
        //[Required]
        public string ClientName { get; set; }

        [DataType(DataType.Date)]
        //[Required(ErrorMessage = "Please enter a date!")]
        //[FutureDate(ErrorMessage = "You cannot attend an appointment you missed!")]
        public DateTime Date { get; set; }

        //[Range(typeof(bool), "true", "true", ErrorMessage = "You must accept the terms, resistance is futile!")]
        //[MustBeTrue(ErrorMessage = "Seriously, resistance is futile, give up and accept!")]
        public bool TermsAccepted { get; set; }

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            List<ValidationResult> errors = new List<ValidationResult>();

            if (string.IsNullOrEmpty(ClientName))
            {
                errors.Add(new ValidationResult("Please enter your name...", new[] {"ClientName"}));
            }

            if (DateTime.Now > Date)
            {
                errors.Add(new ValidationResult("Please enter a date in the future", new[] {"Date"}));
            }

            if (!TermsAccepted)
            {
                errors.Add(new ValidationResult("You must accept the terms", new[] {"TermsAccepted"}));
            }

            if (ClientName == "Garfield" && Date.DayOfWeek == DayOfWeek.Monday)
            {
                errors.Add(new ValidationResult("Garfield cannot book appointments on Mondays"));
            }

            return errors;
        } 
    }
}