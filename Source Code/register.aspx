<%@ Page Language="C#" Title="注册" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="在线书店.register" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content login-box">
        <div class="login-main">
            <div class="wrap">
                <h1>注册一个账户</h1>
                <div class="register-grids">
                    <div class="register-top-grid">
                        <h3>填写您的个人信息</h3>
                        <div>
                            <span>
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName"
                                    Width="66px" ForeColor="Black">用户名*</asp:Label></span>
                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                CssClass="failureNotification" ErrorMessage="用户名是必须的." ToolTip="用户名是必须的." ForeColor="#FF9900"></asp:RequiredFieldValidator>
                        </div>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <div>
                            <span>
                                <asp:Label ID="VirtualNameLabel" runat="server" AssociatedControlID="VirtualName"
                                    Width="81px" ForeColor="Black">真实姓名*</asp:Label></span>
                            <asp:TextBox ID="VirtualName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="VirtualNameRequired" runat="server" ControlToValidate="VirtualName"
                                CssClass="failureNotification" ErrorMessage="真实姓名是必须的." ToolTip="真实姓名是必须的." ForeColor="#FF9900"></asp:RequiredFieldValidator>
                        </div>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <div>
                            <span>
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email"
                                    Height="16px" Width="57px" ForeColor="black">E-mail*</asp:Label></span>
                            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                CssClass="failureNotification" ErrorMessage="E-mail是必须的." ToolTip="E-mail是必须的."
                                ForeColor="#FF9900"></asp:RequiredFieldValidator>
                        </div>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <div>
                            <span>
                                <asp:Label ID="PhoneNumberlabel" runat="server" AssociatedControlID="PhoneNumber"
                                    ForeColor="Black" Width="79px">联系方式*</asp:Label></span>
                            <asp:TextBox ID="PhoneNumber" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PhoneNumberRequired" runat="server" ControlToValidate="PhoneNumber"
                                CssClass="failureNotification" ErrorMessage="联系方式是必须的." ToolTip="联系方式是必须的." ForeColor="#FF9900"></asp:RequiredFieldValidator>

                        </div>
                        <p>&nbsp;</p>
                        <p>
                        </p>
                    </div>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>
                        <a class="news-letter" href="#">
                            <span>是否同意我们的协议</span>
                            <input class='tgl tgl-ios' id='cb1' type='checkbox' checked/>
                            <label class='tgl-btn' for='cb1'></label>
                        </a>
                    </p>
                    <div class="clear"></div>

                    <div class="clear"></div>
                    <div class="register-bottom-grid">
                        <h3>登录信息</h3>
                        <div>
                            <span>
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password"
                                    ForeColor="Black" Height="16px" Width="42px">密码*</asp:Label></span>
                            <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                CssClass="failureNotification" ErrorMessage="用户密码是必须的." ToolTip="用户密码是必须的." ForeColor="#FF9900"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <span>
                                <asp:Label ID="ConfirmPasswordLabel" runat="server"
                                    AssociatedControlID="ConfirmPassword" ForeColor="Black" Height="16px"
                                    Width="72px">确认密码*</asp:Label></span>
                            <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic"
                                ErrorMessage="确认密码是必须的." ID="ConfirmPasswordRequired" runat="server"
                                ToolTip="确认密码是必须的." ForeColor="#FF9900"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                CssClass="failureNotification" Display="Dynamic" ErrorMessage="密码与确认密码必须匹配." ForeColor="#FF9900"></asp:CompareValidator>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                    <asp:Button ID="ConfirmRegist" runat="server" Text="确认注册"
                        CausesValidation="true" OnClick="ConfirmRegist_Click"></asp:Button>
                </div>
            </div>
        </div>
    </div>
    <!---- start-bottom-grids---->
</asp:Content>
