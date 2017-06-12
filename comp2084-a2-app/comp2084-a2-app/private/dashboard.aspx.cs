using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.ModelBinding;

namespace comp2084_a2_app
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Call getData on page load
            getData();
        }

        // Get assets from db and display in gridview
        protected void getData()
        {
            // Connect to db
            var conn = new a2Entities();

            // Select recent table additions for dashboard.aspx view
            // http://stackoverflow.com/questions/4872946/linq-query-to-select-top-five
            var whereCurDateTime = DateTime.Now.AddDays(-7);

            // Select assets from db using (LINQ format)
            // http://stackoverflow.com/questions/4872946/linq-query-to-select-top-five
            var assets = (from a in conn.assets orderby a.Id descending where(a.createdDate > whereCurDateTime) select a).Take(10);

            // Count returned query values
            var assetsCount = assets.Count();

            // Pass query result to gridview
            recentAssetsGrid.DataSource = assets.ToList();
            recentAssetsGrid.DataBind();

            var logs = (from l in conn.logs orderby l.Id descending where(l.createdDate > whereCurDateTime) select l).Take(10);

            var logsCount = logs.Count();

            // Pass query result to gridview
            recentLogsGrid.DataSource = logs.ToList();
            recentLogsGrid.DataBind();

            // Display messege if there are no recent accets or logs
            if (assetsCount == 0)
            {
                recentAssetsMsg.Text = "There are no recent assets.";
            }

            if (logsCount == 0)
            {
                recentLogsMsg.Text = "There are no recent logs.";
            }
        }
    }
}