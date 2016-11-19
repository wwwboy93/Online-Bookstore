<%@ Page Language="C#" Title="登录" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="在线书店.login" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" Runat="server">	
		<div class="content login-box">
			<div class="login-main">
				<div class="wrap">
					<h1 style="position: relative; left: 20px;">注册/登陆	</h1>
					<div class="login-left">
					  <h3>新用户注册</h3>
						<p>通过创建一个帐户与我们的商店,你将能够通过结帐过程更快,存储多个航运地址,查看和跟踪你的订单在你的帐户和获取更多功能。</p>
						<a class="acount-btn" href="register.html">加入在线书店</a>
					</div>
          <hr   style="position: absolute; width: 0.001px; height: 400px; left: 783px; top: 233px;"    color= "black "/>
					<div class="login-right">
					  <h3>已经是我们的一员</h3>
						<p>如果你有一个在线书店的账户，请直接登录</p>
						
							<div>
								<span>用户名<label>*</label></span>
								<asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                    CssClass="failureNotification" ErrorMessage="用户名是必须的." ToolTip="用户名是必须的.">*用户名是必须的</asp:RequiredFieldValidator>
                            </div>
                        <div>
                            <span>密码<label>*</label></span>
                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                CssClass="failureNotification" >*密码是必须的</asp:RequiredFieldValidator>
                        </div>
							<asp:Button ID="ImageButton" runat="server" Text="点击登录" OnClick="ImageButton_Click"></asp:Button>
						
					</div>
					<div class="clear"> </div>
				</div>
			</div>
		</div>
	</asp:Content>