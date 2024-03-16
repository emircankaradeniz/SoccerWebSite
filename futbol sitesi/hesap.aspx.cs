using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace futbol_sitesi
{
    public partial class hesap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCıkıs_Click(object sender, EventArgs e)
        {
            Session["kullaniciadi"] = null;
            Response.Redirect("~/Default.aspx");
        }
    }
}