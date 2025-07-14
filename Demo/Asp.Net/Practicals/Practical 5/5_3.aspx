<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="5_3.aspx.cs" Inherits="Lab_5._5_3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Sales</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Book Sales</h2>

        <asp:Label ID="lblbktitle" runat="server" Text="Book Title:" />
        <br />
        <asp:TextBox ID="txtbktitle" runat="server" />
        <br /><br />

        <asp:Label ID="lblbkprice" runat="server" Text="Book Price:" />
        <br />
        <asp:TextBox ID="txtbkprice" runat="server" />
        <br /><br />

        <asp:Label ID="lblbkcount" runat="server" Text="Book Quantity:" />
        <br />
        <asp:TextBox ID="txtbkcount" runat="server" />
        <br /><br />

        <asp:Button ID="btnsub" runat="server" Text="Submit" OnClick="btnsub_Click" />
        <asp:Button ID="btnreset" runat="server" Text="Reset" OnClick="btnreset_Click" />
        <br /><br />

        <asp:ListBox ID="lboutput" runat="server" Width="300px" Height="100px" />
    </form>
</body>
</html>
