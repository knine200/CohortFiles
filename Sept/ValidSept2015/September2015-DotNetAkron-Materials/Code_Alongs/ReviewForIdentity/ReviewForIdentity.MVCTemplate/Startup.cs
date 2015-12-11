using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ReviewForIdentity.MVCTemplate.Startup))]
namespace ReviewForIdentity.MVCTemplate
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
