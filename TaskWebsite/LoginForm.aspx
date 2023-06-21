<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="TaskWebsite.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
    <!-- Add Bootstrap stylesheet -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/sweetalert.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>




    <!-- Add custom stylesheet -->
      <style type="text/css">

        /* Center the form on the page */
          body {
              display: flex;
              align-items: center;
              justify-content: center;
              height: 100vh; 
              background-image: url('Images/LoginEncryption.jpg');
              background-repeat: no-repeat;
              background-size: cover;
          }
 .swal-icon--success {
            border-color: green;
            background-color: green;
        }

        /* Set background color for failure message */
        .swal-icon--error {
            border-color: red;
            background-color: red;
        }
        .swal-modal {
  border-radius: 50px;
}

        /*.swal-modal {
  background-color: #007bff    ;*/ /* Replace with your desired color */
  /*border-radius: 50px;*/ /* Replace with your desired radius */
/*}*/
.swal-button-container {
  display: flex;
  justify-content: center;
  align-items: center;
}

        /* Style the form container */
        .form-container {
            background-color: 
            padding: 20px;
            border-radius: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
             max-width: 800px;
   width: 540px;
   margin-bottom:200px;
            margin-left:700px;
            border: 1px solid black; 
            border-collapse: collapse;
            
            }

        /* Style the form headings */
        .form-heading {
            text-align: center;
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* Style the form labels */
        .form-label {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        /* Style the form inputs */
        .form-input {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        /* Style the form button */
        .form-button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        /* Change button color on hover */
        .form-button:hover {
            background-color: #0069d9;
        }

        /* Style the form link */
        .form-link {
            font-size: 14px;
            margin-top: 10px;
            text-align: center;
            display: block;
        }
       .my-alert-success {
  background-color: green;
}
          .form-control1 {
             margin-left:20px
          }

.my-alert-failed {
  background-color: red;
}
          .form-control {
               height: 40px;
    width: 500px;
    margin:auto;
          
          }

    label[for="UserTextBox"] {
  color: white;
}
input[type="text"]#UserTextBox {
  background-color: floralwhite;
}
label[for="PassTextBox"] {
  color: floralwhite;
}
input[type="password"]#PassTextBox {
  background-color: ;
}
.form-link {
  color:whitesmoke;
}


    </style>
</head>
<body>
    <div class="form-container ">
        <h2 class="form-heading" style="color: yellow;">User Login</h2>
        <form id="form1" runat="server">
            <div class="form-group">
                <asp:TextBox ID="UserTextBox" runat="server" CssClass="form-control form-input" Placeholder="Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="form-control1" ControlToValidate="UserTextBox" Display="Dynamic" ErrorMessage="Please enter your username" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:TextBox ID="PassTextBox" runat="server" TextMode="Password" CssClass="form-control form-input" Placeholder="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="form-control1" ControlToValidate="PassTextBox" Display="Dynamic" ErrorMessage="Please enter your password" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
<asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="form-button form-control" OnClick="LoginButton_Click" />
<span class="form-link">Don't have an account? <a href="Register.aspx">Sign up</a></span>
</form>
</div>

</body>
</html>