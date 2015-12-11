using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealership.Models
{
    public class Car
    {
        public int CarId { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
        public DateTime Year { get; set; }
        public decimal Mileage { get; set; }
        public decimal Price { get; set; }
        public string Url { get; set; }
        public CarStatus Status { get; set; }
        public CarCondition Condition { get; set; }
    }
}
