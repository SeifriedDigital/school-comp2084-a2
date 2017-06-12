using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
 
using System.Web.ModelBinding;

namespace comp2084_a2_app
{
    public partial class users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Call getUsers on page load
            getUsers();
        }

        // Get users from db and display in gridview
        protected void getUsers()
        {
            // Connect to db
            var conn = new a2Entities();

            // Select users from db using d as a variable (LINQ format)
            var users = from d in conn.AspNetUsers select d;

            // Pass query result to gridview
            usersGrid.DataSource = users.ToList();
            usersGrid.DataBind();
        }

        // Delete user from gridview
        protected void usersGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get selected row
            Int32 rowIndex = e.RowIndex;

            // Find the user's id
            String userId = Convert.ToString(usersGrid.DataKeys[rowIndex].Value);

            // Connect to db
            var conn = new a2Entities();

            // Delete the selected user
            AspNetUser d = new AspNetUser();
            d.Id = userId;
            conn.AspNetUsers.Attach(d);
            conn.AspNetUsers.Remove(d);
            conn.SaveChanges();

            // Reload gridview
            getUsers();
        }
    }
}