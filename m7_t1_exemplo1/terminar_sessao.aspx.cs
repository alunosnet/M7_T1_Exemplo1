﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace m7_t1_exemplo1
{
    public partial class terminar_sessao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //terminar sessão
            Session.Clear();
            //redirecionar
            Response.Redirect("index.aspx");
        }
    }
}