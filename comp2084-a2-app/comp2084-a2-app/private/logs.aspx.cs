using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace comp2084_a2_app
{
    public partial class logs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Call getLogs on page load
            getLogs();
        }

        // Get logs from db and display in gridview
        protected void getLogs()
        {
            // Connect to db
            var conn = new a2Entities();

            // Select assets from db using d as a variable (LINQ format)
            var logs = from d in conn.logs orderby d.Id descending select d;

            // Count returned query values
            var logsCount = logs.Count();

            // Pass query result to gridview
            logsGrid.DataSource = logs.ToList();
            logsGrid.DataBind();

            // Display messege if there are no logs
            if (logsCount == 0)
            {
                logsMsg.Text = "There are no logs to display.";
            }
        }

        // Delete log from gridview
        protected void logsGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get selected row
            Int32 rowIndex = e.RowIndex;

            // Find the logs's id
            Int32 logId = Convert.ToInt32(logsGrid.DataKeys[rowIndex].Value);

            // Connect to db
            var conn = new a2Entities();

            // Delete the selected log
            log d = new log();
            d.Id = logId;
            conn.logs.Attach(d);
            conn.logs.Remove(d);
            conn.SaveChanges();

            // Reload gridview
            getLogs();
        }
    }
}