<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ItemMaster.aspx.cs" Inherits="TaskWebsite.ItemMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <style type="text/css">
        /* Set the width of the table */
        .table-width {
            max-width: 600px;
            margin: 0 auto; /* Center the table horizontally */
        }

        /* Set the width of the form elements */
        .form-control-width {
            width: 100%;
            max-width: 300px;
        }

        .form-control {
            color: aqua
        }
        /* Customize SweetAlert box size */
        .swal2-popup {
            width: 400px !important;
            height: 300px !important;
        }

        .table {
            border: 2px solid green !important;
            border-collapse: collapse;
            width: 400%;
            margin-left: 150px !important;
        }



            .table td, .table th {
                padding: 8px;
            }

            .table thead th {
                background-color: #007bff;
                color: #fff;
            }

            .table tbody tr:nth-child(even) {
                background-color: #f5f5f5;
            }

            .table tbody tr:nth-child(odd) {
                background-color: #fff;
            }


        /* Change the header color */
        #CategoryGridView th {
            background-color: #007bff;
            color: #fff;
        }

        /* Change the row hover color */
        #CategoryGridView tbody tr:hover {
            background-color: #f5f5f5;
        }

        /* Center the contents of the cells */
        #CategoryGridView td,
        #CategoryGridView th {
            text-align: center;
        }

        /* Change the edit and delete buttons */
        #CategoryGridView .btn-default {
            background-color: #f0ad4e;
            border-color: #eea236;
            color: #fff;
        }

        /* Style the search button */
        #SearchButton {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
        }

        .gridview-style {
            border-collapse: collapse;
        }

            .gridview-style th,
            .gridview-style td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
            }

            .gridview-style th {
                background-color: #f2f2f2;
            }

            .gridview-style tr:nth-child(even) {
                background-color: #f2f2f2;
            }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container12">
        <script src="js/sweetalert.min.js"></script>

        <table class="table table-bordered table-striped table-width table">
            <thead>
                <tr>
                    <th colspan="2" class="text-center">ITEM MASTER</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="text-right">Category</td>
                    <td>
                        <asp:DropDownList ID="CategoryDropDownList" runat="server" CssClass="form-control form-control-width">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="text-right">Item Name</td>
                    <td>
                        <asp:TextBox ID="ItemNameTextBox" runat="server" CssClass="form-control form-control-width"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="text-right">Unit</td>
                    <td>
                        <asp:DropDownList ID="UnitDropDownList" runat="server" CssClass="form-control form-control-width">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="text-right">Rate</td>
                    <td>
                        <asp:TextBox ID="RateTextBox" runat="server" CssClass="form-control form-control-width"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                        <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" Text="Submit" CssClass="btn btn-primary" />
                    </td>
                </tr>
            </tbody>
        </table>

        <asp:GridView ID="CategoryGridView" runat="server" CssClass=" gridview-style table table-striped table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="id">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                <asp:BoundField DataField="Unit" HeaderText="Unit" SortExpression="Unit" />
                <asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewTaskConnectionString %>" DeleteCommand="DELETE FROM [ItemMaster] WHERE [id] = @id" InsertCommand="INSERT INTO [ItemMaster] ([Category], [ItemName], [Unit], [Rate]) VALUES (@Category, @ItemName, @Unit, @Rate)" SelectCommand="SELECT [id], [Category], [ItemName], [Unit], [Rate] FROM [ItemMaster]" UpdateCommand="UPDATE [ItemMaster] SET [Category] = @Category, [ItemName] = @ItemName, [Unit] = @Unit, [Rate] = @Rate WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Unit" Type="String" />
                <asp:Parameter Name="Rate" Type="Double" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Unit" Type="String" />
                <asp:Parameter Name="Rate" Type="Double" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
