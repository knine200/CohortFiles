using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SystemDotObject
{
    class Point
    {
        public int x;
        public int y;

        public Point(int x, int y)
        {
            this.x = x;
            this.y = y;
        }

        public override string ToString()
        {
            return string.Format("Point as ({0}, {1})", x, y);
        }

        public override bool Equals(object obj)
        {
            if (obj.GetType() != this.GetType())
            {
                return false;
            }

            Point otherPoint = (Point) obj;
            return (this.x == otherPoint.x) && (this.y == otherPoint.y);
        }

        public Point Copy()
        {
            return (Point) this.MemberwiseClone();
        }
    }
}
