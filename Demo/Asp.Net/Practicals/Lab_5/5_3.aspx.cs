using System;

namespace Lab_5
{
    public partial class _5_3 : System.Web.UI.Page
    {
        protected void btnsub_Click(object sender, EventArgs e)
        {
            string title = txtbktitle.Text;
            double price = Convert.ToDouble(txtbkprice.Text);
            int qty = Convert.ToInt32(txtbkcount.Text);

            double disc = 0;    
            if (qty <= 10) disc = 5;
            else if (qty <= 25) disc = 10;
            else if (qty <= 50) disc = 12;
            else if (qty <= 100) disc = 15;
            else disc = 20;

            double total = price * qty;
            double final = total - (total * disc / 100);

            lboutput.Items.Clear();
            lboutput.Items.Add("Title: " + title);
            lboutput.Items.Add("Price: ₹" + price);
            lboutput.Items.Add("Qty: " + qty);
            lboutput.Items.Add("Discount: " + disc + "%");
            lboutput.Items.Add("Final: ₹" + final);
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            txtbktitle.Text = "";
            txtbkprice.Text = "";
            txtbkcount.Text = "";
            lboutput.Items.Clear();
        }
    }
}
