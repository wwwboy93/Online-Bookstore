<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" Title="订单详情页" AutoEventWireup="true" Inherits="unpaid" CodeBehind="unpaid.aspx.cs" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="wrap">
        <div class="content product-box-main">
            <div class="product-content-right">
                <div class="content-right-top-brands">
                    <h3>人气榜</h3>
                    <ul>
                        <asp:ListView ID="Orderview" runat="server" DataKeyNames="book_id">
                            <LayoutTemplate>
                                <table id="groupPlaceholderContainer" runat="server">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <GroupTemplate>
                                <tr id="itemPlaceholderContainer" runat="server">
                                    <td id="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>
                            <EmptyDataTemplate>
                                <table id="Table1" runat="server">
                                    <tr>
                                        <td>没有找到数据
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <EmptyItemTemplate>
                                <td id="td1" runat="server" />
                            </EmptyItemTemplate>
                            <ItemTemplate>
                                <li>
                                    <asp:LinkButton ID="book1" CommandArgument='<%#Eval("book_id") %>' runat="server"
                                        CausesValidation="False" OnClick="book1_Click"><%#Eval("book_name") %></asp:LinkButton><span
                                            class="click-num">点击量：<%#Eval("visit") %></span></li>
                            </ItemTemplate>
                        </asp:ListView>
                    </ul>
                </div>
                <div style="width: 90%; text-align: center; margin-top: 5px; font-size: 16px; padding: 5px;">
                    同类推荐
                </div>
                <div class="content-right-ad">
                    <div class="product-ad">
                        <img src="images/books/书籍大图/生活百科/图片6.png" width="120" height="150"><a href="#"><span>这就是马云</span></a>
                        <div class="product-show-price">
                            <span>25元</span>
                        </div>
                    </div>
                    <div class="product-ad">
                        <img src="images/books/书籍大图/生活百科/图片9.png" width="280" height="351"><a href="#">文具手帖</a>
                        <div class="product-show-price">
                            <span>31元</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-content-left product-box">
            <div class="product-box-head">
                <div class="product-box-head-left">
                    <a href="index.aspx" style="display: inline-block; float: left; color: #000">主页></a>
                    <a href="orders.aspx" style="display: inline-block; float: left; color: #000">订单列表></a>
                    <h3 style="display: inline-block; float: left">订单号: <span><%# strShowOrderID %></span></h3>
                </div>
                <div class="clear">
                </div>
            </div>
            <div id="order-info-new">
                <div class="address">
                    <div class="addressinfo">
                        收货地址
                    </div>
                    <div class="address-province">
                        <asp:DropDownList ID="Province_List" runat="server" CssClass="address-province-select"
                            AutoPostBack="True" OnTextChanged="Province_List_TextChanged">
                        </asp:DropDownList>
                        &nbsp省
                    </div>
                    <div class="address-city">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="City_List" runat="server" CssClass="address-province-select">
                                </asp:DropDownList>
                                &nbsp市 
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Province_List" EventName="TextChanged"></asp:AsyncPostBackTrigger>
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <!--<div class="address-area">
                        <select class="address-area-select">
                            <option value="0">请选择</option>
                        </select>&nbsp区</div>-->
                    <div class="addressinfo">
                        详细地址
                    </div>
                    <div class="addressstreetinfo">
                        <asp:TextBox CssClass="addressstreetinfodetail" ID="Address" runat="server" placeholder="请在这里输入地址"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="addressrequired" runat="server" ControlToValidate="Address"
                            CssClass="failureNotification" ErrorMessage="地址是必须的." ToolTip="地址." ForeColor="#FF9900"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="contact">
                    <div class="contactinfo">
                        联系人
                    </div>
                    <div class="contactname">
                        <asp:TextBox CssClass="contactnamedetail" ID="Conactname" runat="server" placeholder="请在这里输入联系人姓名"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Conactname"
                            CssClass="failureNotification" ErrorMessage="联系人姓名是必须的." ToolTip="联系人姓名是必须的."
                            ForeColor="#FF9900"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="phone">
                    <div class="phoneinfo">
                        联系电话
                    </div>
                    <div class="phoneinfonumber">
                        <asp:TextBox CssClass="phoneinfonumberdetail" ID="Phonenumber" runat="server" placeholder="请在这里输入联系人电话"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="phonenumberrequired" runat="server" ControlToValidate="Phonenumber"
                            CssClass="failureNotification" ErrorMessage="联系人电话是必须的." ToolTip="联系人电话是必须的."
                            ForeColor="#FF9900"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="remark">
                    <div class="remarkinfo">
                        备注
                    </div>
                    <div class="remarkinfointro">
                        <asp:TextBox CssClass="remarkinfointrodetail" ID="Memo" runat="server" placeholder="请在这里输入备注"></asp:TextBox>
                    </div>
                </div>
                <ul class="booklist">
                    <asp:ListView ID="Order_unpayment" runat="server" DataKeyNames="book_id">
                        <LayoutTemplate>
                            <table id="groupPlaceholderContainer" runat="server">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </GroupTemplate>
                        <EmptyDataTemplate>
                            <table id="Table1" runat="server">
                                <tr>
                                    <td>没有找到数据
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <td id="td1" runat="server" />
                        </EmptyItemTemplate>
                        <ItemTemplate>
                            <li class="order-item">
                                <div class="book-info">
                                    <img src="<%# Eval("imgurl") %>"></img>
                                    <asp:LinkButton ID="booklink1" runat="server" CssClass="product-name" CommandArgument='<%#Eval("book_id") %>'
                                        CausesValidation="False" OnClick="booklink_Click"><%#Eval("book_name") %></asp:LinkButton>
                                    <br />
                                    <p class="subtitle">
                                        <%# Eval("profile") %>
                                    </p>
                                    <span>购买数量:<%# Eval("number") %></span>
                                    <span>单价:<%#string.Format("{0:c}", Convert.ToDecimal(Eval("price")) * Convert.ToDecimal(Eval("discount")) / 100)%></span>
                                    <span style="position: relative; margin-bottom: 0px" class="price-n">单品小计：<%# Eval("singleprice", "{0:c}")%></span>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:ListView>
                </ul>
                <div>
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="Order_unpayment" PageSize="4">
                        <Fields>
                            <asp:NextPreviousPagerField ShowPreviousPageButton="True" ShowNextPageButton="False" />
                            <asp:NumericPagerField ButtonCount="9" />
                            <asp:NextPreviousPagerField ShowPreviousPageButton="False" ShowNextPageButton="True" />
                        </Fields>
                    </asp:DataPager>
                </div>
                <div class="order-state">
                    <asp:Button ID="Payment" runat="server" Text="支付订单" Style="position: relative; float: left; margin-top: 12px; top: 0px;"
                        CssClass="productCast" OnClick="Payment_Click"></asp:Button>
                    <span style="position: relative; float: right; margin-top: 12px" class="price-n">
                        <asp:Label ID="TotalPrice" runat="server">订单总价：</asp:Label></span>
                </div>
            </div>
            <!----start-load-more-products---->
            <div class="loadmore-products">
            </div>
            <!----//End-load-more-products---->
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
