using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using myDB;
namespace 在线书店
{
    public partial class index : System.Web.UI.Page
    {
        DataSet myDs = new DataSet();
        DataView view = new DataView();
        SqlDataAdapter myDa;

        protected void Page_Load(object sender, EventArgs e)
        {
            Selectorder();
        }

        /**public SqlConnection GetConnection()
        {
            string str = "Server=(local);User Id=sa;Pwd=123;Database=bookstore";
            SqlConnection con = new SqlConnection(str);
            return con;
        }*/

        public void Selectorder()
        {
            view.Table = Getordertable("sale");

            this.bookhot1.Text = view.Table.Rows[0]["book_name"].ToString();
            this.hot_book_1.ImageUrl = view.Table.Rows[0]["imgurl"].ToString();
            this.bookhotintroduce1.Text = view.Table.Rows[0]["profile"].ToString();
            this.bookhotprice1.Text = Convert.ToDecimal(view.Table.Rows[0]["price"]).ToString("0.00");
            this.bookhot1.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[0]["book_id"];
            this.bookhotdetail1.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[0]["book_id"];
            this.bookhotimage1.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[0]["book_id"];

            this.hot_book_2.ImageUrl = view.Table.Rows[1]["imgurl"].ToString();
            this.bookhot2.Text = view.Table.Rows[1]["book_name"].ToString();
            this.bookhotintroduce2.Text = view.Table.Rows[1]["profile"].ToString();
            this.bookhotprice2.Text = Convert.ToDecimal(view.Table.Rows[1]["price"]).ToString("0.00");
            this.bookhot2.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[1]["book_id"];
            this.bookhotdetail2.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[1]["book_id"];
            this.bookhotimage2.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[1]["book_id"];

            this.hot_book_3.ImageUrl = view.Table.Rows[2]["imgurl"].ToString();
            this.bookhot3.Text = view.Table.Rows[2]["book_name"].ToString();
            this.bookhotintroduce3.Text = view.Table.Rows[2]["profile"].ToString();
            this.bookhotprice3.Text = Convert.ToDecimal(view.Table.Rows[2]["price"]).ToString("0.00");
            this.bookhot3.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[2]["book_id"];
            this.bookhotdetail3.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[2]["book_id"];
            this.bookhotimage3.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[2]["book_id"];

            this.hot_book_4.ImageUrl = view.Table.Rows[3]["imgurl"].ToString();
            this.bookhot4.Text = view.Table.Rows[3]["book_name"].ToString();
            this.bookhotintroduce4.Text = view.Table.Rows[3]["profile"].ToString();
            this.bookhotprice4.Text = Convert.ToDecimal(view.Table.Rows[3]["price"]).ToString("0.00");
            this.bookhot4.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[3]["book_id"];
            this.bookhotdetail4.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[3]["book_id"];
            this.bookhotimage4.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[3]["book_id"];

            myDs.Clear();
            view.Table = Getordertable("visit");

            this.pop_book_1.ImageUrl = view.Table.Rows[0]["imgurl"].ToString();
            this.bookpop1.Text = view.Table.Rows[0]["book_name"].ToString();
            this.bookpopintroduce1.Text = view.Table.Rows[0]["profile"].ToString();
            this.bookpopprice1.Text = Convert.ToDecimal(view.Table.Rows[0]["price"]).ToString("0.00");
            this.bookpop1.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[0]["book_id"];
            this.bookpopdetail1.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[0]["book_id"];
            this.bookpopimage1.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[0]["book_id"];

            this.pop_book_2.ImageUrl = view.Table.Rows[1]["imgurl"].ToString();
            this.bookpop2.Text = view.Table.Rows[1]["book_name"].ToString();
            this.bookpopintroduce2.Text = view.Table.Rows[1]["profile"].ToString();
            this.bookpopprice2.Text = Convert.ToDecimal(view.Table.Rows[1]["price"]).ToString("0.00");
            this.bookpop2.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[1]["book_id"];
            this.bookpopdetail2.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[1]["book_id"];
            this.bookpopimage2.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[1]["book_id"];

            this.pop_book_3.ImageUrl = view.Table.Rows[2]["imgurl"].ToString();
            this.bookpop3.Text = view.Table.Rows[2]["book_name"].ToString();
            this.bookpopintroduce3.Text = view.Table.Rows[2]["profile"].ToString();
            this.bookpopprice3.Text = Convert.ToDecimal(view.Table.Rows[2]["price"]).ToString("0.00");
            this.bookpop3.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[2]["book_id"];
            this.bookpopdetail3.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[2]["book_id"];
            this.bookpopimage3.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[2]["book_id"];

            this.pop_book_4.ImageUrl = view.Table.Rows[3]["imgurl"].ToString();
            this.bookpop4.Text = view.Table.Rows[3]["book_name"].ToString();
            this.bookpopintroduce4.Text = view.Table.Rows[3]["profile"].ToString();
            this.bookpopprice4.Text = Convert.ToDecimal(view.Table.Rows[3]["price"]).ToString("0.00");
            this.bookpop4.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[3]["book_id"];
            this.bookpopdetail4.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[3]["book_id"];
            this.bookpopimage4.PostBackUrl = "~/details.aspx?bookid=" + view.Table.Rows[3]["book_id"];
        }

        public DataTable Getordertable(string orderid)
        {
            string str2 = "select top 4* from[book] order by " + orderid + " desc";
            SqlConnection sqlcon = DBclass.GetConnection();
            sqlcon.Open();
            myDa = new SqlDataAdapter(str2, sqlcon);
            myDa.Fill(myDs);
            sqlcon.Close();

            return myDs.Tables[0];
        }

        

    }
}