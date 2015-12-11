using System;

namespace TrafficLightDemo
{
    class Program
    {
        static void Main()
        {
            TrafficLight light = new TrafficLight();
            PrintValue(light);

            light.ChangeColor();
            PrintValue(light);

            light.ChangeColor();
            PrintValue(light);

            light.ChangeColor();
            PrintValue(light);


            Console.ReadLine();
        }

        static void PrintValue(TrafficLight light)
        {
            Console.WriteLine("The light has a value of {0} which is the color {1}",
                light.CurrentColor,
                Enum.GetName(typeof(TrafficLightColor), (int)light.CurrentColor));
        }
    }
}
