using System;
using System.Collections.Generic;
using System.IO;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HResourceData
{
    public class Hfactory
    {
        public static IHrepository CreateHrepository()
        {
            switch (ConfigurationManager.AppSettings["mode"].ToLower())
            {
                case "test":
                    return new MockHrepository();
                case "prod":
                    return new HumanResourceRepository();
                   
                default:
                    throw new NotSupportedException();
            }
        }
    }

}


