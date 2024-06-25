<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_Master.aspx.cs" Inherits="AKASHTICKETPROJ.Customer_Master" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script>
        function showPopup() {
            document.getElementById('popupPanel').style.display = 'block';
        }

        function hidePopup() {
            document.getElementById('popupPanel').style.display = 'none';
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="margin-bottom: 20px;"></div>
            <asp:Button ID="Button1" runat="server" Text="Add New Record" OnClick="Button1_Click" CssClass="btn btn-primary" />
            <asp:Button ID="Button3" runat="server" Text="Ticket Dashboard" OnClick="Button3_Click" CssClass="btn btn-primary" />
          
            <div id="">
                <asp:Panel ID="popupPanel" runat="server" Style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; border: 1px solid #ccc;">
                    <!-- Your popup content here -->
                    <div class="container">
                        <asp:HiddenField ID="hiddenRowID" runat="server" />
                        <div class="form-group">
                            <asp:Label ID="lblSID" runat="server" Text="SID:" CssClass="control-label"></asp:Label>
                            <asp:TextBox ID="txtSID" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:Label ID="ValidationSID" runat="server" Text="" Visible="false" Style="color: red"></asp:Label>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name:" CssClass="control-label"></asp:Label>
                            <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblCustomerArea" runat="server" Text="Customer Area:" CssClass="control-label"></asp:Label>
                            <asp:TextBox ID="txtCustomerArea" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblCustomerAddress" runat="server" Text="Customer Address:" CssClass="control-label"></asp:Label>
                            <asp:TextBox ID="txtCustomerAddress" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblCustomerContactPerson" runat="server" Text="Customer Contact Person:" CssClass="control-label"></asp:Label>
                            <asp:TextBox ID="txtCustomerContactPerson" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblCustomerMobile" runat="server" Text="Customer Mobile:" CssClass="control-label"></asp:Label>
                            <asp:TextBox ID="txtCustomerMobile" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblReferral" runat="server" Text="Referral:" CssClass="control-label"></asp:Label>
                            <asp:TextBox ID="txtReferral" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
                        <asp:Button ID="Button2" runat="server" Text="Close" CssClass="btn btn-primary" OnClick="Button2_Click" />
                    </div>
                </asp:Panel>
            </div>
        </div>




        <div style="margin-bottom: 20px;"></div>



        <div>
            <table class="table table-bordered">
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <tr>
                            <td>SID</td>
                            <td>Name</td>
                            <td>Area</td>
                            <td>Address</td>
                            <td>C. Person</td>
                            <td>Contact</td>
                            <td>Reff</td>
                            <td>Edit</td>
                            <td>Remove</td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%# Eval("SID") %>
                            </td>
                            <td>
                                <%# Eval("CustomerName") %>
                            </td>
                            <td>
                                <%# Eval("CustomerArea") %>
                            </td>
                            <td>
                                <%# Eval("CustomerAddress") %>
                            </td>
                            <td>
                                <%# Eval("CustomerContactPerson") %>
                            </td>
                            <td>
                                <%# Eval("CostomerMobile") %>
                            </td>
                            <td>
                                <%# Eval("Referral") %>
                            </td>
                            <td>
                                <asp:LinkButton ID="EditButton" runat="server" Text="Edit" OnClick="EditButton_Click" CommandArgument='<%# Eval("RowID") %>' />
                            </td>
                            <td>
                                <asp:LinkButton ID="RemoveButton" runat="server" Text="Remove" OnClick="RemoveButton_Click" CommandArgument='<%# Eval("RowID") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </form>
</body>
</html>
