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
    public partial class LoginForm : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(constr);
            try
            {
                String query = "Select * from Register where UserName= @user COLLATE SQL_Latin1_General_CP1_CS_AS and Password=@pass COLLATE SQL_Latin1_General_CP1_CS_AS";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@user", UserTextBox.Text);
                cmd.Parameters.AddWithValue("@pass", PassTextBox.Text);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    Session["user"] = UserTextBox.Text;

                    string script = "swal({ title: 'Login Successful!!', customClass: 'my-alert success-dialogue', icon: 'success' }).then(function() { window.location = 'WebForm1.aspx'; });";
                    ClientScriptManager cs = Page.ClientScript;
                    cs.RegisterStartupScript(GetType(), "SweetAlert", script, true);
                }
                else
                {
                    string script = "swal('Login Failed!!', '', 'error', {customClass: 'my-alert failure-dialogue'});";
                    ClientScriptManager cs = Page.ClientScript;
                    cs.RegisterStartupScript(GetType(), "SweetAlert", script, true);
                }
            }
            catch (Exception ex)
            {
                string script = "swal('Error', 'Please Enter a Valid UserName Or Password', 'error', {customClass: 'my-alert failure-dialogue'});";
                ClientScriptManager cs = Page.ClientScript;
                cs.RegisterStartupScript(GetType(), "SweetAlert", script, true);
            }
            finally
            {
                con.Close();
            }
        }



    }
}


