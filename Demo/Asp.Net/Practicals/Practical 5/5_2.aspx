<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="5_2.aspx.cs" Inherits="Lab_5._5_2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Language and Country Selection</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <span class="label">Select a language:</span>
            <asp:RadioButtonList ID="rblLanguages" runat="server" AutoPostBack="true" 
                OnSelectedIndexChanged="rblLanguages_SelectedIndexChanged">
                <asp:ListItem Value="English" Text="English"></asp:ListItem>
                <asp:ListItem Value="French" Text="French"></asp:ListItem>
                <asp:ListItem Value="Spanish" Text="Spanish"></asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <span class="label">Select a country:</span>
            <asp:DropDownList ID="ddlCountries" runat="server" AutoPostBack="true" 
                OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged"></asp:DropDownList>
            <asp:Label ID="lblOutput" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>