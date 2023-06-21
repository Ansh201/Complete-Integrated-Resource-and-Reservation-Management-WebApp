<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="BookingForm.aspx.cs" Inherits="TaskWebsite.BookingForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />

    <style>
        /* Style for the GridView */
        .gridview {
            margin-top: 50px;
            border: 1px solid #ced4da;
            border-radius: 10px;
            background-color: #f2f2f2;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
            padding: 20px;
            margin-left: 120px;
        }

            /* Style for the GridView header row */

            .gridview th {
                font-weight: bold;
                background-color: #007bff;
                color: yellow;
                border-color: #007bff;
                text-align: center;
                vertical-align: middle;
                padding: 10px;
            }

            /* Style for the GridView data rows */
            .gridview td {
                border-color: #ced4da;
                text-align: center;
                vertical-align: middle;
                padding: 10px;
            }

            /* Style for the alternating GridView data rows */
            .gridview tr:nth-child(even) {
                background-color: #f8f9fa;
            }






        .form-control {
            border-radius: 0;
            border: 1px solid #ced4da;
            box-shadow: none;
            background-color: #f2f2f2;
        }

            .form-control:focus {
                border-color: #007bff;
                box-shadow: none;
            }

        .btn-primary {
            display: block;
            margin: 0 auto;
            text-align: center;
        }

        #booking-form {
            position: relative;
            z-index: 1;
        }


        .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }

        .btn-primary:focus {
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
        }


        .container {
            margin-top: 50px;
            border: 1px solid #ced4da;
            border-radius: 100px;
            padding: 20px;
            background-color: lightskyblue;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
            margin-left: 20px;
        }

        .form-control {
            border-radius: 0;
            border: 1px solid #ced4da;
            box-shadow: none;
            background-color: #f2f2f2;
            width: 700px; /* set the width to 300 pixels */
            height: 200px;
        }

            .form-control:hover {
                border-color: #007bff;
            }
    </style>



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form id="booking-form">
                        <div>
                            <table>
                                <h2 class="text-center mb-4">Booking Form</h2>
                                <div>

                                    <asp:ValidationSummary runat="server" ForeColor="Red" />
                                </div>
                                <div class="form-group">
                                    <label for="dateTextBox">Date:</label>
                                    <asp:TextBox class="form-control" ID="dateTextBox" runat="server"></asp:TextBox>

                                </div>




                                <div class="form-group">
                                    <label for="nameTextBox">Name:</label>

                                    <asp:TextBox class="form-control" ID="nameTextBox" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Name Can Not Be Empty" ControlToValidate="nameTextBox" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="mobileTextBox">Mobile:</label>

                                    <asp:TextBox class="form-control" ID="mobileTextBox" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Mobile No Can Not Be Empty" ControlToValidate="mobileTextBox" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ErrorMessage="Mobile No Sholud be of 10 Digit" ControlToValidate="mobileTextBox" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d{10}$">*</asp:RegularExpressionValidator>

                                </div>
                                <div class="form-group">
                                    <label for="emailTextBox">Email:</label>

                                    <asp:TextBox class="form-control" ID="emailTextBox" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Email Can Not Be Empty" ControlToValidate="emailTextBox" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ErrorMessage="Please Enter Valid Email" ControlToValidate="emailTextBox" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                </div>

                                <div class="form-group">
                                    <label for="bookingdateTextBox">Booking Date:</label>


                                    <asp:TextBox class="form-control" ID="bookingdateTextBox" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Please choose a boking Date" ControlToValidate="bookingdateTextBox" ForeColor="Red">*</asp:RequiredFieldValidator>


                                </div>






                                <div class="form-group">
                                    <label for="time">Time:</label>
                                    <asp:DropDownList ID="TimeDropDownLIst" runat="server">

                                        <asp:ListItem Value="">Select Time</asp:ListItem>
                                        <asp:ListItem Value="10-12">10 AM - 12 PM</asp:ListItem>
                                        <asp:ListItem Value="12-02">12 PM - 2 PM</asp:ListItem>
                                        <asp:ListItem Value="02-04">2 PM - 4 PM</asp:ListItem>
                                        <asp:ListItem Value="04-06">4 PM - 6 PM</asp:ListItem>
                                        <asp:ListItem Value="06-08">6 PM - 8 PM</asp:ListItem>
                                        <asp:ListItem Value="08-10">8 PM - 10 PM</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TimeDropDownLIst"
                                        InitialValue="Select Time" ErrorMessage="Please Select Time" ForeColor="Red">*</asp:RequiredFieldValidator>

                                </div>

                                <div class="form-group">
                                    <label for="ItemNameDropDownList">ItemName:</label>
                                    <asp:DropDownList ID="ItemNameDropDownList" runat="server" CssClass="form-control" size="0.8" required>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ItemNameDropDownList"
                                        InitialValue="Select Item12" ErrorMessage="Please Select Item" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="QuantityTextBox">Quantity:</label>

                                    <asp:TextBox class="form-control" ID="QuantityTextBox" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Please Enter Quantity" ControlToValidate="QuantityTextBox" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="VehicleDropDownList">Vehicle:</label>
                                    <asp:DropDownList ID="VehicleDropDownList" runat="server" CssClass="form-control" size="0.7" required>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="VehicleDropDownList"
                                        InitialValue="Select Vehicle" ErrorMessage="Please Select Vehicle" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>

                                <div class="text-center">
                                    <asp:Button runat="server" class="btn btn-primary" Text="BookNow" OnClick="Unnamed1_Click"></asp:Button>
                                </div>


                            </table>
                        </div>
                    </form>



                </div>
            </div>
        </div>

        <asp:GridView ID="gridview1" runat="server" CssClass="gridview" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="Id">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="VehicleNo" HeaderText="VehicleNo" SortExpression="VehicleNo" />
                <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" SortExpression="BookingDate" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewTaskConnectionString %>" DeleteCommand="DELETE FROM [BookingForm] WHERE [Id] = @Id" InsertCommand="INSERT INTO [BookingForm] ([Name], [Email], [Mobile], [ItemName], [Quantity], [VehicleNo], [BookingDate], [Time]) VALUES (@Name, @Email, @Mobile, @ItemName, @Quantity, @VehicleNo, @BookingDate, @Time)" SelectCommand="SELECT [Id], [Name], [Email], [Mobile], [ItemName], [Quantity], [VehicleNo], [BookingDate], [Time] FROM [BookingForm]" UpdateCommand="UPDATE [BookingForm] SET [Name] = @Name, [Email] = @Email, [Mobile] = @Mobile, [ItemName] = @ItemName, [Quantity] = @Quantity, [VehicleNo] = @VehicleNo, [BookingDate] = @BookingDate, [Time] = @Time WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Mobile" Type="String" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="VehicleNo" Type="String" />
                <asp:Parameter DbType="Date" Name="BookingDate" />
                <asp:Parameter Name="Time" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Mobile" Type="String" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="VehicleNo" Type="String" />
                <asp:Parameter DbType="Date" Name="BookingDate" />
                <asp:Parameter Name="Time" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NewTaskConnectionString %>" SelectCommand="SELECT [Name], [Email], [Mobile], [ItemName], [Quantity], [VehicleNo], [BookingDate], [Time] FROM [BookingForm]"></asp:SqlDataSource>


    </div>
    </div>
    </div>
</asp:Content>





