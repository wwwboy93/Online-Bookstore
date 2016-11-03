<%@ Page Language="C#" Title="订单页" EnableEventValidation="false" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="在线书店.orders" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">

    <div class="wrap">
        <div class="content product-box-main">

            <div class="product-content-right">
                <div class="content-right-top-brands">
                    <h3>人气榜</h3>
                    <ul style="display: block; width: 100%">
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
                        <img src="images/books/书籍大图/生活百科/图片6.png" width="120" height="150" /><a href="#"><span>这就是马云</span></a>
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
                    <a href="index.html" style="display: inline-block; float: left; color: #000">主页></a>
                    <h3 style="display: inline-block; float: left">订单 <span><%#strShow %></span></h3>

                </div>
                <div class="clear"></div>
            </div>
            <div class="product-list">
                <asp:Label ID="Label1" runat="server" />
                <asp:ListView ID="ListView_Order" runat="server" DataKeyNames="order_id">
                    <LayoutTemplate>
                        <!--指定分组容器-->
                        <ul id="groupPlaceholderContainer" runat="server">
                            <li id="groupPlaceholder" runat="server"></li>
                        </ul>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <ul id="itemPlaceholderContainer" runat="server">
                            <li id="itemPlaceholder" runat="server"></li>
                        </ul>
                    </GroupTemplate>
                    <EmptyDataTemplate>
                        <ul id="Table1" runat="server">
                            <li>
                                <p>没有订单！</p>
                            </li>
                        </ul>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <li id="td1" runat="server" />
                    </EmptyItemTemplate>

                    <ItemTemplate>

                        <ul class="selectlist" id="ul_item" runat="server">


                            <li id="Li1" class="order-item" runat="server"><a class="product-name">订单号：<%# Eval("order_id") %></a><p class="payState" style="display: block; margin-left: 19px;"><%# Eval("ispaid") %></p>
                                <span class="price-n" style="margin-right: 333px; display: block; margin-top: -23px;">订单总价：<%# Eval("totalmoney") %></span><%#Eval("check") %></li>


                        </ul>


                    </ItemTemplate>

                </asp:ListView>

            </div>
            
        </div>
        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView_Order">
        </asp:DataPager>
    </div>



    <div class="clear"></div>
    <!---- start-bottom-grids---->

</asp:Content>

