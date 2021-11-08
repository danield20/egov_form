<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Taxe.aspx.cs" Inherits="WebApplication1.Taxe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
            width: 849px;
        }
        .auto-style3 {
            width: 849px;
            height: 23px;
        }
        .auto-style6 {
            width: 212px;
        }
        .auto-style8 {
            width: 212px;
            text-align: left;
            height: 36px;
        }
        .auto-style9 {
            width: 849px;
            height: 36px;
        }
        .auto-style10 {
            height: 36px;
        }
        .auto-style14 {
            height: 537px;
            text-align: justify;
        }
        .auto-style15 {
            text-align: center;
            height: 127px;
            font-size: 50pt;
        }
        .auto-style23 {
            width: 849px;
            height: 35px;
            text-align: right;
        }
        .auto-style24 {
            width: 212px;
            text-align: left;
            height: 35px;
        }
        .auto-style25 {
            height: 35px;
        }
        .auto-style27 {
            width: 212px;
            height: 35px;
        }
        .auto-style28 {
            width: 212px;
            height: 23px;
        }
        .auto-style29 {
            height: 23px;
        }
    </style>
    <script>    
        function text_changed(textObj) {
            searchedword = textObj.value;
            var textboxTVA = document.getElementById("TextBoxPlataTVA");
            if (textboxTVA != "") {
                var b = parseInt(searchedword) || 0;
                textboxTVA.value = (b * 1.19).toFixed(3);
            }
        }
    </script>
</head>
<body style="height: 596px">
    <form id="form1" runat="server">
        <div class="auto-style14">
            <asp:Panel ID="panelPDF" runat="server">
                <table class="auto-style1">
                        <tr>
                        <td class="auto-style15" colspan="3"><strong>Formular Plata</strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style6">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Nume</td>
                        <td class="auto-style27">
                            <asp:TextBox ID="TextBoxNume" runat="server" Width="188px"></asp:TextBox>
                        </td>
                        <td class="auto-style25">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxNume" ErrorMessage="Numele este necesar" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Prenume</td>
                        <td class="auto-style27">
                            <asp:TextBox ID="TextBoxPrenume" runat="server" Width="189px"></asp:TextBox>
                        </td>
                        <td class="auto-style25">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPrenume" ErrorMessage="Prenumele este necesar" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                        <tr>
                            <td class="auto-style23">CNP:</td>
                            <td class="auto-style27">
                                <asp:TextBox ID="TextBoxCNP" runat="server" Width="189px"></asp:TextBox>
                            </td>
                            <td class="auto-style25">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxCNP" ErrorMessage="*  " ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxCNP" ErrorMessage="CNP invalid" ForeColor="Red" ValidationExpression="\d{13}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    <tr>
                        <td class="auto-style23">Institutie</td>
                        <td class="auto-style27">
                            <asp:DropDownList ID="DropDownListInstitutie" runat="server" Width="200px">
                                <asp:ListItem>Selectati Institutie</asp:ListItem>
                                <asp:ListItem>Impozite si Taxe</asp:ListItem>
                                <asp:ListItem>Amenzi</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style25">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownListInstitutie" ErrorMessage="Institutia este necesara" ForeColor="Red" InitialValue="Selectati Institutie"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Judet</td>
                        <td class="auto-style27">
                            <asp:DropDownList ID="DropDownListJudet" runat="server" Width="200px" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="State" DataValueField="StateID">
                                <asp:ListItem Value="0">Selectati Judet</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" SelectCommand="SELECT * FROM [State]"></asp:SqlDataSource>
                        </td>
                        <td class="auto-style25">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownListJudet" ErrorMessage="Judetul este necesar" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Oras</td>
                        <td class="auto-style27">
                            <asp:DropDownList ID="DropDownListOras" runat="server" Width="200px" DataSourceID="SqlDataSource2" DataTextField="CityName" DataValueField="StateId">
                                <asp:ListItem Selected="True" Value="0">Selectati Oras</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" SelectCommand="SELECT * FROM [City] WHERE ([StateId] = @StateId)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownListJudet" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="auto-style25">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownListOras" ErrorMessage="Orasul este necesar" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Suma de plata (Brut) </td>
                        <td class="auto-style24">
                            <asp:TextBox ID="TextBoxPlataBrut" runat="server" Width="190px"  onKeyUp="javascript:text_changed(this);"></asp:TextBox>
                        </td>
                        <td class="auto-style25">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxPlataBrut" ErrorMessage="Suma este necesara" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Suma de plata (cu TVA)</td>
                        <td class="auto-style24">
                            <asp:TextBox ID="TextBoxPlataTVA" runat="server" Width="188px"></asp:TextBox>
                        </td>
                        <td class="auto-style25"></td>
                    </tr>
                    <tr>
                        <td class="auto-style9"></td>
                        <td class="auto-style8">
                            <table class="auto-style1">
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Submit" />
                                        <input id="Reset1" type="reset" value="Reset" /></td>
                                </tr>
                            </table>
                        </td>
                        <td class="auto-style10"></td>
                    </tr>
                    <tr>
                        <td class="auto-style3"></td>
                        <td class="auto-style28"></td>
                        <td class="auto-style29"></td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
