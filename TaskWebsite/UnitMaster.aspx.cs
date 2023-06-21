using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskWebsite
{
    public partial class UnitMaster : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(constr);

            try
            {
                string addsql = @"Insert Into UnitMaster values(@UnitName)";
                SqlCommand cmd = new SqlCommand(addsql, con);
                con.Open();
                cmd.Parameters.AddWithValue("@UnitName", UnitNameTextBox.Text);
                int rowsaffected = cmd.ExecuteNonQuery();
                if (rowsaffected > 0)
                {
                    // show success message using SweetAlert
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "sweetAlert", "setTimeout(function() { swal('Success!', 'Inserted Sucessfully', 'success').then(function() { location.reload(); }); }, 500);", true);
                    UnitNameTextBox.Text = "";
                }
                else
                {
                    // show error message using SweetAlert
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "sweetAlert", "swal('Insertion Failed', '', 'error');", true);
                }
            }
            catch (Exception ex)
            {
                // Show generic error message using SweetAlert
                string script = $"swal('Unit Already Exist', '', 'error');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetAlert", script, true);
            }
            finally
            {
                con.Close();
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LoginPage.aspx");

        }
    }
}