using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 在线书店
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ConfirmRegist_Click(object sender, EventArgs e)
        {

            int result = UserDB.User.Register(this.UserName.Text, this.Password.Text, this.VirtualName.Text, this.PhoneNumber.Text, this.Email.Text);
            if (result == 1)//注册成功
            {
                Response.Write("<script language='JavaScript'>alert('注册成功!');</script>");
                Response.Redirect("./index.aspx");
            }
            else if (result == -1)//注册失败，用户名已存在
            {
                Response.Write("<script language='JavaScript'>alert('用户名已存在!');</script>");
            }
            else if (result == 0)//注册失败，数据库异常
            {
            }
        }
    }
}