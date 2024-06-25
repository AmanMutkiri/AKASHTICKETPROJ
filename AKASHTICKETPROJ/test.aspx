<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="AKASHTICKETPROJ.test" %>

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
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <asp:Button ID="Button1" runat="server" Text="Open Popup" OnClick="Button1_Click" />
            <%--<button onclick="showPopup()">Open Popup</button>--%>
            <div id="">
                <asp:Panel ID="popupPanel" runat="server" Style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 20px; border: 1px solid #ccc;">
                    <!-- Your popup content here -->
                    <h2>Popup Panel</h2>
                    <p>This is a popup panel.</p>
                    <button onclick="hidePopup()">Close</button>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
