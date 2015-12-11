using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PracticeForCapstone.Startup))]
namespace PracticeForCapstone
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
