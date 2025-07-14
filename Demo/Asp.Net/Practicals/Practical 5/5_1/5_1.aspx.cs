using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab_5
{
    public partial class _5_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void chksports_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in chksports.Items)
            {
                lblresult.Text = String.Empty;

                if (item.Selected)
                {
                    lblresult.Text += item.Text + "<br />";
                }
            }
        }
    }
}