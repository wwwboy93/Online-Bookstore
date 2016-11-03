using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 在线书店
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                if (Request.UrlReferrer != null)
                    ViewState["BackUrl"] = Request.UrlReferrer.ToString();
            if (Session["user_id"] != null)
            {
                Response.Write("<script language='JavaScript'>alert('您已经登录，请不要重复登录!');</script>");
                Response.Redirect("./index.aspx");
            }


        }
        protected void ImageButton_Click(object sender, EventArgs e)
        {
            string name = this.UserName.Text;
            string psw = this.Password.Text;
            int result = UserDB.User.Login(name, psw);
            if (result > 0)
            {
                Session["user_id"] = result;
                Session["user_name"] = name;
                Session.Timeout = 4000;
                if (ViewState["BackUrl"] != null)
                    Response.Redirect(ViewState["BackUrl"].ToString());
                else
                    Response.Redirect("./index.aspx");
            } 
            else
            {
                Response.Write("<script language='JavaScript'>alert('密码错误!');</script>");
            }
        }
    }
}