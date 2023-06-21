<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="UnitMaster.aspx.cs" Inherits="TaskWebsite.UnitMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    
    
    <style type="text/css">
       .form-container {
    background-color: #f2f2f2;
    border-radius: 20px;
    padding: 20px;
    margin-top: 50px;
    margin-bottom: 50px; 
    width: 80%;
    max-width: 500px;
    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
}

        .form-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
        }
        .form-field-label {
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 5px;
        }
        .form-field {
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
            font-weight: 400;
        }
        .submit-button {
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            font-weight: 500;
            padding: 10px 20px;
            margin-top: 20px;
            cursor: pointer;
            margin: 0 auto;
             display: block;
        }
        .submit-button:hover {
            background-color: #0062cc;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container form-container">
        <h1 class="text-center form-title">UNIT Master</h1>
        <div class="form-group">
            <label for="UnitNameTextBox" class="form-field-label">Unit Name</label>&nbsp;
            <asp:TextBox ID="UnitNameTextBox" runat="server" CssClass="form-control form-field" Width="100%"></asp:TextBox>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" Text="Submit" CssClass="submit-button" />
        </div>

    <asp:GridView runat="server"></asp:GridView>
     <div>
       

    </div>
    </div>
     <script>
        function sweetAlert() {
            swal({
                title: "Success!",
                text: "Inserted Successfully",
                type: "success",
                customClass: 'my-alert success-dialogue'
            }).then(function () {
                location.reload();
            });
        }
     </script>
   
</asp:Content>
