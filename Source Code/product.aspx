<%@ Page EnableEventValidation="false" Title="搜索结果" MasterPageFile="~/MasterPage.Master" Language="C#" AutoEventWireup="true" Inherits="product" CodeBehind="product.aspx.cs" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">

    <!----//End-bottom-header---->
    <!---//End-header---->
    <!--- start-content---->
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
                <div class="content-right-ad">
                    <img src="images/广告3.jpg"></img>
                    <a href="#">了解更多</a>
                </div>
            </div>
        </div>
        <div class="product-content-left product-box">
            <div class="product-box-head">
                <div class="product-box-head-left">
                    <a href="index.aspx" style="display: inline-block; float: left; color: #000">主页></a>
                    <h3 style="display: inline-block; float: left">书籍 <span>
                        <asp:Label runat="server" ID="RecordCount">(<%# RecordCcount%>)</asp:Label></span></h3>
                </div>
                <div class="product-box-head-right">
                    <ul>
                        <li><span>排序方式:</span><a href="#"> </a></li>
                        <li>
                            <label>
                            </label>
                            <a href="#">
                                <asp:LinkButton ID="SaleCount" runat="server" Text="销量" OnClick="SaleCount_Click"></asp:LinkButton></a></li>
                        <li>
                            <label>
                            </label>
                            <a href="#">
                                <asp:LinkButton ID="NewBook" runat="server" Text="新品" OnClick="NewBook_Click"></asp:LinkButton></a></li>
                        <li>
                            <label>
                            </label>
                            <a href="#">
                                <asp:LinkButton ID="DisCount" runat="server" Text="折扣" OnClick="DisCount_Click"></asp:LinkButton></a></li>
                        <li><span>
                            <label>
                            </label>
                            <asp:LinkButton ID="PriceUp" runat="server" Text="价格" OnClick="PriceUp_Click"></asp:LinkButton></span></li>
                    </ul>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="productList">
                <asp:ListView ID="ListView_Products" runat="server" DataKeyNames="book_id" OnPagePropertiesChanging="ListView_Products_PagePropertiesChanging">
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
                        <div class="productDetailInfo">
                            <div class="productImage">
                                <asp:ImageButton ID="bookimage" runat="server" CssClass="productImageDetail" CommandArgument='<%#Eval("book_id") %>'
                                    ImageUrl='<%#Eval("imgurl") %>' OnClick="bookimagelink_Click"></asp:ImageButton>
                            </div>
                            <div class="productIntro">
                                <div class="productIntroTitle">
                                    <asp:LinkButton ID="booklink1" runat="server" CssClass="productHref" Style="color: black; display: inline-block"
                                        CommandArgument='<%#Eval("book_id") %>' CausesValidation="False"
                                        OnClick="booklink_Click"><%#Eval("book_name") %></asp:LinkButton>
                                </div>
                                <div class="productIntroAuthorPublic">
                                    <a class="authorHref">
                                        <%# Eval("author")%>
                                        /
                                        <%# Eval("supplier")%></a>
                                </div>
                                <div class="productIntroDeatil">
                                    <%# Eval("profile")%><br />
                                    <%# Eval("detail")%>
                                </div>
                                <div class="productAddBuy">
                                    <p style="display: inline-block; font-family: 'MS Serif', 'New York', serif; font-size: 16px; height: 20px; width: 80px; margin-left: 100px; text-decoration: line-through; text-align: center; padding-top: 7px">
                                        <%# Eval("price", "{0:c}")%>
                                    </p>
                                    <p style="display: inline-block; font-family: 'MS Serif', 'New York', serif; font-size: 16px; height: 20px; width: 100px; margin-left: 10px; padding-top: 7px">
                                        ¥<%# Eval("DisPrice")%>(<%#Eval("discount")%>折)
                                    </p>
                                    <p style="display: inline-block; font-family: 'MS Serif', 'New York', serif; font-size: 16px; height: 20px; width: 100px; margin-left: 10px; padding-top: 7px">
                                        销量：<%#Eval("sale") %>
                                    </p>
                                    <!--<a class="addbotton" href="#">加入购物车</a>
                                    <a class="buybotton" href="#">立即购买</a>-->

                                    <asp:LinkButton runat="server" ID="LinkButton_add" CssClass="addbotton" CommandArgument='<%#Eval("book_id") %>' CausesValidation="False" OnClick="LinkButton_add_Click">加入购物车</asp:LinkButton>


                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
        <div class="clear">
            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView_Products"
                PageSize="5">
                <Fields>
                    <asp:NextPreviousPagerField ShowPreviousPageButton="True" ShowNextPageButton="False" />
                    <asp:NumericPagerField ButtonCount="9" />
                    <asp:NextPreviousPagerField ShowPreviousPageButton="False" ShowNextPageButton="True" />
                </Fields>
            </asp:DataPager>
        </div>
    </div>
</asp:Content>
