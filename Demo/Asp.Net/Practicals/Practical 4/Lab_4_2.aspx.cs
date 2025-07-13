using System;
using System.Xml.Linq;

namespace WebCalc
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            var dob = calDOB.SelectedDate.Date;

            lblOutput.Text = $"<br/>Name: {name}<br/>Email: {email}<br/>Date of Birth: {dob}";
        }

        protected void lnkReset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtEmail.Text = "";
            calDOB.SelectedDates.Clear();
            lblOutput.Text = "";
        }
    }
}
