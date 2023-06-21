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


    public partial class Register : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            populateStates();
            populateCities(StateDropDownList.SelectedValue);

        }


        void clearControls()
        {
            FirstNameTextBox.Text = LastNameTextBox.Text = EmailTextBox.Text = RadioButtonList1.SelectedValue = UserNameTextBox.Text = PasswordTextBox.Text = ConfirmPasswordTextBox.Text = " ";


        }


        void populateStates()
        {

            SqlConnection con = new SqlConnection(constr);

            con.Open();
            String sqlquery = "SELECT name FROM states";
            // Create SQL command to select all states from "states" table
            SqlCommand cmd = new SqlCommand(sqlquery, con);

            // Execute command and store results in SqlDataReader
            SqlDataReader reader = cmd.ExecuteReader();

            // Bind the SqlDataReader to the dropdown list
            StateDropDownList.DataSource = reader;
            StateDropDownList.DataTextField = "name";
            StateDropDownList.DataBind();
            StateDropDownList.Items.Insert(0, new ListItem("Select State", ""));


            // Close reader and connection
            reader.Close();
            con.Close();
        }


        void populateCities(string selectedState)
        {

            SqlConnection con = new SqlConnection(constr);

            con.Open();
            // Create SQL command to select all cities for the selected state from "cities" table
            string sqlquery = "SELECT name FROM cities WHERE state_id = (SELECT id FROM states WHERE name = @selectedState)";
            SqlCommand cmd = new SqlCommand(sqlquery, con);

            // Add parameter for selected state to the command
            cmd.Parameters.AddWithValue("@selectedState", selectedState);

            // Execute command and store results in SqlDataReader
            SqlDataReader reader = cmd.ExecuteReader();

            // Bind the SqlDataReader to the dropdown list
            CityDropDownList.DataSource = reader;
            CityDropDownList.DataTextField = "name";
            CityDropDownList.DataBind();
            CityDropDownList.Items.Insert(0, new ListItem("Select City", ""));

            // Close reader and connection
            reader.Close();
            con.Close();






        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string gender = RadioButtonList1.SelectedValue;
            SqlConnection con = new SqlConnection(constr);
            string query = "insert into Register values(@FirstName,@LastName,@gender,@username,@password,@ConfirmPassword,@state,@email,@PhoneNumber,@city,@Role)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@FirstName", FirstNameTextBox.Text);
            cmd.Parameters.AddWithValue("@LastName", LastNameTextBox.Text);
            cmd.Parameters.AddWithValue("@gender", gender);
            cmd.Parameters.AddWithValue("@email", EmailTextBox.Text);
            cmd.Parameters.AddWithValue("@city", CityDropDownList.SelectedValue);
            cmd.Parameters.AddWithValue("@state", StateDropDownList.SelectedValue);
            cmd.Parameters.AddWithValue("@username", UserNameTextBox.Text);
            cmd.Parameters.AddWithValue("@password", PasswordTextBox.Text);
            cmd.Parameters.AddWithValue("@ConfirmPassword", ConfirmPasswordTextBox.Text);
            cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumberTextBox.Text);
            cmd.Parameters.AddWithValue("@Role", "user");

            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                string message = string.Format("Registration successful! Your username is-: {0} and password is:- {1}.", UserNameTextBox.Text, PasswordTextBox.Text);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", string.Format("swal('{0}', '', 'success'); $('.swal-modal').css('background-color', '#28b62c');", message), true);
                clearControls();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Registration failed!', 'Please check your credentials and try again.', 'error'); $('.swal-modal').css('background-color', 'red');", true);
            }
            con.Close();
        }


    }
}



