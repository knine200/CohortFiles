﻿namespace TrafficLightDemo
{
    public class TrafficLight
    {
        public TrafficLightColor CurrentColor { get; private set; }

        public TrafficLight()
        {
            CurrentColor = TrafficLightColor.Red;
        }

        public void ChangeColor()
        {
            switch (CurrentColor)
            {
                case TrafficLightColor.Red:
                    CurrentColor = TrafficLightColor.Green;
                    break;
                case TrafficLightColor.Yellow:
                    CurrentColor = TrafficLightColor.Red;
                    break;
                default:
                    CurrentColor = TrafficLightColor.Yellow;
                    break;
            }
        }
    }
}
