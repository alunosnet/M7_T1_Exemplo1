using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace m7_t1_exemplo1
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_DataBound(object sender, EventArgs e)
        {
            //login com sucesso?
            if (DetailsView1.Rows.Count > 0)
            {
                //guardar dados da sessão
                Session["nome"] = DetailsView1.Rows[0].Cells[1].Text;
                Session["perfil"] = DetailsView1.Rows[1].Cells[1].Text;
                Session["nprocesso"] = DetailsView1.Rows[2].Cells[1].Text;
                //esconder div login
                div_login.Visible = false;
            }
        }
    }
}