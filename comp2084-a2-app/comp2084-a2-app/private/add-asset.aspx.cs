using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.ModelBinding;
using Microsoft.AspNet.Identity;
using Microsoft.Owin;


namespace comp2084_a2_app
{
	public partial class add_asset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            if (IsPostBack == false)
            {
                // Generate dropdown for year
                for (int i = 1950; i < DateTime.Now.Year + 1; i++)
                {
                    year.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }

                // Check if there is parameter being passed in url
                if (!String.IsNullOrEmpty(Request.QueryString["assetId"]))
                {
                // Store paramater from url in variable
                Int32 assetId = Convert.ToInt32(Request.QueryString["assetId"]);

                // Connect to db
                var conn = new a2Entities();

                // Check that the provided id is valid
                // http://stackoverflow.com/questions/4132514/how-to-know-if-my-linq-query-returns-null
                var queryValidBool = (from a in conn.assets where a.Id == assetId select a).ToList().Any();

                // If nothing is returned in the query return user to table of avialable assets
                if (queryValidBool == false)
                {
                    Response.Redirect(ResolveUrl("~/private/assets.aspx"));
                }

                // Look for selected asset in db
                var assetObj = (from a in conn.assets where a.Id == assetId select a).FirstOrDefault();

                // Render page as asset edit
                add_asset_header.Text = "Edit Asset: " + assetObj.callSign;
                add_asset_button.Text = "Save Changes";

                // Populate form with data
                call_sign.Text = assetObj.callSign;
                year.SelectedValue = Convert.ToString(assetObj.year);
                brand.Text = assetObj.brand;
                model.Text = assetObj.model;
                vin.Text = assetObj.vin;
                hours.Text = Convert.ToString(assetObj.hours);
                odometer_unit.SelectedValue = Convert.ToString(assetObj.odometerUnit);

                if(assetObj.odometer != null)
                {
                    odometer.Text = Convert.ToString(assetObj.odometer);
                }

                // Check if there is a value before filling input to avoid auto filling of a default value caused by the convert method
                if (assetObj.purchasedDate != null)
                {
                    purchased_date.Text = Convert.ToDateTime(assetObj.purchasedDate).ToString("yyyy-MM-dd");
                }

                // Format string into money if value is present
                // http://stackoverflow.com/questions/10615405/how-to-format-string-to-money
                if (assetObj.pricePaid != null)
                {
                    price_paid.Text = string.Format("{0:#.00}", Convert.ToDecimal(assetObj.pricePaid));
                }

                notes.Text = assetObj.notes;
            }
        }
    }

        protected void Save_Asset(object sender, EventArgs e)
        {
            // Determine if asset is being updated or added
            Int32 assetId = 0;

            if (!String.IsNullOrEmpty(Request.QueryString["assetId"]))
            {
                assetId = Convert.ToInt32(Request.QueryString["assetId"]);
            }

            var conn = new a2Entities();

            asset a = new asset();

            // Get current user id
            // http://stackoverflow.com/questions/20925822/asp-mvc5-identity-how-to-get-current-applicationuser
            string userId = User.Identity.GetUserId();
            var user = (new a2Entities()).AspNetUsers.FirstOrDefault(s => s.Id == userId);

            // Attach values to new object
            a.authorId = Convert.ToString(user);
            a.callSign = call_sign.Text;

            if (!String.IsNullOrEmpty(year.SelectedValue))
            {
                a.year = Convert.ToInt32(year.SelectedValue);
            }
        
            a.brand = brand.Text;
            a.model = model.Text;           
            a.vin = vin.Text;

            // Make sure there is a value to convert before converting to avoid errors
            if (!String.IsNullOrEmpty(hours.Text))
            {
                a.hours = Convert.ToInt32(hours.Text);
            }

            a.odometerUnit = odometer_unit.SelectedValue;

            if (!String.IsNullOrEmpty(odometer.Text))
            {
                a.odometer = Convert.ToInt32(odometer.Text);
            }

            if (!String.IsNullOrEmpty(purchased_date.Text))
            {
                a.purchasedDate = DateTime.ParseExact(purchased_date.Text, "yyyy-MM-dd", null);
            }

            if (!String.IsNullOrEmpty(price_paid.Text))
            {
                a.pricePaid = Convert.ToDecimal(price_paid.Text);
            }
                
            a.notes = notes.Text;

            // Save assetObj to db
            if (assetId == 0)
            {
                // Get current datetime in EST format
                // http://stackoverflow.com/questions/5997570/how-to-convert-datetime-to-eastern-time
                var timeUtc = DateTime.UtcNow;
                TimeZoneInfo easternZone = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
                a.createdDate = TimeZoneInfo.ConvertTimeFromUtc(timeUtc, easternZone);

                conn.assets.Add(a);
            }
            // Update asset
            else
            {
                a.Id = assetId;
                conn.assets.Attach(a);
                conn.Entry(a).State = System.Data.Entity.EntityState.Modified;
                // Make sure created datetime does NOT get updated
                conn.Entry(a).Property(o => o.createdDate).IsModified = false;
            }

            // Save the asset
            conn.SaveChanges();

            // Redirect to assets
            Response.Redirect(ResolveUrl("~/private/assets.aspx"));
        }
    }
}