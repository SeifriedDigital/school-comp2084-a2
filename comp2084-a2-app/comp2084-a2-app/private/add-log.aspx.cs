using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Linq;

using System.Web.ModelBinding;
using Microsoft.AspNet.Identity;
using Microsoft.Owin;


namespace comp2084_a2_app
{
	public partial class add_log : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            // Only do this the first time
            if (IsPostBack == false)
            {

                // Connect to db
                var conn = new a2Entities();

                // Build asset related dropdown
                // http://stackoverflow.com/questions/554649/how-to-bind-linq-data-to-dropdownlist
                using (var conn2 = new a2Entities())
                {
                    assets.DataSource = (from a in conn.assets orderby a.createdDate select new { a.callSign, a.Id }).ToList();
                    assets.DataTextField = Convert.ToString("callSign");
                    assets.DataValueField = Convert.ToString("Id");
                    assets.DataBind();
                }

                assets.Items.Insert(0, new ListItem(" --Select-- ", ""));

                // Check if there is parameter being passed in url
                if (!String.IsNullOrEmpty(Request.QueryString["logId"]))
                {
                    // Store paramater from url in variable
                    Int32 logId = Convert.ToInt32(Request.QueryString["logId"]);

                    // Check that the provided id is valid
                    // http://stackoverflow.com/questions/4132514/how-to-know-if-my-linq-query-returns-null
                    var queryValidBool = (from l in conn.logs where l.Id == logId select l).ToList().Any();

                    // If nothing is returned in the query return user to table of avialable logs
                    if (queryValidBool == false)
                    {
                        Response.Redirect(ResolveUrl("~/private/logs.aspx"));
                    }

                    // Look for selected log in db
                    var logObj = (from l in conn.logs where l.Id == logId select l).FirstOrDefault();

                    // Render page as log edit
                    add_log_header.Text = "Edit Log: " + logObj.title;
                    add_log_button.Text = "Save Changes";

                    // Populate form with data
                    title.Text = logObj.title;
                    notes.Text = logObj.notes;
                    assets.SelectedValue = Convert.ToString(logObj.assetId);
                }
            }
    }

        protected void Save_Log(object sender, EventArgs e)
        {
            Int32 logId = 0;

            if (!String.IsNullOrEmpty(Request.QueryString["logId"]))
            {
                logId = Convert.ToInt32(Request.QueryString["logId"]);
            }

            var conn = new a2Entities();

            log l = new log();

            // Get current user id
            // http://stackoverflow.com/questions/20925822/asp-mvc5-identity-how-to-get-current-applicationuser
            string userId = User.Identity.GetUserId();
            var user = (new a2Entities()).AspNetUsers.FirstOrDefault(u => u.Id == userId);

            // Attach values to new object
            l.authorId = Convert.ToString(user);
            l.title = title.Text;
            l.notes = notes.Text;

            if (!String.IsNullOrEmpty(assets.SelectedValue))
            {
                l.assetId = Convert.ToInt32(assets.SelectedValue);
            }

            // Get asset related data
            if (!String.IsNullOrEmpty(l.assetId.ToString()))
            {
                var assetObj = (from a2 in conn.assets where a2.Id == l.assetId select a2).FirstOrDefault();
                l.assetCallSign = assetObj.callSign;
            }

            // Save logObj to db
            if (logId == 0)
            {
                // Get current datetime in EST format
                // http://stackoverflow.com/questions/5997570/how-to-convert-datetime-to-eastern-time
                var timeUtc = DateTime.UtcNow;
                TimeZoneInfo easternZone = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
                l.createdDate = TimeZoneInfo.ConvertTimeFromUtc(timeUtc, easternZone);

                conn.logs.Add(l);
            }
            // Update log
            else
            {
                l.Id = logId;
                conn.logs.Attach(l);
                conn.Entry(l).State = System.Data.Entity.EntityState.Modified;
                // Make sure created datetime does NOT get updated
                conn.Entry(l).Property(o => o.createdDate).IsModified = false;
            }

            // Save the log changes
            conn.SaveChanges();

            // Redirect to logs
            Response.Redirect(ResolveUrl("~/private/logs.aspx"));
        }
    }
}
// ((System.Data.Entity.Validation.DbEntityValidationException)$exception).EntityValidationErrors