using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 在线书店;
namespace 在线书店
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
         public string strWel="";
         public string strmenu="";
        public string strShow
        {
            get
            {
                return strWel;
            }
        }
        public string MenuShow
        {
            get
            {
                return strmenu;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            MenuBind();

            strWel = "<li><a href='login.aspx'>登录</a><span> </span></li><li><a href='register.aspx'>注册</a></li>";
            if (Session["user_name"] != null)
            {
                strWel = "<li><a>" + Session["user_name"] + "</a><span> </span></li><li><a href='logout.aspx'>退出</a></li>";

            }
            Page.DataBind();


        }
        private void MenuBind() {
            DataTable menu = Category.GetCategory();
            string temp;
            foreach (DataRow drow in menu.Rows) {
                temp = "<li style=\"display: inline-block;\"><a class='color2' href=\"product.aspx?cateid=" + drow["category_id"] + "\">" + drow["category_name"] + "</a></li>";
                strmenu += temp;
            }
        }
    }
    
}