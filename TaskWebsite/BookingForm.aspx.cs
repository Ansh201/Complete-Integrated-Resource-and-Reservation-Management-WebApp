using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace TaskWebsite
{
    public partial class BookingForm : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateTextBox.Text = DateTime.Today.ToString("MM/dd/yyyy");
            }
            if (!IsPostBack)
            {
                // Bind the data to the GridView control
                gridview1.DataBind();
                PopulatevehicleNo();
                PopulateItemName();
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(constr);

            try
            {
                string insertQuery = "INSERT INTO BookingForm (Date,Name, Mobile, Email, BookingDate, Time, ItemName, Quantity, VehicleNo) " +
                                     "SELECT @Date, @Name, @Mobile, @Email, @BookingDate, @Time, @ItemName, @Quantity, @VehicleNo " +
                                     "WHERE NOT EXISTS (SELECT * FROM BookingForm WHERE BookingDate = @BookingDate AND Time = @Time AND VehicleNo = @VehicleNo)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);

                // Open the database connection
                con.Open();
                cmd.Parameters.AddWithValue("@Date", dateTextBox.Text);
                cmd.Parameters.AddWithValue("@Name", nameTextBox.Text);
                cmd.Parameters.AddWithValue("@Mobile", mobileTextBox.Text);
                cmd.Parameters.AddWithValue("@Email", emailTextBox.Text);

                DateTime bookingDate;
                if (DateTime.TryParseExact(bookingdateTextBox.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out bookingDate))
                {
                    cmd.Parameters.AddWithValue("@BookingDate", bookingDate);

                    cmd.Parameters.AddWithValue("@Time", TimeDropDownLIst.SelectedValue);
                    cmd.Parameters.AddWithValue("@ItemName", ItemNameDropDownList.SelectedValue);
                    cmd.Parameters.AddWithValue("@Quantity", QuantityTextBox.Text);
                    cmd.Parameters.AddWithValue("@VehicleNo", VehicleDropDownList.SelectedValue);

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "sweetAlert", "setTimeout(function() { swal('Success!', 'Booking Successful', 'success').then(function() { location.reload(); }); }, 500);", true);
                        gridview1.DataBind();


                        nameTextBox.Text = mobileTextBox.Text = emailTextBox.Text = TimeDropDownLIst.SelectedValue
                                            = ItemNameDropDownList.SelectedValue = QuantityTextBox.Text = VehicleDropDownList.SelectedValue = "";
                    }
                    else
                    {
                        string script = "swal('Error', 'This slot is already booked for the selected vehicle number', 'error');";
                        ClientScriptManager cs = Page.ClientScript;
                        cs.RegisterStartupScript(GetType(), "SweetAlert", script, true);
                    }
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "ErrorAlert", "Swal.fire({ icon: 'error', title: 'Error!', text: 'Invalid booking date format. Please enter the date in dd/MM/yyyy format.' });", true);
                }
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ErrorAlert", "Swal.fire({ icon: 'error', title: 'Error!', text: 'An error occurred while saving the booking details. Please try again.' });", true);
            }
            finally
            {
                // Close the database connection
                con.Close();
            }
        }

        protected void UpdateBooking_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/LoginPage.aspx");



        }

        protected void UpdateBookingButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LoginPage.aspx");
        }


        private void PopulatevehicleNo()
        {

            SqlConnection con = new SqlConnection(constr);
            try
            {
                List<string> vehiclenolist = new List<string>();
                string getVehiclenosql = "select vehicle_no from vehicle";
                SqlCommand cmd = new SqlCommand(getVehiclenosql, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    vehiclenolist.Add(reader.GetString(0));
                }
                VehicleDropDownList.DataSource = vehiclenolist;
                VehicleDropDownList.DataBind();
                // Add "Select" option as default value
                VehicleDropDownList.Items.Insert(0, new ListItem("Select Vehicle", ""));

            }
            catch (SqlException ex)
            {


            }
            finally
            {
                con.Close();
            }





        }


        private void PopulateItemName()
        {

            SqlConnection con = new SqlConnection(constr);

            try
            {
                List<string> Itemlist = new List<string>();
                String getItemsql = "Select ItemName from ItemMaster";
                SqlCommand cmd = new SqlCommand(getItemsql, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Itemlist.Add(reader.GetString(0));

                }
                ItemNameDropDownList.DataSource = Itemlist;
                ItemNameDropDownList.DataBind();

                // Add "Select" option as default value
                ItemNameDropDownList.Items.Insert(0, new ListItem("Select Item", ""));


            }
            catch (SqlException ex)
            {

            }
            finally
            {
                con.Close();
            }



        }


    }
}




