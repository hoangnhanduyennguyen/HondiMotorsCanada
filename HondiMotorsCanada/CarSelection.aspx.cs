using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace HondiMotorsCanada
{
    public partial class CarSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            panPriceResume.Visible = panFinalInfo.Visible = false;
            if (!Page.IsPostBack)
            {
                //Disable Phone Number
                txtPhone.Visible = lblPhone.Visible = false;

                //Select Car model
                cboCarModel.Items.Add(new ListItem("Civoc", "25000"));
                cboCarModel.Items.Add(new ListItem("DR-V", "30000"));
                cboCarModel.Items.Add(new ListItem("Appord", "33000"));
                cboCarModel.Items.Add(new ListItem("Cilot", "45000"));
                cboCarModel.Items.Add(new ListItem("Odyrrey", "54000"));

                //Interior Color
                lstInterColor.Items.Add(new ListItem("White", "Free"));
                lstInterColor.Items.Add(new ListItem("Dark", "300"));
                lstInterColor.Items.Add(new ListItem("Pearl", "900"));
                lstInterColor.SelectedIndex = 0;

                //Accessories
                chklstAccessories.Items.Add(new ListItem("Aero Kit", "1300"));
                chklstAccessories.Items.Add(new ListItem("Film", "600"));
                chklstAccessories.Items.Add(new ListItem("Cold Weather", "900"));
                chklstAccessories.Items.Add(new ListItem("Hondi Emblem", "150"));
                chklstAccessories.Items.Add(new ListItem("Snow Tire Package", "1800"));

                //Warranty
                radlstWarranty.Items.Add(new ListItem("3 Years", "Included"));
                radlstWarranty.Items.Add(new ListItem("5 Years", "1000"));
                radlstWarranty.Items.Add(new ListItem("7 Years", "1500"));
                radlstWarranty.SelectedIndex = 0;

            }
            if (cboCarModel.SelectedIndex > 0)
            {
                resumePrice();
            }
        }

        private void resumePrice()
        {
            decimal carPrice = 0, total = 0, color = 0, accessories = 0, warranty = 0,  subTotal = 0, tax = 0;

            carPrice = Convert.ToDecimal(cboCarModel.SelectedItem.Value);
            litPriceResume.Text = "Car Price: $ " + carPrice + "</br>";
            if (lstInterColor.SelectedIndex != 0)
            {
                color = Convert.ToDecimal(lstInterColor.SelectedItem.Value);
                litPriceResume.Text += "Interior Color: $ " + color + "</br>";
            }
            else
            {
                litPriceResume.Text += "Interior Color: " + lstInterColor.SelectedItem.Value + "</br>";
            }
            foreach (ListItem item in chklstAccessories.Items)
            {
                accessories += (item.Selected) ? Convert.ToDecimal(item.Value) : 0;
            }
            litPriceResume.Text += "Accessories: $ " + accessories + "</br>";
            if (radlstWarranty.SelectedIndex != 0)
            {
                warranty = Convert.ToDecimal(radlstWarranty.SelectedItem.Value);
                litPriceResume.Text += "Warranty: $ " + warranty + "</br></br></br>";
            }
            else
            {
                litPriceResume.Text += "Warranty: " + radlstWarranty.SelectedItem.Value + "</br></br></br>";
            }
            subTotal = carPrice + color + accessories + warranty;
            litPriceResume.Text += "Total without taxes: $ " + subTotal + "</br>";

            tax = Math.Round(subTotal * Convert.ToDecimal(0.15), 0);
            total = Math.Round(subTotal + tax, 0);
            litPriceResume.Text += "Total with taxes (15%): $ " + total + "</br></br>";

            panPriceResume.Visible = true;
        }

        protected void cboCarModel_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void chkPhoneContact_CheckedChanged(object sender, EventArgs e)
        {
            txtPhone.Visible = lblPhone.Visible = chkPhoneContact.Checked;
        }

        private bool isEmpty(string target)
        {
            return String.IsNullOrEmpty(target);
        }

        private bool IsValidZipCode(string target)
        {
            bool isValidUsOrCanadianZip = false;
            string pattern = @"^\d{5}-\d{4}|\d{5}|[A-Z]\d[A-Z] \d[A-Z]\d$";
            Regex regex = new Regex(pattern);
            return isValidUsOrCanadianZip = regex.IsMatch(target);
        }

        protected void btnConclude_Click(object sender, EventArgs e)
        {
            //Validate empty and invalid input
            if (isEmpty(txtCity.Text))
            {
                Response.Write("<script>alert('Please enter your city and click on Conlude again!')</script>");
                return;
            }
            if (isEmpty(txtZipCode.Text))
            {
                Response.Write("<script>alert('Please enter your zip code and click on Conlude again!')</script>");
                return;
            }
            if (!IsValidZipCode(txtZipCode.Text))
            {
                Response.Write("<script>alert('Please enter a valid zip code (e.g H1H 3H5) and click on Conlude again!')</script>");
                return;
            }
            litFinalInfo.Text = "Congratulation in obtain your new Hondi " + cboCarModel.SelectedItem.Text + " in " + txtCity.Text + 
                ", "+ txtZipCode.Text + ".</br></br>Your car comes with " + lstInterColor.SelectedItem.Text + " Interior Color, ";

            int selectedCount = chklstAccessories.Items.Cast<ListItem>().Count(li => li.Selected);
            if (selectedCount > 0)
            {
                string accessories = " ";
                foreach (ListItem item in chklstAccessories.Items)
                {
                    accessories += (item.Selected) ? item.Text +", " : "";
                }
                accessories = accessories.Substring(0, accessories.Length - 2);
                litFinalInfo.Text += selectedCount > 1 ? accessories + " accessories." : accessories + " accessory.";
            }
            else
            {
                litFinalInfo.Text += "without any accessory.";
            }
            litFinalInfo.Text += "</br></br>You chose " + radlstWarranty.SelectedItem.Text.Substring(0, radlstWarranty.SelectedItem.Text.Length - 5) + " years of warranty";

            if (chkPhoneContact.Checked)
            {
                if (txtPhone.Text.Trim().Count() > 0)
                {
                    litFinalInfo.Text += " and our dealer will contact you by the phone number " + txtPhone.Text + ".";
                }
                else
                {
                    Response.Write("<script>alert('Please enter your phone number and click on Conlude again!')</script>");
                }
            }
            else
            {
                litFinalInfo.Text += ".";
            }
            panFinalInfo.Visible = true;
        }
    }
}