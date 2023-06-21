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
    public partial class ItemMaster : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateCategory();
                populateUnit();
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string cmdText = "INSERT INTO ItemMaster (Category, ItemName, Unit, Rate) VALUES (@Category, @ItemName, @Unit, @Rate)";

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(cmdText, con))
                {
                    cmd.Parameters.AddWithValue("@Category", CategoryDropDownList.SelectedValue);
                    cmd.Parameters.AddWithValue("@ItemName", ItemNameTextBox.Text);
                    cmd.Parameters.AddWithValue("@Unit", UnitDropDownList.SelectedValue);
                    cmd.Parameters.AddWithValue("@Rate", RateTextBox.Text);

                    con.Open();

                    // Check if the item name already exists in the database
                    string checkCmdText = "SELECT COUNT(*) FROM ItemMaster WHERE ItemName = @ItemName";
                    using (SqlCommand checkCmd = new SqlCommand(checkCmdText, con))
                    {
                        checkCmd.Parameters.AddWithValue("@ItemName", ItemNameTextBox.Text);
                        int count = (int)checkCmd.ExecuteScalar();

                        if (count > 0)
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "sweetAlert", "Swal.fire({title: 'Error!', text: 'Item Name already exists', icon: 'error', customClass: 'my-alert failure-dialogue'}).then(function() { location.reload(); });", true);
                        }
                        else
                        {
                            // Item name does not exist, insert it into the database
                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "sweetAlert", "Swal.fire({title: 'Success!', text: 'Inserted Successfully', icon: 'success'}).then(function(result) { if (result.isConfirmed) { location.reload(); } else { history.go(0); } });", true);
                                CategoryGridView.DataBind(); // Bind GridView after successful insertion
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "sweetAlert", "Swal.fire({title: 'Error!', text: 'Insertion Failed!!', icon: 'error', customClass: 'my-alert failure-dialogue'});", true);
                            }
                        }
                    }

                    con.Close();
                }
            }
        }



        private void populateCategory()
        {
            SqlConnection con = new SqlConnection(constr);

            try
            {
                List<string> listofctg = new List<string>();
                string getctgsql = @"SELECT CategoryName FROM CategoryMaster";
                SqlCommand cmd = new SqlCommand(getctgsql, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    listofctg.Add(reader.GetString(0));
                }
                CategoryDropDownList.DataSource = listofctg;
                CategoryDropDownList.DataBind();

                // Add "Select" option as default value
                CategoryDropDownList.Items.Insert(0, new ListItem("Select", ""));
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        private void populateUnit()
        {
            SqlConnection con = new SqlConnection(constr);

            try
            {
                List<string> listunit = new List<string>();
                string getunitsql = @"SELECT UnitName FROM UnitMaster";
                SqlCommand cmd = new SqlCommand(getunitsql, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    listunit.Add(reader.GetString(0));
                }
                UnitDropDownList.DataSource = listunit;
                UnitDropDownList.DataBind();

                // Add "Select" option as default value
                UnitDropDownList.Items.Insert(0, new ListItem("Select", ""));
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }


    }
}
