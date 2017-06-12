using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Refrence Identity 
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace comp2084_a2_app
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Logout
            var AuthenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            AuthenticationManager.SignOut();

            Response.Redirect("default.aspx");
        }
    }
}