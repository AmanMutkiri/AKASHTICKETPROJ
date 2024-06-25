<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ticket_Dashboard.aspx.cs" Inherits="AKASHTICKETPROJ.Ticket_Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function showPopup() {
            document.getElementById('popupPanel').style.display = 'block';
        }

        function hidePopup() {
            document.getElementById('popupPanel').style.display = 'none';
        }
    </script>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet" />
    <link href="../dist-assets/css/themes/lite-purple.min.css" rel="stylesheet" />
    <link href="../dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <div style="margin-bottom: 20px;"></div>

        <asp:Button ID="Button1" runat="server" Text="Add New Ticket" OnClick="Button1_Click" CssClass="btn btn-primary" />
        <asp:Button ID="Button3" runat="server" Text="Customer List" OnClick="Button3_Click" CssClass="btn btn-primary" />

        <div>
            <div style="margin-bottom: 20px;">
            </div>

            <div class="col-md-12 mb-4">
                <div class="card text-left">
                    <div class="card-body">
                        <h4 class="card-title mb-3">Ticket's</h4>

                        <ul class="nav nav-tabs " id="myTab" role="tablist">
                            <li class="nav-item ">
                                <asp:LinkButton ID="LinkButtonOpen" runat="server" CssClass="nav-link active" OnClick="LinkButton_Click" Role="tab" Aria-Controls="homeBasic" Aria-Selected="true">OPEN</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="LinkButtonHold" runat="server" CssClass="nav-link" OnClick="LinkButton_Click" Role="tab" Aria-Controls="profileBasic" Aria-Selected="false">HOLD</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="LinkButtonClose" runat="server" CssClass="nav-link" OnClick="LinkButton_Click" Role="tab" Aria-Controls="contactBasic" Aria-Selected="false">CLOSE</asp:LinkButton>
                            </li>
                        </ul>


                        <div class="tab-content" id="myTabContent">


                            <asp:Panel ID="Panel1" runat="server">
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-12 ">
                                            <div class="card text-left">
                                                <div class="card-body">
                                                    <%# Eval("SID") %><span> : </span><%# Eval("CustomerName") %><br />
                                                    <%# Eval("Ticket_Type") %><span> : </span><%# Eval("Ticket_Subject") %>
                                                    <asp:LinkButton ID="EditButton2" runat="server" Text="Edit" OnClick="EditButton2_Click" CommandArgument='<%# Eval("TicketID") %>' />

                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server" Visible="false">
                                <asp:Repeater ID="Repeater2" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-12 ">
                                            <div class="card text-left">
                                                <div class="card-body">
                                                    <%# Eval("SID") %><span>:</span><%# Eval("CustomerName") %><br />
                                                    <%# Eval("Ticket_Type") %><span>:</span><%# Eval("Ticket_Subject") %>
                                                    <asp:LinkButton ID="EditButton1" runat="server" Text="Edit" OnClick="EditButton1_Click" CommandArgument='<%# Eval("TicketID") %>' />
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </asp:Panel>
                            <asp:Panel ID="Panel3" runat="server" Visible="false">
                                <asp:Repeater ID="Repeater3" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-12 ">
                                            <div class="card text-left">
                                                <div class="card-body">
                                                    <%# Eval("SID") %><span>:</span><%# Eval("CustomerName") %><br />
                                                    <%# Eval("Ticket_Type") %><span>:</span><%# Eval("Ticket_Subject") %>
                                                    <asp:LinkButton ID="EditButton" runat="server" Text="Edit" OnClick="EditButton_Click" CommandArgument='<%# Eval("TicketID") %>' />
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </asp:Panel>


                        </div>
                    </div>
                </div>
            </div>







        </div>

        <div style="margin-bottom: 20px;">
        </div>

        <div>


            <div id="">
                <asp:Panel ID="popupPanel" runat="server" Style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; border: 1px solid #ccc;">

                    <div class="row">
                        <div class="col-md-12">

                            <div class="card mb-4">
                                <div class="card-body">
                                    <div class="card-title mb-3">Ticket #2024/01130</div>
                                    <asp:Button ID="Button2" runat="server" Text="X" OnClick="Button2_Click" Style="position: absolute; top: 0; right: 0;" />
                                    <div class="row ">

                                        <div class="col-md-6 form-group mb-3">
                                            <label for="picker1">Ticket Type</label>
                                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                                                <asp:ListItem Text="Select" Value="" />
                                                <asp:ListItem Text="Development" Value="Development" />
                                                <asp:ListItem Text="Bug" Value="Bug" />
                                                <asp:ListItem Text="Support" Value="Support" />
                                            </asp:DropDownList>


                                        </div>


                                        <div class="col-md-6 form-group mb-3">
                                            <asp:HiddenField ID="HiddenFieldCustomerId" runat="server" />
                                            <asp:HiddenField ID="ticketIDHiddenField" runat="server" />
                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                            <label for="firstName1">Customer Name</label>
                                            <asp:HiddenField ID="hiddenRowID" runat="server" />
                                            <asp:TextBox ID="customerName" runat="server" placeholder="Enter customer name" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-md-12 form-group mb-3">
                                            <label for="firstName1">Ticket Subject</label>
                                            <asp:TextBox ID="subject" runat="server" placeholder="Enter Ticket Subject" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-md-12 form-group mb-3">
                                            <label for="firstName1">Description</label>
                                            <asp:TextBox ID="Description" runat="server" placeholder="Enter Description" class="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="card mb-4">
                                                <div class="card-body ">
                                                    <div class="card-title col-md-12">Ticket Status</div>
                                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                                        <asp:ListItem Text="Open" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="Hold" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Close" Value="2"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <br />
                                                    <div style="text-align: center">
                                                        <asp:LinkButton class="btn btn-primary ripple m-1" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Save</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>

        <%-- <script src="../../dist-assets/js/plugins/jquery-3.3.1.min.js"></script>--%>
        <script src="../../dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
        <script src="../../dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
        <script src="../../dist-assets/js/scripts/script.min.js"></script>
        <script src="../../dist-assets/js/scripts/sidebar.large.script.min.js"></script>
      
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

       

        <script type="text/javascript">       
            $(document).ready(function () {
                $("#customerName").autocomplete({
                    source: function (request, response) {
                        var _prefix = request.term.toString();
                        $.ajax({
                            url: '../../GetCustomerDetails.asmx/GetItemWithFilter',
                            type: 'POST',
                            contentType: 'application/json; charset=utf-8',
                            data: JSON.stringify({ prefix: _prefix }),
                            dataType: 'json',
                            success: function (data) {
                                // Map the data to the format autocomplete expects
                                response($.map(data.d, function (item) {
                                    console.log("RowID:" + item.RowID)
                                    return {
                                        label: item.CustomerName + " : " + item.SID,
                                        value: item.CustomerName,
                                        id: item.RowID // store the primary key
                                    };
                                }));
                            },
                            error: function (xhr, status, error) {
                                console.log(status + ' - ' + error);
                            }
                        });
                    },
                    minLength: 1,
                    select: function (event, ui) {
                        $('#customerName').val(ui.item.value);
                        $('#Label1').text(ui.item.id);
                        $('#HiddenFieldCustomerId').val(ui.item.id); // Set the hidden field with the primary key
                        return false;
                    },
                });

            });
        </script>

    </form>
</body>
</html>
