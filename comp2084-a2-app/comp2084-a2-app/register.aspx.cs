using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Refrence identity
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

// Refrence regex
using System.Text.RegularExpressions;

namespace comp2084_a2_app
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Create_User(object sender, EventArgs e)
        {
            // Connect and create a user
            var userStore = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(userStore);

            // Clean then add user data from registration form
            var user = new IdentityUser()
            {
                UserName = username.Text,
                Email = email.Text,
                PhoneNumber = Regex.Replace(phone_number.Text, "[^0-9.]", "")
        };

            // Save the user
            IdentityResult result = manager.Create(user, password.Text);

            // Check results of save
            // If user is created redirect to login
            if (result.Succeeded)
            {
                Response.Redirect("/");
            }
            // If user is not created display the error
            else
            {
                registration_msg.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}