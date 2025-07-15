<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="5_1.aspx.cs" Inherits="Lab_5._5_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
  <table  >
    <form id="form1" runat="server">
        <div>
         
                 <tr>
                     <th>
                         <h2>Fav Sport</h2>
                         
                     </th>
                 </tr>
                <tr>
                    <td>
                        <asp:CheckBoxList ID="chksports" AutoPostBack="true" runat="server" align="center">
                            <asp:ListItem Text="Cricket" Value="sp1" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Football" Value="sp2"></asp:ListItem>
                            <asp:ListItem Text="Kabbadi" Value="sp3"></asp:ListItem>
                            <asp:ListItem Text="Vollyball" Value="sp4"></asp:ListItem>
                            <asp:ListItem Text="Hockey" Value="sp5"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
            <tr>
                <td>
                    <asp:Label ID="lblresult" runat="server" ForeColor="Green" Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="btnresult" OnClick="chksports_SelectedIndexChanged" runat="server" Text="Submit"/>
                </td>
            </tr>
        </div>
    </form>
                  </table>
</body>
</html>
