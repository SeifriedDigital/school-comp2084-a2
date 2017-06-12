using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Refrence Owin
using Microsoft.Owin.Security;

namespace comp2084_a2_app
{
    public partial class template : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nav logic
            // If user is authenticated show private nav
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                private_nav.Visible = true;
                public_nav.Visible = false;
            }
            // If user is not authenticated show public nav
            else
            {
                private_nav.Visible = false;
                public_nav.Visible = true;
            }
        }
    }
}