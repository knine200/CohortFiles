using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasicInheritance
{
    class Car
    {
        public readonly int maxspeed;
        public readonly int minSpeed;

        public Car()
        {
            maxspeed = 55;
            minSpeed = 0;
        }

        public Car(int max)
        {
            maxspeed = max;
            minSpeed = 0;
        }

        public Car(int max, int min)
        {
            maxspeed = max;
            minSpeed = min;
        }

        private int currentSpeed;
        public int Speed
        {
            get { return currentSpeed; }
            set
            {
                currentSpeed = value;
                if (currentSpeed > maxspeed)
                {
                    currentSpeed = maxspeed;
                }
            }
        }
    }
}
