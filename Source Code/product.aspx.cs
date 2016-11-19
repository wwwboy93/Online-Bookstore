using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class product : System.Web.UI.Page
{
    DataSet myDs = new DataSet();
    DataSet myDs1 = new DataSet();
    SqlDataAdapter myDa;
    DataView view = new DataView();
    DataTable table = new DataTable();
    string BookName;
    string CataID;
    static int[] count = new int[5];
    public string RecordCcount
    {
        get
        {
            return count[4].ToString();
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BookName = Request["bookname"];
            CataID = Request["cateid"];

            //Response.Write("<h1>" + BookName + "   fuck");
            //BookName = "";
            //CataID = "";
            OrderBind();
            ListBind();
        }
        else
        {
            OrderBind();
            view = ((DataTable)(Session["Tabletemporate"])).DefaultView;
            this.ListView_Products.DataSource = view;
            DataBind();
        }
        Page.DataBind();
    }

    public SqlConnection GetConnection()
    {
        string str = "Server=(local);User Id=sa;Pwd=123123;Database=bookstore";
        SqlConnection con = new SqlConnection(str);
        return con;
    }

    public void ListBind()
    {
        SqlConnection sqlcon = GetConnection();
        sqlcon.Open();
        string str3 = "";

        //Response.Write("<h1>" + BookName + "   fuck");
        if (BookName == null && CataID != null)
        {
            str3 = "select * from[book],[category]where book.category_id=category.category_id and book.category_id = " + CataID;
        }
        else if (CataID == null && BookName != null)
        {
            str3 = "select * from[book]where book_name like " + "'%" + BookName + "%'";
        }
        else if (CataID == null && BookName == null)
        {
            str3 = "select * from[book]";
        }

        myDa = new SqlDataAdapter(str3, sqlcon);
        myDa.Fill(myDs);

        myDs.Tables[0].Columns.Add("DisPrice", typeof(decimal));
        for (int i = 0; i < myDs.Tables[0].Rows.Count; i++)
        {
            myDs.Tables[0].Rows[i]["DisPrice"] = (Convert.ToDecimal(myDs.Tables[0].Rows[i]["price"]) * Convert.ToDecimal(myDs.Tables[0].Rows[i]["discount"]) / 100).ToString("0.00");
        }

        count[4] = myDs.Tables[0].Rows.Count;
        Session["Tabletemporate"] = myDs.Tables[0];
        this.ListView_Products.DataSource = myDs;
        DataBind();
        sqlcon.Close();
    }

    public void OrderBind()
    {
        string str2 = "select top 7* from[book] order by visit desc";
        SqlConnection sqlcon = GetConnection();
        sqlcon.Open();
        myDa = new SqlDataAdapter(str2, sqlcon);
        myDa.Fill(myDs1);
        this.Orderview.DataSource = myDs1;
        this.Orderview.DataBind();
        sqlcon.Close();
    }

    public void Order(ref int count1, string OrderName)
    {
        if (count1 == 0)
            view.Sort = OrderName + " asc";
        else
            view.Sort = OrderName + " desc";

        table = view.ToTable();
        this.ListView_Products.DataSource = table;
        DataBind();

        count1 = (count1 + 1) % 2;
    }
    protected void booklink_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument;
        Response.Redirect("~/details.aspx?bookid=" + id);
    }

    /**
    protected void SearchPress_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product.aspx?bookname=" + this.Search.Text.ToString());
    }*/

    protected void PriceUp_Click(object sender, EventArgs e)
    {
        Order(ref count[1], "DisPrice");
    }

    protected void DisCount_Click(object sender, EventArgs e)
    {
        Order(ref count[1], "discount");
    }

    protected void NewBook_Click(object sender, EventArgs e)
    {
        Order(ref count[2], "book_id");
    }

    protected void SaleCount_Click(object sender, EventArgs e)
    {
        Order(ref count[3], "sale");
    }

    protected void story_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product.aspx?cataid=1");
    }

    protected void policy_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product.aspx?cataid=6");
    }
    protected void Science_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product.aspx?cataid=3");
    }
    protected void LifeScience_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product.aspx?cataid=2");
    }
    protected void History_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product.aspx?cataid=4");
    }
    protected void Literature_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product.aspx?cataid=5");
    }

   

    protected void bookimagelink_Click(object sender, EventArgs e)
    {
        string id = ((ImageButton)sender).CommandArgument;
        Response.Redirect("~/details.aspx?bookid=" + id);
    }

    protected void ListView_Products_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        DataBind();
    }

    protected void LinkButton_add_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument;
        Hashtable hashCar;

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
                hashCar.Add(id, 1); //添加一个商品
                Session["ShopCart"] = hashCar;     //分配给用户
            }
            else
            {
                //用户已经有购物车
                hashCar = (Hashtable)Session["ShopCart"];//得到购物车的hash表
                if (hashCar.Contains(id))//购物车中已有此商品，商品数量加1
                {
                    int count = Convert.ToInt32(hashCar[id].ToString());//得到该商品的数量
                    hashCar[id] = (count + 1);//商品数量加1
                }
                else
                {
                    hashCar.Add(id, 1);
                }//如果没有此商品，则新添加一个项
            }
            Response.Write("<script language='JavaScript'>alert('商品已成功添加到购物车!');</script>");


        }
    }

}