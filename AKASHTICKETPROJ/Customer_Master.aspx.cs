using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AKASHTICKETPROJ
{
    public partial class Customer_Master : System.Web.UI.Page
    {
        TSS_CRMEntities1 db = new TSS_CRMEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            Repeater1.DataSource = db.tbls.ToList();
            Repeater1.DataBind();
        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            var _SID = txtSID.Text;

            // Check if SID is provided
            if (string.IsNullOrWhiteSpace(_SID))
            {
                ValidationSID.Visible = true;
                ValidationSID.Text = "Enter SID";
                return;
            }

            try
            {
                var _rowID =hiddenRowID.Value;
                if (!string.IsNullOrWhiteSpace(_rowID)) 
                {
                    int _data =Convert.ToInt32(_rowID);
                    var existingRecord = db.tbls.FirstOrDefault(x => x.RowID == _data);
              
                    // Update existing record
                    existingRecord.CustomerName = txtCustomerName.Text;
                    existingRecord.CustomerArea = txtCustomerArea.Text;
                    existingRecord.CustomerAddress = txtCustomerAddress.Text;
                    existingRecord.CustomerContactPerson = txtCustomerContactPerson.Text;
                    existingRecord.CostomerMobile = txtCustomerMobile.Text;
                    existingRecord.Referral = txtReferral.Text;

                    db.SaveChanges();
                    hiddenRowID.Value = null;
                }
                else
                {
                    ValidationSID.Text = "";
                    // Insert new record
                    tbl tb = new tbl();
                    tb.SID = _SID;
                    tb.CustomerName = txtCustomerName.Text;
                    tb.CustomerArea = txtCustomerArea.Text;
                    tb.CustomerAddress = txtCustomerAddress.Text;
                    tb.CustomerContactPerson = txtCustomerContactPerson.Text;
                    tb.CostomerMobile = txtCustomerMobile.Text;
                    tb.Referral = txtReferral.Text;

                    db.tbls.Add(tb);
                    db.SaveChanges();
                    hiddenRowID.Value = null;
                }

                // Clear fields and reload the page
                cleard();
                Page_Load(sender, e);
            }
            catch (Exception ex)
            {
               
                 Response.Write(ex.ToString()); 
                
            }
        }



        void cleard()
        {
            txtSID.Text = "";
            txtCustomerName.Text = "";
            txtCustomerArea.Text = "";
            txtCustomerAddress.Text = "";
            txtCustomerContactPerson.Text = "";
            txtCustomerMobile.Text = "";
            txtReferral.Text = "";
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showPopup();", true);
            // Find the button that triggered the event
            LinkButton editButton = (LinkButton)sender;

            // Retrieve the RowID from the CommandArgument
            int rowID = Convert.ToInt32(editButton.CommandArgument);

            var data = db.tbls.Where(x => x.RowID == rowID).FirstOrDefault();
            if (data != null)
            {
                txtSID.Text = data.SID;
                txtCustomerName.Text = data.CustomerName;
                txtCustomerArea.Text = data.CustomerArea;
                txtCustomerAddress.Text = data.CustomerAddress;
                txtCustomerContactPerson.Text = data.CustomerContactPerson;
                txtCustomerMobile.Text = data.CostomerMobile;
                txtReferral.Text = data.Referral;
                hiddenRowID.Value = Convert.ToString(data.RowID);
            }
        }

        protected void RemoveButton_Click(object sender, EventArgs e)
        {
            LinkButton removeButton = (LinkButton)sender;

            // Retrieve the RowID from the CommandArgument
            int rowID = Convert.ToInt32(removeButton.CommandArgument);

            db.tbls.Remove(db.tbls.FirstOrDefault(x => x.RowID == rowID));
            db.SaveChanges();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showPopup();", true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "hidePopup();", true);
            cleard();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ticket_Dashboard.aspx");
        }
    }
}