using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebEnterprise.Startup))]
namespace WebEnterprise
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
