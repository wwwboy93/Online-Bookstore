using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using myDB;
using System.Collections;
public partial class _details : System.Web.UI.Page
{
    int book_id;


    protected void Page_Load(object sender, EventArgs e)
    {

        int Receivedbookid = Convert.ToInt32(Request["bookid"]);
        if (Request["bookid"] == null)
            Response.Redirect("./product.aspx");
        
        book_id = Receivedbookid;
        AddVisit();
        Comm_Bind(Receivedbookid);
        RateBind();
        DataTable dt = GetBookInfo(Receivedbookid);
        bookname = dt.Rows[0]["book_name"].ToString();
        author = dt.Rows[0]["author"].ToString();
        supplier = dt.Rows[0]["supplier"].ToString();
        profile = dt.Rows[0]["profile"].ToString();
        price = string.Format("{0:F2}", Convert.ToDouble(dt.Rows[0]["price"]));
        discount = string.Format("{0:F2}", Convert.ToDouble(dt.Rows[0]["discount"]) * 0.01 * Convert.ToDouble(dt.Rows[0]["price"]));
        stock = dt.Rows[0]["stock"].ToString();
        detail = dt.Rows[0]["detail"].ToString();
        imgurl = dt.Rows[0]["imgurl"].ToString();

        Page.DataBind();

    }

    protected void AddVisit()
    { 
        SqlConnection myConn = GetConnection();
        myConn.Open();
        string sqlStr = "update [book] set visit=visit+1 where book_id='" +book_id +"'"; ;//ispayment
        SqlCommand myCmd = new SqlCommand(sqlStr,myConn);
        myCmd.ExecuteNonQuery();

        myConn.Close();

    }






    public static SqlConnection GetConnection()
    {
        string myStr = ConfigurationManager.AppSettings["SqlConString"].ToString();//Web.Config定义连接数据库的字符串，通过此语句访问字符串
        SqlConnection myConn = new SqlConnection(myStr);
        return myConn;
    }

    public static DataTable GetBookInfo(int book_id)
    {
        SqlConnection myConn = GetConnection();
        string sqlstr = "select * from [book] where book_id=" + book_id;
        myConn.Open();
        DataSet ds = new DataSet();
        SqlDataAdapter adapt = new SqlDataAdapter(sqlstr, myConn);
        adapt.Fill(ds);
        myConn.Close();
        return ds.Tables[0];
    }
    //-------------------------------------GetbookInfo的具体方法---------------------------------------

    public string bookname;
    public string strShowBookname
    {
        get
        {
            return bookname;
        }
    }

    public string author;
    public string strShowBookauthor
    {
        get
        {
            return author;
        }
    }

    public string supplier;
    public string strShowBooksupplier
    {
        get
        {
            return supplier;
        }
    }

    public string profile;
    public string strShowBookprofile
    {
        get
        {
            return profile;
        }
    }

    public string price;
    public string strShowBookprice
    {
        get
        {
            return price;
        }
    }

    public string discount;
    public string strShowBookdiscount
    {
        get
        {
            return discount;
        }
    }

    public string stock;
    public string strShowBookstock
    {
        get
        {
            return stock;
        }
    }

    public string detail;
    public string strShowBookdetail
    {
        get
        {
            return detail;
        }
    }
    public string imgurl;
    public string strShowBookImg
    {
        get
        {
            return imgurl;
        }
    }
    //----------------------------------------------------获取评论方法-----------------------------------------------
    public static DataTable GetCommentInfo(int comm_id)
    {
        SqlConnection myConn = GetConnection();
        string sqlstr = "select * from [comment] where comm_id=" + comm_id;
        myConn.Open();
        DataSet ds1 = new DataSet();
        SqlDataAdapter adapt = new SqlDataAdapter(sqlstr, myConn);
        adapt.Fill(ds1);
        myConn.Close();
        return ds1.Tables[0];
    }

    public string comment;
    public string strShowbookcomment
    {
        get
        {
            return comment;
        }
    }
    //------------------------------------进行评分具体方法---------------------------------------------
    /**protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton1.Checked == true)
        {
            this.Label1.Text = "非常满意";
        }

    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton2.Checked == true)
        {
            this.Label1.Text = "满意";
        }
    }
    protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton3.Checked == true)
        {
            this.Label1.Text = "一般";
        }
    }
    protected void RadioButton4_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton4.Checked == true)
        {
            this.Label1.Text = "不满意";
        }
    }
    protected void RadioButton5_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton5.Checked == true)
        {
            this.Label1.Text = "非常不满意";
        }
    }
    //---------------------------------------------提交评论和评分-----------------------------------------
    protected void ReviewAddBtn_Click(object sender, EventArgs e)
    {

        if (this.review.Text != "")
        {
            SqlConnection myConn = GetConnection();
            myConn.Open();
            //判断用户是否已选择了答案，如果没有作出选择，弹出对话框，提示用户选择答案
            if (RadioButton1.Checked == false && RadioButton2.Checked == false && RadioButton3.Checked == false && RadioButton4.Checked == false && RadioButton5.Checked == false)
            {
                Response.Write("<script>alert('请给出评分')</script>");
            }
            else
            {

                Response.Write("<script>alert('感谢您的评论')</script>");
            }
            string date = System.DateTime.Now.Date.ToString();
            string sqlStr = "insert into comment values('" + date + "',3,3,'" + review.Text.Trim() + "','" + Label1.Text + "')";
            SqlCommand myCmd = new SqlCommand(sqlStr, myConn);
            myCmd.ExecuteNonQuery();
            myConn.Close();
        }
        else
        {
            Response.Write("<script>alert('请给出您的评论')</script>");
        }
    }*/


    public void RateBind()
    {
        ArrayList ratelist = new ArrayList();
        ratelist.Add("非常满意");
        ratelist.Add("满意");
        ratelist.Add("一般");
        ratelist.Add("不满意");
        ratelist.Add("非常不满意");
        RateSelect.DataSource = ratelist;
        RateSelect.DataBind();
    }


    protected void Comm_Bind(int bookid)
    {
        SqlConnection myConn = DBclass.GetConnection();
        string sqlstr = "select * from[user],[comment] where [user].user_id = [comment].user_id and book_id="+bookid;
        //string sqlstr = "SELECT * FROM [comment] WHERE ([book_id] = " + bookid + ")";
        myConn.Open();
        DataSet ds = new DataSet();
        SqlDataAdapter adapt = new SqlDataAdapter(sqlstr, myConn);
        adapt.Fill(ds);
        myConn.Close();
        
        this.Comment_List.DataSource = ds.Tables[0].DefaultView;
        this.Comment_List.DataBind();
    }

    

    protected void submit_Click(object sender, EventArgs e)
    {
        if (Session["user_id"] == null)
            Response.Redirect("./login.aspx");
        string score = this.RateSelect.Text;
        string comm_detail = this.Comment_input.Text;
        string now = DateTime.Now.ToString();
        SqlConnection myConn = DBclass.GetConnection();
        

        string sqlstr = "insert into [comment] (comm_date,user_id,book_id,comm_detail,score) values ('" +
            now + "','" + Session["user_id"] + "','" + book_id + "','" + this.Comment_input.Text + "','" + score + "')";

        //string sqlstr = "insert into [comment](comm_date,comm_id,user_id,book_id,comm_detail)";
        //string sqlstr = "SELECT * FROM [comment] WHERE ([book_id] = " + bookid + ")";
        myConn.Open();
        SqlCommand myCmd = new SqlCommand(sqlstr, myConn);
        if (myCmd.ExecuteNonQuery() > 0)
        {
            Response.Write("<script language='JavaScript'>alert('评论成功!');</script>");
        }
        myCmd.Dispose();
        myConn.Close();



    }

    protected void AddCartBtn_Click(object sender, EventArgs e)
    {
        string id = book_id.ToString(); ;
        Hashtable hashCar;
        int num = Convert.ToInt32(this.txtY_Revenue.Text);
        if (num > Convert.ToInt32(stock))
        {
            Response.Write("<script language='JavaScript'>alert('商品库存不足!');</script>");
            return;
        }
            
        if (Session["user_id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        else
        {

            if (Session["ShopCart"] == null)
            {
                //如果用户没有分配购物车
                hashCar = new Hashtable();         //新生成一个
                hashCar.Add(id, num); //添加一个商品
                Session["ShopCart"] = hashCar;     //分配给用户
            }
            else
            {
                //用户已经有购物车
                hashCar = (Hashtable)Session["ShopCart"];//得到购物车的hash表
                if (hashCar.Contains(id))//购物车中已有此商品，商品数量加num
                {
                    int count = Convert.ToInt32(hashCar[id].ToString());//得到该商品的数量
                    hashCar[id] = (count + num);//商品数量加num
                }
                else
                {
                    hashCar.Add(id, num);
                }//如果没有此商品，则新添加一个项
            }
            Response.Write("<script language='JavaScript'>alert('商品已成功添加到购物车!');</script>");


        }
    }

}