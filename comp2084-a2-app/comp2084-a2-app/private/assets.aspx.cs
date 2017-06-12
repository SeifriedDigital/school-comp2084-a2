using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.ModelBinding;

namespace comp2084_a2_app
{
    public partial class assets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Call getAssets on page load
            getAssets();
        }

        // Get assets from db and display in gridview
        protected void getAssets()
        {
            // Connect to db
            var conn = new a2Entities();

            // Select assets from db using d as a variable (LINQ format)
            var assets = from d in conn.assets orderby d.Id descending select d;

            // Count returned query values
            var assetsCount = assets.Count();

            // Pass query result to gridview
            assetsGrid.DataSource = assets.ToList();
            assetsGrid.DataBind();

            // Display messege if there are no assets
            if (assetsCount == 0)
            {
                assetsMsg.Text = "There are no assets to display.";
            }
        }

        // Delete asset from gridview
        protected void assetsGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get selected row
            Int32 rowIndex = e.RowIndex;

            // Find the assets's id
            Int32 assetId = Convert.ToInt32(assetsGrid.DataKeys[rowIndex].Value);

            // Connect to db
            var conn = new a2Entities();

            // Delete the selected asset
            asset d = new asset();
            d.Id = assetId;
            conn.assets.Attach(d);
            conn.assets.Remove(d);
            conn.SaveChanges();

            // Reload gridview
            getAssets();
        }
    }
}