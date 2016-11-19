<%@ Page Language="C#" AutoEventWireup="true" Inherits="_details" MasterPageFile="~/MasterPage.Master"
    EnableEventValidation="false" MaintainScrollPositionOnPostback="True" CodeBehind="details.aspx.cs" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content details-page">
        <!---start-product-details--->
        <div class="product-details">
            <div class="wrap">
                <ul class="product-head">
                    <li><a href="index.aspx">首页</a> &gt;<span></span></li>
                    <li class="active-page"><a href="#">图书详情</a></li>
                    
                </ul>
                <!----details-product-slider--->
                <!-- Include the Etalage files -->
                <link rel="stylesheet" href="css/etalage.css"/>
                <script src="js/jquery.etalage.min.js"></script>
                <!-- Include the Etalage files -->
                <script>
                    jQuery(document).ready(function ($) {

                        $('#etalage').etalage({
                            thumb_image_width: 300,
                            thumb_image_height: 400,
                            source_image_width: 900,
                            source_image_height: 1000,
                            show_hint: true,
                            click_callback: function (image_anchor, instance_id) {
                                alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                            }
                        });
                        // This is for the dropdown list example:
                        $('.dropdownlist').change(function () {
                            etalage_show($(this).find('option:selected').attr('class'));
                        });

                    });
                </script>
                <!----//details-product-slider--->
                <div class="details-left">
                    <div class="details-left-slider">
                        <ul id="etalage">
                            <!------------------------------------------数据库绑定-----图片---评分---购买量---价格------------------------------>
                            <li>
                                <img runat="server" class="etalage_thumb_image" src="<%#strShowBookImg %>" /><!--<asp:Image ID=book_id ImageUrl=>--->
                                <img runat="server" class="etalage_source_image" src="<%#strShowBookImg %>" /><!--<asp:Image ID=book_id ImageUrl=>--->
                            </li>
                        </ul>
                    </div>
                    <div class="details-left-info">
                        <div class="details-right-head" style="padding-left: 20px">
                            <h1>
                                <asp:Label ID="book_name" runat="server" Text='<%#strShowBookname%>'></asp:Label></h1>
                            <h2>
                                <span>
                                    <asp:Label ID="Author_Label" runat="server" Text='<%# strShowBookauthor %>'></asp:Label></span>
                                著</h2>
                            <h2>
                                <asp:Label ID="Label12" runat="server" Text='<%# strShowBooksupplier %>'></asp:Label></h2>
                            <p class="product-detail-info">
                                <asp:Label ID="Label13" runat="server" Text='<%# strShowBookprofile %>'></asp:Label>
                            </p>
                            <!--跳转后格式改变-->
                            <a class="learn-more" href="#001">浏览更多详情</a>
                            <div class="product-more-details">
                                <ul class="price-avl">
                                    <li class="price"><span>
                                        <asp:Label ID="Label4" runat="server">￥<%#strShowBookprice%></asp:Label></span><label>￥<%#strShowBookdiscount%></label></li>
                                    <div class="clear">
                                    </div>
                                </ul>
                                <ul class="prosuct-qty">
                                    <span>请输入购买数量:</span>
                                    <asp:TextBox type="text" Text="1" ID="txtY_Revenue" CssClass="txt" runat="server" Width="10%" MaxLength="6">
                                    </asp:TextBox>
                                    <li class="stock"><i>
                                        <%#strShowBookstock%>件 库存</i></li>
                                </ul>
                                <asp:Button id="AddCartBtn" runat="server" Text="加入购物车" OnClick="AddCartBtn_Click"/>
                            </div>
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="details-right">
                    <a href="#">了解更多</a>
                </div>
                <div class="clear">
                </div>
            </div>
            <!----product-rewies---->
            <div name="detail" class="product-reviwes">
                <div class="wrap">
                    <!--vertical Tabs-script-->
                    <!---responsive-tabs---->
                    <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#horizontalTab').easyResponsiveTabs({
                                type: 'default', //Types: default, vertical, accordion           
                                width: 'auto', //auto or any width like 600px
                                fit: true,   // 100% fit in a container
                                closed: 'accordion', // Start closed if in accordion view
                                activate: function (event) { // Callback function if tab is switched
                                    var $tab = $(this);
                                    var $info = $('#tabInfo');
                                    var $name = $('span', $info);
                                    $name.text($tab.text());
                                    $info.show();
                                }
                            });

                            $('#verticalTab').easyResponsiveTabs({
                                type: 'vertical',
                                width: 'auto',
                                fit: true
                            });
                        });
                    </script>
                    <!---//responsive-tabs---->
                    <!--//vertical Tabs-script-->
                    <!--vertical Tabs-->
                    <div id="verticalTab">
                        <ul class="resp-tabs-list">
                            <li>图书描述</li>
                            <li>图书评价</li>
                        </ul>
                        <div class="resp-tabs-container vertical-tabs">
                            <div>
                                <a class="learn-more" style="font-size: 1.5em; font-weight: 500;">商品细节</a>
                                <p style="font-size: 1.5em;">
                                    <asp:Label ID="Label5" runat="server" Text='<%#strShowBookdetail%>'></asp:Label>
                                </p>
                            </div>
                            <div>
                                <div>
                                    <h3>用户评论</h3>

                                    <div class="comments">
                                        <asp:ListView ID="Comment_List" runat="server" DataKeyNames="comm_id">
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
                                                <div class="comment">
                                                    <span><%#Eval("user_name") %>(<%#Eval("comm_date") %>)</span><p>
                                                        <%#Eval("comm_detail") %>
                                                    </p>
                                                    <div class="rating5">
                                                        <%#Eval("score") %>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </div>


                                    <asp:TextBox ID="Comment_input" runat="server" placeholder="请输入您的评价" />
                                    <asp:DropDownList ID="RateSelect" runat="server" />
                                    <asp:Button ID="submit" runat="server" OnClick="submit_Click" Text="提交评论" />


                                </div>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <!--- start-similar-products--->
                        <div class="similar-products">
                            <div class="similar-products-right">
                                <!-- start content_slider -->
                                <!--- start-rate---->
                                <script src="js/jstarbox.js"></script>
                                <link rel="stylesheet" href="css/jstarbox.css" type="text/css" media="screen" charset="utf-8" />
                                <script type="text/javascript">
                                    jQuery(function () {
                                        jQuery('.starbox').each(function () {
                                            var starbox = jQuery(this);
                                            starbox.starbox({
                                                average: starbox.attr('data-start-value'),
                                                changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
                                                ghosting: starbox.hasClass('ghosting'),
                                                autoUpdateAverage: starbox.hasClass('autoupdate'),
                                                buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
                                                stars: starbox.attr('data-star-count') || 5
                                            }).bind('starbox-value-changed', function (event, value) {
                                                if (starbox.hasClass('random')) {
                                                    var val = Math.random();
                                                    starbox.next().text(' ' + val);
                                                    return val;
                                                }
                                            })
                                        });
                                    });
                                </script>
                                <!---//End-rate---->
                                <!----//End-img-cursual---->
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                        <!--- //End-similar-products--->
                    </div>
                </div>
                <div class="clear">
                </div>
                <!--//vertical Tabs-->
                <!----//product-rewies---->
                <!---//End-product-details--->
            </div>
        </div>
        </div>
        <!---- start-bottom-grids---->
</asp:Content>
