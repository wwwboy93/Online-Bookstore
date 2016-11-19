<%@ Page Language="C#"  MasterPageFile="~/MasterPage.Master" Title="订单详情页" AutoEventWireup="true" Inherits="paid" Codebehind="paid.aspx.cs" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" Runat="server">		

    <!--- start-content---->
    <div class="wrap">
        <div class="content product-box-main">
            <div class="product-content-right">
                <div class="content-right-top-brands">
                    <h3>
                        人气榜</h3>
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
                                    <td id="itemPlaceholder" runat="server">
                                    </td>
                                </tr>
                            </GroupTemplate>
                            <EmptyDataTemplate>
                                <table id="Table1" runat="server">
                                    <tr>
                                        <td>
                                            没有找到数据
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <EmptyItemTemplate>
                                <td id="td1" runat="server" />
                            </EmptyItemTemplate>
                            <ItemTemplate>
                                <li>
                                    <asp:LinkButton ID="booklink" CommandArgument='<%#Eval("book_id") %>' runat="server"
                                        CausesValidation="False" OnClick="booklink_Click"><%#Eval("book_name") %></asp:LinkButton><span
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
                    <h3 style="display: inline-block; float: left">
                        订单号: <span><%# strShowOrderID %></span></h3>
                </div>
                <div class="clear">
                </div>
            </div>
            <div id="order-info-old">
                <div class="address-old">
                    <div class="addressinfo-old">
                        <asp:Label ID="Address" runat="server">收货地址：</asp:Label>
                    </div>
                </div>
                <div class="contact-old">
                    <div class="contactinfo-old">
                        <asp:Label ID="ConactName" runat="server">联系人:</asp:Label>
                    </div>
                </div>
                <div class="phone-old">
                    <div class="phoneinfo-old">
                        <asp:Label ID="PhoneNumber" runat="server">联系电话:</asp:Label>
                    </div>
                </div>
                <div class="phone-old">
                    <div class="phoneinfo-old">
                        <asp:Label ID="Memo" runat="server">备注:</asp:Label>
                    </div>
                </div>
                <ul class="booklist">
                    <asp:ListView ID="Order_payment" runat="server" DataKeyNames="book_id">
                        <LayoutTemplate>
                            <table id="groupPlaceholderContainer" runat="server">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                        </GroupTemplate>
                        <EmptyDataTemplate>
                            <table id="Table1" runat="server">
                                <tr>
                                    <td>
                                        没有找到数据
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
                                     <img src="<%# Eval("imgurl") %>" />
                                    <asp:LinkButton ID="booklink1" runat="server" CssClass="product-name" CommandArgument='<%#Eval("book_id") %>'
                                        CausesValidation="False" OnClick="booklink_Click"><%#Eval("book_name") %></asp:LinkButton>
                                    <br />
                                    <p class="subtitle">
                                        <%# Eval("detail") %></p>
                                    <span>购买数量:<%# Eval("number") %></span><span>单价:<%#string.Format("{0:c}", Convert.ToDecimal(Eval("price")) * Convert.ToDecimal(Eval("discount")) / 100)%></span><span
                                        style="position: relative; margin-bottom: 0px" class="price-n">单品总价：<%# Eval("singleprice", "{0:c}")%></span></div>
                            </li>
                        </ItemTemplate>
                    </asp:ListView>
                </ul>
                <div>
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="Order_payment" PageSize="4">
                        <Fields>
                            <asp:NextPreviousPagerField ShowPreviousPageButton="True" ShowNextPageButton="False" />
                            <asp:NumericPagerField ButtonCount="9" />
                            <asp:NextPreviousPagerField ShowPreviousPageButton="False" ShowNextPageButton="True" />
                        </Fields>
                    </asp:DataPager>
                </div>
                <div class="order-state">
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