<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XmlWebApp._Default" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td style="width: 100px">Name:</td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox> 
                        <asp:RequiredFieldValidator ControlToValidate="txtName" Display="Static" ErrorMessage="Name is required!" runat="server" />  
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">Address:</td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtLocation" Display="Static" ErrorMessage="Address is required!" runat="server" />  
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">Nickname:</td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtNickname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtLocation" Display="Static" ErrorMessage="Nickname is required!" runat="server" />  
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px" valign="top">Comment:</td>
                    <td style="width: 100px">
                        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Height="104px"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtComments" Display="Static" ErrorMessage="Comment is required!" runat="server" />  
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" /></td>
                </tr>
            </table>
            <br />
            <asp:DataList ID="dlComments" runat="server" Width="100%">
                <ItemTemplate>
                    <hr size="0" />
                    Name: <%# DataBinder.Eval(Container.DataItem, "name") %><br />
                    Nickname: <%# DataBinder.Eval(Container.DataItem, "nickname") %><br />
                    Address: <%# DataBinder.Eval(Container.DataItem, "address") %><br />
                    Date: <%# DataBinder.Eval(Container.DataItem, "Date") %><br />
                    Description: <%# DataBinder.Eval(Container.DataItem, "Description") %>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>
