using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace m7_t1_exemplo1
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //verificar se existe o cookie
            HttpCookie cookie = Request.Cookies["aviso"] as HttpCookie;
            if (cookie != null)
            {
                //esconder o aviso
                div_aviso.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //criar um cookie
            HttpCookie cookie = new HttpCookie("aviso","mostrado");
            //definir o prazo de validade do cookie
            cookie.Expires = DateTime.Now.AddYears(1);
            //enviar cookie para o cliente
            Response.Cookies.Add(cookie);
            //esconder o aviso
            div_aviso.Visible = false;
        }
    }
}