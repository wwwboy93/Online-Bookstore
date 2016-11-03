<%@ Page Language="C#" Title="购物车" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="buy.aspx.cs" Inherits="在线书店.buy" %>


<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" Runat="server">
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
                <div style="width: 90%; text-align: center; margin-top: 5px; font-size: 16px; padding: 5px;">
                    同类推荐
                </div>
                <div class="content-right-ad">
                    <div class="content-right-ad">
                        <img src="images/广告3.jpg"></img>
                        <a href="#">了解更多</a>
                    </div>
                </div>
            </div>
        </div>



            <div class="product-content-left product-box">
                <div class="product-box-head">
                    <div class="product-box-head-left">
                        <a href="index.html" style="display: inline-block; float: left; color: #000">主页></a>
                        <h3 style="display: inline-block; float: left">订单 <span>(<%# nameShow%>)</span></h3>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="productList">
                    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>


                    <asp:GridView ID="gvShopCart" runat="server" AutoGenerateColumns="False" BorderColor="Black" CellPadding="0" CellSpacing="1" Font-Size="Large" ForeColor="#333333" Width="100%" CssClass="cart_table">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:ImageField DataImageUrlField="img"
                                AlternateText="图片"
                                NullDisplayText="No image on file."
                                HeaderText="封面"
                                ReadOnly="true" ControlStyle-Height="90px" ControlStyle-Width="72px" ItemStyle-VerticalAlign="Middle">

                                <ControlStyle Height="120px" Width="96px"></ControlStyle>

                            </asp:ImageField>

                            <asp:TemplateField HeaderText="名称">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkBtnDetail" CommandArgument='<%#Bind("BookID")%>' CausesValidation="false" runat="server" OnClick="lnkBtnDetail_Click" Text='<%# Bind("BookName")%>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="数量">
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CommandName="Min" CommandArgument='<%# Bind("BookID")%>' Text="-" OnClick="ButtonMin_Click" />
                                    <asp:Label ID="LabelNum" runat="server" Text='<%#Bind("Num") %>'></asp:Label>
                                    <asp:Button ID="Button2" runat="server" CommandName="Add" CommandArgument='<%# Bind("BookID")%>' Text="+" OnClick="ButtonAdd_Click" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="price" HeaderText="单价(￥)" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="discount" HeaderText="折扣" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="totalPrice" HeaderText="小计(￥)" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:TemplateField>
                                <HeaderTemplate>
                                    操作
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="DelButton" runat="server" OnClientClick="return confirm('确认要删除此商品吗？');" OnClick="Del_Click" CommandName="Delete" CommandArgument='<%# Bind("BookID")%>' Text="删除"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>




                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" Height="100px" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                </div>
                <p id="p_price" runat="server" class="totalPrice">
                    总价：<asp:Label ID="labTotalPrice" runat="server" Text="0.00"></asp:Label>

                </p>
            </div>
            <div style="float: right; width: 15%; min-height: 20px; margin-right: 50px;">

                <asp:LinkButton ID="ButtonBuy" runat="server" CssClass="buybotton" OnClick="ButtonBuy_Click">立即支付</asp:LinkButton>

            </div>
    </div>



    <div class="clear"></div>
</asp:Content>