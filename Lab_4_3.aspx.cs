using System;
using System.Web.UI.WebControls;

namespace Lab_M_4_1
{
    public partial class Lab4_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                int count = int.Parse(dropmain1.SelectedValue);
                addynamic(count);
            }
        }

        protected void dropmain1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int count = int.Parse(dropmain1.SelectedValue);
            addynamic(count);
        }

        private void addynamic(int count)
        {
            DynamicPanel.Controls.Clear();
            for (int i = 1; i <= count; i++)
            {
                Label lbl = new Label();    
                lbl.Text = "Label " + i + ": ";
                TextBox txt = new TextBox();
                DynamicPanel.Controls.Add(lbl);
                DynamicPanel.Controls.Add(txt);
                DynamicPanel.Controls.Add(new Literal { Text = "<br />" });
            }
        }
    }
}