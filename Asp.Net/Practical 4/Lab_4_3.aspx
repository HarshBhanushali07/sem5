<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lab_4_3.aspx.cs" Inherits="Lab_M_4_1.Lab4_2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form runat="server" id="form4">
        <h2>Dynamic Panel</h2>
        <div>
                    <asp:Label ID="lbldrop" AssociatedControlID="dropmain1" runat="server" Text="Select number:"></asp:Label>

                    <asp:DropDownList ID="dropmain1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropmain1_SelectedIndexChanged">
                        <asp:ListItem Text="1" Value="1"/>
                        <asp:ListItem Text="2" Value="2"/>
                        <asp:ListItem Text="3" Value="3"/>
                        <asp:ListItem Text="4" Value="4"/>
                        <asp:ListItem Text="5" Value="5"/>
                    </asp:DropDownList>
                    <asp:Label ID="lblans" runat="server"></asp:Label>
        <asp:Panel ID="DynamicPanel" runat="server"></asp:Panel>
            </div>
    </form>
</body>
</html>