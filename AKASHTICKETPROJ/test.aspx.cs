using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AKASHTICKETPROJ
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Click(object sender, EventArgs e)
        {
            // Button click logic goes here
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showPopup();", true);
        }
    }
}