using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HResourceModel
{
    public class Resume
    {
        public int Id { get; set; }
        public string Name { get; set; }
        [DataType(DataType.PhoneNumber)]
        public string PhoneNumber { get; set; }
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        public string Address { get; set; }
        public string Position { get; set; }
        public string Background { get; set; }
        public string Education { get; set; }
        public string DesiredSalary { get; set; }
        public string DateOfApplication { get; set; }
    }
}
