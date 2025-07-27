<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="6_1.aspx.cs" Inherits="Lab_6._6_1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Validation Controls Example</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblName" runat="server" Text="Name:" />
            <asp:TextBox ID="txtName" runat="server" />
            <asp:RequiredFieldValidator 
                ID="rfvName" 
                runat="server" 
                ControlToValidate="txtName" 
                ErrorMessage="Name is required." 
                ForeColor="Red" />

            <br /><br />

            <asp:Label ID="lblAge" runat="server" Text="Age (18-60):" />
            <asp:TextBox ID="txtAge" runat="server" />
            <asp:RequiredFieldValidator 
                ID="rfvAge" 
                runat="server" 
                ControlToValidate="txtAge" 
                ErrorMessage="Age is required." 
                ForeColor="Red" />
            <asp:RangeValidator 
                ID="rvAge" 
                runat="server" 
                ControlToValidate="txtAge" 
                MinimumValue="18" 
                MaximumValue="60" 
                Type="Integer" 
                ErrorMessage="Age must be between 18 and 60." 
                ForeColor="Red" />

            <br /><br />

            <asp:Label ID="lblEmail" runat="server" Text="Email:" />
            <asp:TextBox ID="txtEmail" runat="server" />
            <asp:RequiredFieldValidator 
                ID="rfvEmail" 
                runat="server" 
                ControlToValidate="txtEmail" 
                ErrorMessage="Email is required." 
                ForeColor="Red" />
            <asp:RegularExpressionValidator 
                ID="revEmail" 
                runat="server" 
                ControlToValidate="txtEmail" 
                ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" 
                ErrorMessage="Invalid email format." 
                ForeColor="Red" />

            <br /><br />

            <asp:Label ID="lblPassword" runat="server" Text="Password:" />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator 
                ID="rfvPassword" 
                runat="server" 
                ControlToValidate="txtPassword" 
                ErrorMessage="Password is required." 
                ForeColor="Red" />

            <br />

            <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:" />
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator 
                ID="rfvConfirmPassword" 
                runat="server" 
                ControlToValidate="txtConfirmPassword" 
                ErrorMessage="Confirm Password is required." 
                ForeColor="Red" />
            <asp:CompareValidator 
                ID="cvPassword" 
                runat="server" 
                ControlToValidate="txtConfirmPassword" 
                ControlToCompare="txtPassword" 
                ErrorMessage="Passwords do not match." 
                ForeColor="Red" />

            <br /><br />

            <asp:Button ID="btnsub" runat="server" Text="Submit" OnClick="btnsub_Click" />
        </div>
    </form>
</body>
</html>