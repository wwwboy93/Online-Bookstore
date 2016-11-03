<%@ Page Language="C#" Title="有书网----打造新的概念书店" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="在线书店.index" %>


<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">

    <div class="img-slider">
        <div class="wrap">
            <ul id="jquery-demo">
                <li>
                    <a href="#slide1">
                        <img src="images/books/3f7b7df6218546c9723659003531fab0.jpg" alt="" />
                    </a>
                    <div class="slider-detils">
                        <h3>一位平凡女子的
                            <label>非凡人生</label></h3>
                        <span>答案很长,我准备用一生的时间来回答,你准备要听了吗?</span>
                        <a class="slide-btn" href="./details.aspx?bookid=43">点击购买</a>
                    </div>
                </li>
                <li>
                    <a href="#slide2">
                        <img src="images/books/马云大图.jpg" alt="" />
                    </a>
                    <div class="slider-detils">
                        <h3>马云唯一认可的 
			    	  <label>官方传记</label></h3>
                        <span>这个世界不是因为你能做什么,而是你该做什么</span>
                        <a class="slide-btn" href="./details.aspx?bookid=32">点击购买</a>
                    </div>
                </li>
                <li>
                    <a href="#slide3">
                        <img src="images/books/互联网_大图.jpg" alt="" />
                    </a>
                    <div class="slider-detils">
                        <h3>一本书带你走进
                            <label>互联网+</label></h3>
                        <span>一本书看清当下经济的风口，顺势而为抓住新时期的机遇。新常态的新引擎！ </span>
                        <a class="slide-btn" href="./details.aspx?bookid=34">点击购买</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
    <!----//End-image-slider---->
    <!----start-price-rage--->

    <!----//End-price-rage--->

    <!--- start-content
		---->
    <div class="content">
        <div class="wrap" style="height: 50px">

            <div class="section-left">
                <h1>热门畅销</h1>

            </div>
            <div class="section-right">
                <h1>人气新晋</h1>
            </div>

        </div>
        <div class="wrap">
            <div class="content-left">
                <div class="product-grids">
                    <div class="product-grid fade">
                        <div class="product-pic">
                            <a>
                                <asp:LinkButton ID="bookhotimage1" runat="server">
                                    <asp:Image ID="hot_book_1" runat="server" />
                                </asp:LinkButton>
                            </a>
                            <p>
                                <a><small>
                                    <asp:LinkButton ID="bookhot1" runat="server">这就是马云</asp:LinkButton></small></a>
                                <span>
                                    <asp:Label ID="bookhotintroduce1" runat="server">Men's Firm-Ground Football Boot</asp:Label></span>
                            </p>
                        </div>
                        <div class="product-info">
                            <div class="product-info-cust">
                                <a>
                                    <asp:LinkButton ID="bookhotdetail1" runat="server">查看详情</asp:LinkButton></a>
                            </div>
                            <div class="product-info-price">
                                <a>
                                    <asp:Label ID="bookhotprice1" runat="server">0元</asp:Label></a>
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                        <div class="more-product-info">
                        </div>
                    </div>
                    <div class="product-grid fade">
                        <div class="product-pic">
                            <a>
                                <asp:LinkButton ID="bookhotimage2" runat="server">
                                    <asp:Image ID="hot_book_2" runat="server" />
                                </asp:LinkButton>
                            </a>
                            <p>
                                <a><small>
                                    <asp:LinkButton ID="bookhot2" runat="server">这就是马云</asp:LinkButton></small></a>
                                <span>
                                    <asp:Label ID="bookhotintroduce2" runat="server">Men's Firm-Ground Football Boot</asp:Label></span>
                            </p>
                        </div>
                        <div class="product-info">
                            <div class="product-info-cust">
                                <a>
                                    <asp:LinkButton ID="bookhotdetail2" runat="server">查看详情</asp:LinkButton></a>
                            </div>
                            <div class="product-info-price">
                                <a>
                                    <asp:Label ID="bookhotprice2" runat="server">0元</asp:Label></a>
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                    <div class="product-grid fade">
                        <div class="product-pic">
                            <a>
                                <asp:LinkButton ID="bookhotimage3" runat="server">
                                    <asp:Image ID="hot_book_3" runat="server" />
                                </asp:LinkButton></a>
                            <p>
                                <a><small>
                                    <asp:LinkButton ID="bookhot3" runat="server">这就是马云</asp:LinkButton></small>
                                </a><span>
                                    <asp:Label ID="bookhotintroduce3" runat="server">Men's Firm-Ground Football Boot</asp:Label></span>
                            </p>
                        </div>
                        <div class="product-info">
                            <div class="product-info-cust">
                                <a>
                                    <asp:LinkButton ID="bookhotdetail3" runat="server">查看详情</asp:LinkButton></a>
                            </div>
                            <div class="product-info-price">
                                <a>
                                    <asp:Label ID="bookhotprice3" runat="server">0元</asp:Label></a>
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                        <div class="more-product-info">
                        </div>
                    </div>
                    <div class="product-grid fade">
                        <div class="product-pic">
                            <a>
                                <asp:LinkButton ID="bookhotimage4" runat="server">
                                    <asp:Image ID="hot_book_4" runat="server" />
                                </asp:LinkButton></a>
                            <p>
                                <a><small>
                                    <asp:LinkButton ID="bookhot4" runat="server">这就是马云</asp:LinkButton></small>
                                </a><span>
                                    <asp:Label ID="bookhotintroduce4" runat="server">Men's Firm-Ground Football Boot</asp:Label></span>
                            </p>
                        </div>
                        <div class="product-info">
                            <div class="product-info-cust">
                                <a>
                                    <asp:LinkButton ID="bookhotdetail4" runat="server">查看详情</asp:LinkButton></a>
                            </div>
                            <div class="product-info-price">
                                <a>
                                    <asp:Label ID="bookhotprice4" runat="server">0元</asp:Label></a>
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                        <div class="more-product-info">
                        </div>
                    </div>
                </div>
                <a class="viewmore" href="./product.aspx">浏览更多经典</a>
            </div>
            <div class="content-center">
                <span>VS</span>
            </div>
            <div class="content-right">
                <div class="product-grids">
                    <div class="product-grid fade">
                        <div class="product-pic">
                            <a>
                                <asp:LinkButton ID="bookpopimage1" runat="server">
                                    <asp:Image ID="pop_book_1" runat="server" />

                                </asp:LinkButton>

                            </a>
                            <p>
                                <a><small>
                                    <asp:LinkButton ID="bookpop1" runat="server">这就是马云</asp:LinkButton></small></a>
                                <span>
                                    <asp:Label ID="bookpopintroduce1" runat="server">Men's Firm-Ground Football Boot</asp:Label></span>
                            </p>
                        </div>
                        <div class="product-info">
                            <div class="product-info-cust">
                                <a>
                                    <asp:LinkButton ID="bookpopdetail1" runat="server">查看详情</asp:LinkButton></a>
                            </div>
                            <div class="product-info-price">
                                <a>
                                    <asp:Label ID="bookpopprice1" runat="server">0元</asp:Label></a>
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                        <div class="more-product-info">
                        </div>
                    </div>
                    <div class="product-grid fade">
                        <div class="product-pic">
                            <a>
                                <asp:LinkButton ID="bookpopimage2" runat="server">
                                    <asp:Image ID="pop_book_2" runat="server" />

                                </asp:LinkButton>

                            </a>
                            <p>
                                <a><small>
                                    <asp:LinkButton ID="bookpop2" runat="server">这就是马云</asp:LinkButton></small></a>
                                <span>
                                    <asp:Label ID="bookpopintroduce2" runat="server">Men's Firm-Ground Football Boot</asp:Label></span>
                            </p>
                        </div>
                        <div class="product-info">
                            <div class="product-info-cust">
                                <a>
                                    <asp:LinkButton ID="bookpopdetail2" runat="server">查看详情</asp:LinkButton></a>
                            </div>
                            <div class="product-info-price">
                                <a>
                                    <asp:Label ID="bookpopprice2" runat="server">0元</asp:Label></a>
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                        <div class="more-product-info">
                        </div>
                    </div>
                    <div class="product-grid fade ">
                        <div class="product-pic">
                            <a>
                                <asp:LinkButton ID="bookpopimage3" runat="server">
                                    <asp:Image ID="pop_book_3" runat="server" />

                                </asp:LinkButton>

                            </a>
                            <p>
                                <a><small>
                                    <asp:LinkButton ID="bookpop3" runat="server">这就是马云</asp:LinkButton></small></a>
                                <span>
                                    <asp:Label ID="bookpopintroduce3" runat="server">Men's Firm-Ground Football Boot</asp:Label></span>
                            </p>
                        </div>
                        <div class="product-info">
                            <div class="product-info-cust">
                                <a>
                                    <asp:LinkButton ID="bookpopdetail3" runat="server">查看详情</asp:LinkButton></a>
                            </div>
                            <div class="product-info-price">
                                <a>
                                    <asp:Label ID="bookpopprice3" runat="server">0元</asp:Label></a>
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                        <div class="more-product-info">
                        </div>
                    </div>
                    <div class="product-grid fade">
                        <div class="product-pic">
                            <a>
                                <asp:LinkButton ID="bookpopimage4" runat="server">
                                    <asp:Image ID="pop_book_4" runat="server" />

                                </asp:LinkButton>

                            </a>
                            <p>
                                <a><small>
                                    <asp:LinkButton ID="bookpop4" runat="server">这就是马云</asp:LinkButton></small></a>
                                <span>
                                    <asp:Label ID="bookpopintroduce4" runat="server">Men's Firm-Ground Football Boot</asp:Label></span>
                            </p>
                        </div>
                        <div class="product-info">
                            <div class="product-info-cust">
                                <a>
                                    <asp:LinkButton ID="bookpopdetail4" runat="server">查看详情</asp:LinkButton></a>
                            </div>
                            <div class="product-info-price">
                                <a>
                                    <asp:Label ID="bookpopprice4" runat="server">0元</asp:Label></a>
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                        <div class="more-product-info">
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <a href="./product.aspx" class="viewmore">浏览更多新书</a>
            </div>
            <div class="clear">
            </div>
        </div>
</asp:Content>

