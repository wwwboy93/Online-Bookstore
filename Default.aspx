<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Default.aspx.cs" Inherits="在线书店.Default" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:ListView ID="ListView_Products" runat="server" DataKeyNames="book_id" OnItemCommand="ListView_Products_ItemCommand">
            <LayoutTemplate>
                <!--指定分组容器-->
                <table id="groupPlaceholderContainer" runat="server">
                    <tr id="groupPlaceholder" runat="server"></tr>
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
                        <td>没有找到数据</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td id="td1" runat="server" />
            </EmptyItemTemplate>
            <ItemTemplate>
                <td id="td2" runat="server">
                    <table border="2" width="600">
                        <tr>
                            <td style="vertical-align: middle; text-align: right;">
                                <!--显示产品缩略图-->
                            </td>
                            <td style="width: 440px; vertical-align: middle;">
                                <span class="ProductListHead">书名：<%# Eval("book_name") %></span><!--为价格指定显示格式-->&nbsp;&nbsp;&nbsp;&nbsp;
                         <span class="ProductPrice">原价 <%# Eval("price", "{0:c}")%></span>
                                <span class="ProductNewPrice"></span>折后价 (<%#Eval("discount")%>折)</span><br />
                                <!--指定添加到购物车按钮-->

                                <span class="ProductListItem">作家:<%# Eval("author")%></span><br />
                                <span class="ProductAstraction">出版社：<%# Eval("supplier")%></span><br></br>
                                <span class="ProductAstraction">简介：<%# Eval("profile")%></span><br />
                                <span class="PrductDetail">详细描述：<%# Eval("detail")%></span><br></br>
                                <asp:ImageButton ID="imagebtnBuy" runat="server" CommandName="buy" CommandArgument='<%#Eval("book_id")%>' ImageUrl="~/images/buy.jpg" />
                            </td>
                        </tr>
                    </table>
                </td>
            </ItemTemplate>
        </asp:ListView>
        <asp:DataPager ID="DataPager1" runat="server"
            PagedControlID="ListView_Products" PageSize="4">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True"
                    ShowLastPageButton="True" ShowPreviousPageButton="True" ShowNextPageButton="True" />
            </Fields>
        </asp:DataPager>
        <a href="buy.aspx">购物车</a>
    </form>
</body>
</html>
