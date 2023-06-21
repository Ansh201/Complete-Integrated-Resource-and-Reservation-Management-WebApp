<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TaskWebsite.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
     <link rel="stylesheet" type="text/css" href="css/sweetalert.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <style type="text/css">
        /* Center the table */
        table {
            margin: auto;
            width: 80%;
            border: 5px solid blue;
            padding: 20px;
        }
        /* Style the form header */
        .form-header {
            font-size: 25px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
        .swal {
  background-color: #f1c40f; /* Replace with your desired color */
}
        .swal-modal {
  background-color: #28b62c  ; /* Replace with your desired color */
  border-radius: 50px; /* Replace with your desired radius */
}
.swal-button-container {
  display: flex;
  justify-content: center;
  align-items: center;
}



        /* Style the form labels */
        label {
            font-weight: bold;
        }
        /* Style the form buttons */
        .btn {
            margin-top: 20px;
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td colspan="2" class="form-header">SIGNUP FORM</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <label for="FirstNameTextBox">First Name:</label>
                        <asp:TextBox ID="FirstNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Please enter your first name" ForeColor="Red" SetFocusOnError="True" ControlToValidate="FirstNameTextBox"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <label for="LastNameTextBox">Last Name:</label>
                        <asp:TextBox ID="LastNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="Please enter your last name" ForeColor="Red" SetFocusOnError="True" ControlToValidate="LastNameTextBox"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="RadioButtonList1">Gender:</label>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" CssClass="form-control">
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator InitialValue="" ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="Please select a gender" ForeColor="Red" ControlToValidate="RadioButtonList1"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                    <label for="UserNameTextBox">UserName:</label>
                    <asp:TextBox ID="UserNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="Please enter your username" ForeColor="Red" SetFocusOnError="True" ControlToValidate="UserNameTextBox"></asp:RequiredFieldValidator>
              
                </td> 
                   <%--<td>
                    <label for="EmailTextBox">Email:</label>
                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="Please enter your email" ForeColor="Red" SetFocusOnError="True" ControlToValidate="EmailTextBox"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ErrorMessage="Please enter a valid email" ForeColor="Red" SetFocusOnError="True" ControlToValidate="EmailTextBox" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td> --%>
            </tr>
            <tr>
               
               <td>
    <label for="PasswordTextBox">Password:</label>
    <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ErrorMessage="Please enter your password" ForeColor="Red" SetFocusOnError="True" ControlToValidate="PasswordTextBox"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="PasswordTextBox"
        ErrorMessage="Please Create Strong Password" ForeColor="Red"
        ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$"></asp:RegularExpressionValidator>
</td>


                 <td>
                    <label for="ConfirmPasswordTextBox">Confirm Password:</label>
                    <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ErrorMessage="Please confirm your password" ForeColor="Red" SetFocusOnError="True" ControlToValidate="ConfirmPasswordTextBox"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" ErrorMessage="Passwords do not match" ForeColor="Red" SetFocusOnError="True" ControlToCompare="PasswordTextBox" ControlToValidate="ConfirmPasswordTextBox"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
               
                <td>
                    <label for="PhoneNumberTextBox">Phone Number:</label>
                    <asp:TextBox ID="PhoneNumberTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ErrorMessage="Please enter your phone number" ForeColor="Red" SetFocusOnError="True" ControlToValidate="PhoneNumberTextBox"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic" ErrorMessage="Please enter a valid phone number" ForeColor="Red" SetFocusOnError="True" ControlToValidate="PhoneNumberTextBox" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <label for="EmailTextBox">Email:</label>
                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="Please enter your email" ForeColor="Red" SetFocusOnError="True" ControlToValidate="EmailTextBox"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ErrorMessage="Please enter a valid email" ForeColor="Red" SetFocusOnError="True" ControlToValidate="EmailTextBox" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>

<%--                 <td>
                    <label for="AddressTextBox">Address:</label>
                    <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic" ErrorMessage="Please enter your address" ForeColor="Red" SetFocusOnError="True" ControlToValidate="AddressTextBox"></asp:RequiredFieldValidator>
                </td>--%>
           
<tr>
               <%--  --%>
                <td>
                    <label for="StateTextBox">State:</label>
                    <asp:DropDownList ID="StateDropDownList" runat="server" Width="245px">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Display="Dynamic" ErrorMessage="Please select your State" ForeColor="Red" SetFocusOnError="True" ControlToValidate="StateDropDownList"></asp:RequiredFieldValidator>
                </td>
     <td>
                    <label for="CityTextBox">City:</label>
                    <asp:DropDownList ID="CityDropDownList" runat="server" Width="245px">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" Display="Dynamic" ErrorMessage="Please Select your city" ForeColor="Red" SetFocusOnError="True" ControlToValidate="CityDropDownList"></asp:RequiredFieldValidator>
                </td>
               
            </tr>
            </tr>
              <tr>
  <td>
    <div class="form-check d-flex justify-content-start mb-4 pb-3">
      <input class="form-check-input me-3" type="checkbox" value="" id="form2Example3c" />
      <label class="form-check-label" for="form2Example3c">
        I do accept the <a href="#!" class="text-dark"><u>Terms and Conditions</u></a> of your site.
      </label>
    </div>
  </td>
</tr>

            
           <tr>
  <td colspan="2">
    <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click" />
  </td>
</tr>
<tr>
  <td colspan="2" class="text-center text-muted mt-5 mb-0">
    Have already an account? <a href="LoginForm.aspx" class="fw-bold text-body"><u>Login here</u></a>
  </td>
</tr>

        </table>
    </div>
</form>
</body>
</html>
