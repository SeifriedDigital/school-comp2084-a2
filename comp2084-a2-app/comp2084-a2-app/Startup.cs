using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;

// Add identity refrences
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security.Cookies;

[assembly: OwinStartup(typeof(comp2084_a2_app.Startup))]

namespace comp2084_a2_app
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            // Cookie tracking configuration for authenticated users
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/default.aspx")
            });
        }
    }
}
