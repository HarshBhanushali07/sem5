<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="6_2.aspx.cs" Inherits="WebCalc.Calculator" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calculator</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Calculator</h2>

        <table>
            <tr>
                <td>
                    <asp:Label ID="lbl1" runat="server" Text="Enter First Number:" />
                </td>
                <td>
                    <asp:TextBox ID="txtNum1" runat="server" />
                    <asp:RequiredFieldValidator 
                        ID="rfvNum1" 
                        runat="server" 
                        ControlToValidate="txtNum1" 
                        ErrorMessage="First number is required." 
                        ForeColor="Red" />
                    <asp:RegularExpressionValidator 
                        ID="revNum1" 
                        runat="server" 
                        ControlToValidate="txtNum1" 
                        ValidationExpression="^-?\d+(\.\d+)?$" 
                        ErrorMessage="Enter a valid number." 
                        ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl2" runat="server" Text="Enter Second Number:" />
                </td>
                <td>
                    <asp:TextBox ID="txtNum2" runat="server" />
                    <asp:RequiredFieldValidator 
                        ID="rfvNum2" 
                        runat="server" 
                        ControlToValidate="txtNum2" 
                        ErrorMessage="Second number is required." 
                        ForeColor="Red" />
                    <asp:RegularExpressionValidator 
                        ID="revNum2" 
                        runat="server" 
                        ControlToValidate="txtNum2" 
                        ValidationExpression="^-?\d+(\.\d+)?$" 
                        ErrorMessage="Enter a valid number." 
                        ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Button ID="btnAdd" runat="server" Text="Add (+)" OnClick="Calculate" />
                    <asp:Button ID="btnSub" runat="server" Text="Subtract (-)" OnClick="Calculate" />
                    <asp:Button ID="btnMul" runat="server" Text="Multiply (*)" OnClick="Calculate" />
                    <asp:Button ID="btnDiv" runat="server" Text="Divide (/)" OnClick="Calculate" />
                    <asp:Button ID="btnMod" runat="server" Text="Modulo (%)" OnClick="Calculate" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Label ID="lblResult" runat="server" Font-Bold="True" ForeColor="DarkGreen" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>