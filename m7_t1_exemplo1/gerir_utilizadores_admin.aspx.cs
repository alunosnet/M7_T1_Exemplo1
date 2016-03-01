using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace m7_t1_exemplo1
{
    public partial class gerir_utilizadores_admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //verificar se tem login e se é administrador
            if (Session["perfil"] == null || Session["perfil"].Equals("1")) 
                Response.Redirect("index.aspx");
        }
    }
}