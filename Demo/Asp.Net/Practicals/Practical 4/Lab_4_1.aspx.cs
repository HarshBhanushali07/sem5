using System;
using System.Web.UI.WebControls;

namespace WebCalc
{
    public partial class Calculator : System.Web.UI.Page
    {
        protected void Calculate(object sender, EventArgs e)
        {
            int a, b;

            // Validate first number
            bool validA = int.TryParse(txtNum1.Text.Trim(), out a);
            bool validB = int.TryParse(txtNum2.Text.Trim(), out b);

            if (!validA || !validB)
            {
                lblResult.Text = "Please enter valid numbers only.";
                return;
            }

            Button clickedBtn = (Button)sender;
            string symbol = clickedBtn.Text;
            string result = "";

            switch (symbol)
            {
                case "Add (+)":
                    result = (a + b).ToString();
                    break;
                case "Subtract (-)":
                    result = (a - b).ToString();
                    break;
                case "Multiply (*)":
                    result = (a * b).ToString();
                    break;
                case "Divide (/)":
                    result = b != 0 ? (a / b).ToString() : "Cannot divide by zero";
                    break;
                case "Modulo (%)":
                    result = b != 0 ? (a % b).ToString() : "Cannot divide by zero";
                    break;
            }

            lblResult.Text = "Result: " + result;
        }
    }
}
