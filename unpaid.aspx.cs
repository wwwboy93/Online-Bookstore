using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class unpaid : System.Web.UI.Page
{
    DataSet myDs = new DataSet();
    DataSet myDs_p = new DataSet();
    SqlDataAdapter myDa;
    string OrderID;
    DataView view = new DataView();
    DataTable table = new DataTable();
    public string strShowOrderID
    {
        get
        {
            return OrderID;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["id"] == null || Session["user_id"] == null)
            Response.Redirect("./login.aspx");
        OrderID = Request["id"].ToString();
        OrderBind();
        ListBind(OrderID);

        if (!IsPostBack)
        {
            CataBind();
        }

        Address_Table();
        DataBind();
    }

    

    public void ListBind(string id)
    {
        //string a = "20150713163744140";
        //string str1 = "select * from[book],[bookinorder],[order] where book.book_id = bookinorder.book_id and bookinorder.order_id = [order].order_id";

        myDs.Clear();
        string str1 = "select * from[book],[bookinorder],[order] where book.book_id = bookinorder.book_id and bookinorder.order_id = [order].order_id and [order].order_id = '" + id+"'";
        SqlConnection sqlcon = GetConnection();
        sqlcon.Open();
        myDa = new SqlDataAdapter(str1, sqlcon);
        myDa.Fill(myDs);
        this.Order_unpayment.DataSource = myDs;
        this.Order_unpayment.DataBind();
        this.TotalPrice.Text = "订单总价：" + Convert.ToDecimal(myDs.Tables[0].Rows[0]["totalmoney"]).ToString("0.00");
        sqlcon.Close();
    }

    public void OrderBind()
    {
        string str2 = "select top 7* from[book] order by visit desc";
        SqlConnection sqlcon = GetConnection();
        sqlcon.Open();
        myDa = new SqlDataAdapter(str2, sqlcon);
        myDa.Fill(myDs);
        this.Orderview.DataSource = myDs;
        this.Orderview.DataBind();
        sqlcon.Close();
    }



    public void CataBind()
    {
        string str = "select PName from [Province]";
        SqlConnection sqlcon = GetConnection();
        sqlcon.Open();
        myDa = new SqlDataAdapter(str, sqlcon);
        myDa.Fill(myDs_p);
        sqlcon.Close();

        ArrayList catalist = new ArrayList();
        for (int i = 0; i < myDs_p.Tables[0].Rows.Count; i++)
            catalist.Add(myDs_p.Tables[0].Rows[i]["PName"]);

        this.Province_List.DataSource = catalist;
        this.Province_List.DataBind();
        myDs_p.Clear();
    }

    public void Address_Table()
    {
        string str1 = "select PName,CName from [City],[Province] where [City].ProvinceID = [Province].ID";
        SqlConnection sqlcon = GetConnection();
        sqlcon.Open();
        myDa = new SqlDataAdapter(str1, sqlcon);
        myDa.Fill(myDs_p);
        sqlcon.Close();

        view = myDs_p.Tables[0].DefaultView;
    }

    protected void Province_List_TextChanged(object sender, EventArgs e)
    {
        view.RowFilter = "PName='" + this.Province_List.Text + "'";
        table = view.ToTable();
        ArrayList catalist = new ArrayList();

        for (int i = 0; i < table.Rows.Count; i++)
            catalist.Add(table.Rows[i]["CName"]);

        this.City_List.DataSource = catalist;
        this.City_List.DataBind();
    }









    protected void booklink_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument;
        Response.Redirect("~/details.aspx?bookid=" + id);
    }
    protected void book1_Click(object sender, EventArgs e)
    {
        string id = ((LinkButton)sender).CommandArgument;
        Response.Redirect("~/details.aspx?bookid=" + id);
    }
    /**
    protected void SearchPress_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/product.aspx?bookname=" + this.Search.Text.ToString());
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
    }*/

    protected void Payment_Click(object sender, EventArgs e)
    {
        string address = this.Province_List.Text.Trim() + this.City_List.Text.Trim() + this.Address.Text.Trim();
        string str3 = "Update [order] set ispayment=1,address='" + address + "',memo='" + this.Memo.Text + "',phone='" + this.Phonenumber.Text + "' where order_id = '" + OrderID + "'";
        SqlConnection sqlcon = GetConnection();
        sqlcon.Open();
        SqlCommand myCmd = new SqlCommand(str3, sqlcon);
        myCmd.ExecuteNonQuery();
        sqlcon.Close();
        Response.Write("<script language='JavaScript'>alert(\"支付成功，马上有书!\");</script>");
        Response.Redirect("~/paid.aspx?id="+OrderID);
    }
    public SqlConnection GetConnection()
    {
        string str = "Server=(local);User Id=sa;Pwd=123123;Database=bookstore";
        SqlConnection con = new SqlConnection(str);
        return con;
    }
    
}