<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebCalc.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Student Registration Form</h2>

        <table cellpadding="6">
            <tr>
                <td>
                    <asp:Label ID="lblName" runat="server" Text="Full Name:" />

                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" />
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Text="Email Address:" />

                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" />

                </td>
            </tr>

            <tr>
                <td><asp:Label ID="lblDOB" runat="server" Text="Date of Birth:" /></td>
                <td><asp:Calendar ID="calDOB" runat="server" /></td>
            </tr>

            <tr>
                <td><asp:Label ID="lblImage" runat="server" Text="Profile Image:" /></td>
                <td><asp:Image ID="imgProfile" runat="server" ImageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUPIfiGgUML8G3ZqsNLHfaCnZK3I5g4tJabQ&s" Width="100px" /></td>
            </tr>

            <tr>
                <td colspan="5" align="center">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="lnkReset" runat="server" OnClick="lnkReset_Click">Reset</asp:LinkButton>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="https://www.darshan.ac.in/">
                        Go to Darshan University Website
                    </asp:HyperLink>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <br />
                    <asp:Label ID="lblOutput" runat="server" Font-Bold="true" ForeColor="DarkGreen" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
