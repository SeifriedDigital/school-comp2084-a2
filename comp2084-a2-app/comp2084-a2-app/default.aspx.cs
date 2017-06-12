using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Refrence Identity
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security.Cookies;

namespace comp2084_a2_app
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Log user in
        protected void Login_User(object sender, EventArgs e)
        {
            // Initialize the user variables
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);

            // Find user with matching credentials
            var user = userManager.Find(username.Text, password.Text);

            // If the entered credentials match a user then store their info in a cookie and log them in
            if (user != null)
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                authenticationManager.SignIn(new Microsoft.Owin.Security.AuthenticationProperties()
                {
                    IsPersistent = false
                }, userIdentity);

                // Redirect to dashboard
                Response.Redirect("private/dashboard.aspx");
            }
            // If the enterd credentials do not match a user then display error messege
            else
            {
                login_msg.Text = "Invalid Credentials";
            }
            
        }
    }
}