using System;
using System.Collections.Generic;

namespace Lab_5
{
    public partial class _5_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCountries.Items.Clear();
                lblOutput.Text = "";
            }
        }

        protected void rblLanguages_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCountries.Items.Clear();
            List<string> countries = new List<string>();

            switch (rblLanguages.SelectedValue)
            {
                case "English":
                    countries.AddRange(new[] { "United States", "United Kingdom", "Australia" });
                    break;
                case "French":
                    countries.AddRange(new[] { "France", "Canada", "Belgium" });
                    break;
                case "Spanish":
                    countries.AddRange(new[] { "Spain", "Mexico", "Argentina" });
                    break;
            }
            ddlCountries.DataSource = countries;
            ddlCountries.DataBind();

            lblOutput.Text = $"You selected <b>{rblLanguages.SelectedItem.Text}</b>.";
        }

        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblLanguages.SelectedItem != null && ddlCountries.SelectedItem != null)
            {
                lblOutput.Text = $"You selected <b>{rblLanguages.SelectedItem.Text}</b> and country <b>{ddlCountries.SelectedItem.Text}</b>.";
            }
        }
    }
}