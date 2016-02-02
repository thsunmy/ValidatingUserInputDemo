<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="ValidationDemo._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Name: <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Enter your name">*</asp:RequiredFieldValidator>
        <br />
        E-mail address:
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter an e-mail address"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter a valid e-mail address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        Repeat e-mail address: <asp:TextBox ID="txtConfirmEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmEmail" ErrorMessage="Confirm the w-mail address"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtEmail" ControlToValidate="txtConfirmEmail" ErrorMessage="The e-mail address don't match"></asp:CompareValidator>
        <br />
        Home phone number:
        <asp:TextBox ID="txtHomePhone" runat="server" Width="128px"></asp:TextBox>
        <script type="text/javascript">
            function validatePhoneNumbers(source, args)
            {
                var phoneHome = document.getElementById('<%= txtHomePhone.ClientID %>');
                var phoneBusiness = document.getElementById('<%= txtBusinessPhone.ClientID %>');
                if (phoneHome.value != '' || phoneBusiness.value != '') {
                    args.IsValid = true;
                } else {
                    args.IsValid = false;
                }
            }
        </script>
        <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validatePhoneNumbers" Display="Dynamic" ErrorMessage="Enter your home or business phone number">*</asp:CustomValidator>
        <br />
        Business phone number: <asp:TextBox ID="txtBusinessPhone" runat="server"></asp:TextBox>
        <br />
        Comments:
        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtComments" ErrorMessage="Enter a comment"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please correct the following errors:" ShowMessageBox="True" />
        <br />
        <asp:Button ID="Button4" runat="server" Text="Send" />
    </div>
    </form>
</body>
</html>
