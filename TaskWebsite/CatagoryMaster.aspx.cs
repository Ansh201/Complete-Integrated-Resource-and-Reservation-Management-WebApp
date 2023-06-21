using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskWebsite
{
    public partial class CatagoryMaster : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Get the values of the input fields
            string categoryName = CatagoryNameTextBox.Text;
            string description = DescriptionTextBox.Text;

            try
            {
                // Check if a category with the same name already exists in the table
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString))
                {
                    SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM [CategoryMaster] WHERE [CategoryName] = @CategoryName", connection);
                    command.Parameters.AddWithValue("@CategoryName", categoryName);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    connection.Close();
                    if (count > 0)
                    {
                        // show error message if a category with the same name already exists
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "sweetAlert", "swal('Error!', 'A category with the same name already exists.', 'error');", true);
                        return;
                    }
                }

                // Insert the new category into the database using a SQL command
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString))
                {
                    SqlCommand command = new SqlCommand("INSERT INTO [CategoryMaster] ([CategoryName], [Description]) VALUES (@CategoryName, @Description)", connection);
                    command.Parameters.AddWithValue("@CategoryName", categoryName);
                    command.Parameters.AddWithValue("@Description", description);
                    connection.Open();
                    int result = command.ExecuteNonQuery();
                    connection.Close();
                    if (result > 0)
                    {
                        // show success message if the insert was successful
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "sweetAlert", "swal('Success!', 'Inserted Successfully', 'success').then(function() { location.reload(); });", true);
                    }
                    else
                    {
                        // show error message if the insert failed
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "sweetAlert", "swal('Error!', 'Insertion Failed!!', 'error');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                // show error message if an exception occurred during database operations
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred while inserting the category: {ex.Message}');", true);
            }

            // Clear the input fields

            CatagoryNameTextBox.Text = "";
            DescriptionTextBox.Text = "";

            // Refresh the gridview to show the new category
            CategoryGridView.DataBind();
        }







        protected void DeleteButton_Click(object sender, EventArgs e)
        {


        }

        protected void EditButton_Click1(object sender, EventArgs e)
        {

        }

        protected void CategoryGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SearchButton_Click1(object sender, EventArgs e)
        {
            string categoryName = SearchTextBox.Text.Trim();
            if (!string.IsNullOrEmpty(categoryName))
            {
                // Modify the SelectCommand of the SqlDataSource to include the search query
                string searchQuery = "%" + categoryName + "%";
                SqlDataSource1.SelectCommand = "SELECT [ID], [CategoryName], [Description] FROM [CategoryMaster] WHERE [CategoryName] LIKE @CategoryName";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("CategoryName", searchQuery);

                // Rebind the GridView to show the search results
                CategoryGridView.DataBind();
            }
        }
    }

}