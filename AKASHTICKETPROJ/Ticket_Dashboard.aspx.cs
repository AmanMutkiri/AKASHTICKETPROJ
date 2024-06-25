using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Net.Sockets;
using System.Web;
using System.Web.Profile;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AKASHTICKETPROJ
{
    public partial class Ticket_Dashboard : System.Web.UI.Page
    {
        TSS_CRMEntities1 db = new TSS_CRMEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {

            LoadTabData();
            //ticketIDHiddenField.Value = null;



        }

        public void LoadTabData()
        {
            using (var db = new TSS_CRMEntities1())
            {
                var tbl = (from ticket in db.tbl_Tickets
                           join user in db.tbls on ticket.RowID equals user.RowID
                           where ticket.Ticket_Status == "0"
                           select new
                           {
                               TicketID = ticket.TicketID,
                               RowID = ticket.RowID,
                               Ticket_Type = ticket.Ticket_Type,
                               Ticket_Subject = ticket.Ticket_Subject,
                               CustomerName = user.CustomerName,
                               SID = user.SID
                           }).ToList();
                Repeater1.DataSource = tbl;
                Repeater1.DataBind();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showPopup();", true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "hidePopup();", true);
            clear();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Master.aspx");
        }

        public void clear()
        {
            HiddenFieldCustomerId.Value = null;
            DropDownList1.SelectedValue = null;
            subject.Text = "";
            Description.Text = "";
            RadioButtonList1.SelectedValue = null;
            //ticketIDHiddenField.Value = null;
            customerName.Text= "";
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
            {
            // Check if TicketID hidden field is not null or empty
            if (!string.IsNullOrWhiteSpace(ticketIDHiddenField.Value))
            {
                // Parse the TicketID
                int _data1;
                if (int.TryParse(ticketIDHiddenField.Value, out _data1))
                {
                    var dt = db.tbl_Tickets.Where(x => x.TicketID == _data1).FirstOrDefault();
                    if (dt != null)
                    {
                        // Update existing ticket
                        dt.RowID = Convert.ToInt32(HiddenFieldCustomerId.Value);
                        dt.Ticket_Type = DropDownList1.SelectedValue;
                        dt.Ticket_Subject = subject.Text;
                        dt.Ticket_Description = Description.Text;
                        dt.Ticket_Status = RadioButtonList1.SelectedValue;
                        db.SaveChanges();
                        clear();
                    }
                    else
                    {
                        // Handle the case where the ticket was not found (optional)
                        Label1.Text = "Ticket not found!";
                    }
                }
                else
                {
                    // Handle the error: invalid TicketID
                    Label1.Text = "Invalid TicketID!";
                }
            }
            else
            {
                // Create a new ticket
                int _data;
                if (int.TryParse(HiddenFieldCustomerId.Value, out _data))
                {
                    tbl_Tickets tbl = new tbl_Tickets();
                    tbl.RowID = _data;
                    tbl.Ticket_Type = DropDownList1.SelectedValue;
                    tbl.Ticket_Subject = subject.Text;
                    tbl.Ticket_Description = Description.Text;
                    tbl.Ticket_Status = RadioButtonList1.SelectedValue;

                    db.tbl_Tickets.Add(tbl);
                    db.SaveChanges();
                    clear();
                }
                else
                {
                    // Handle the error: invalid RowID
                    Label1.Text = "Invalid Customer ID!";
                }
            }


        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            //// Reset the CSS classes for all LinkButtons
            LinkButtonOpen.CssClass = "nav-link";
            LinkButtonHold.CssClass = "nav-link";
            LinkButtonClose.CssClass = "nav-link";

            //// Get the clicked LinkButton and update its CSS class to active
            LinkButton clickedButton = sender as LinkButton;
            clickedButton.CssClass = "nav-link active";

            var btn = sender as LinkButton;
            if (btn.ID == "LinkButtonOpen")
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;
                using (var db = new TSS_CRMEntities1())
                {
                    var tbl = (from ticket in db.tbl_Tickets
                               join user in db.tbls on ticket.RowID equals user.RowID
                               where ticket.Ticket_Status == "0"
                               select new
                               {
                                   TicketID = ticket.TicketID,
                                   RowID = ticket.RowID,
                                   Ticket_Type = ticket.Ticket_Type,
                                   Ticket_Subject = ticket.Ticket_Subject,
                                   CustomerName = user.CustomerName,
                                   SID = user.SID
                               }).ToList();
                    Repeater1.DataSource = tbl;
                    Repeater1.DataBind();

                }
            }
            if (btn.ID == "LinkButtonHold")
            {
                Panel2.Visible = true;
                Panel1.Visible = false;
                Panel3.Visible = false;
                using (var db = new TSS_CRMEntities1())
                {

                    var tbl = (from ticket in db.tbl_Tickets
                               join user in db.tbls on ticket.RowID equals user.RowID
                               where ticket.Ticket_Status == "1"
                               select new
                               {
                                   TicketID = ticket.TicketID,
                                   RowID = ticket.RowID,
                                   Ticket_Type = ticket.Ticket_Type,
                                   Ticket_Subject = ticket.Ticket_Subject,
                                   CustomerName = user.CustomerName,
                                   SID = user.SID
                               }).ToList();


                    Repeater2.DataSource = tbl;
                    Repeater2.DataBind();

                }
            }
            if (btn.ID == "LinkButtonClose")
            {
                Panel3.Visible = true;
                Panel2.Visible = false;
                Panel1.Visible = false;
                using (var db = new TSS_CRMEntities1())
                {
                    var tbl = (from ticket in db.tbl_Tickets
                               join user in db.tbls on ticket.RowID equals user.RowID
                               where ticket.Ticket_Status == "2"
                               select new
                               {
                                   TicketID = ticket.TicketID,
                                   RowID = ticket.RowID,
                                   Ticket_Type = ticket.Ticket_Type,
                                   Ticket_Subject = ticket.Ticket_Subject,
                                   CustomerName = user.CustomerName,
                                   SID = user.SID
                               }).ToList();
                    Repeater3.DataSource = tbl;
                    Repeater3.DataBind();

                }
            }

        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            LinkButton editButton = (LinkButton)sender;
            ticketIDHiddenField.Value = editButton.CommandArgument;
            int _rowID = Convert.ToInt32(editButton.CommandArgument);
            var data = (from ticket in db.tbl_Tickets
                        join user in db.tbls on ticket.RowID equals user.RowID
                        where ticket.TicketID == _rowID
                        select new
                        {
                            RowID = ticket.RowID,
                            Ticket_Status = ticket.Ticket_Status,
                            Ticket_Description = ticket.Ticket_Description,
                            Ticket_Type = ticket.Ticket_Type,
                            Ticket_Subject = ticket.Ticket_Subject,
                            CustomerName = user.CustomerName,
                            SID = user.SID,
                            TicketID=ticket.TicketID
                        }).FirstOrDefault();
            if (data != null)
            {
                DropDownList1.SelectedValue = data.Ticket_Type;
                subject.Text = data.Ticket_Subject;
                Description.Text = data.Ticket_Description;
                RadioButtonList1.SelectedValue = data.Ticket_Status;
                customerName.Text = data.CustomerName;
                HiddenFieldCustomerId.Value = Convert.ToString(data.RowID);
                ticketIDHiddenField.Value= Convert.ToString( data.TicketID);

            }
            ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showPopup();", true);
        }

        protected void EditButton1_Click(object sender, EventArgs e)
        {
            LinkButton editButton = (LinkButton)sender;
            int _rowID = Convert.ToInt32(editButton.CommandArgument);
            ticketIDHiddenField.Value = editButton.CommandArgument;
            var data = (from ticket in db.tbl_Tickets
                        join user in db.tbls on ticket.RowID equals user.RowID
                        where ticket.TicketID == _rowID
                        select new
                        {
                            RowID = ticket.RowID,
                            Ticket_Status = ticket.Ticket_Status,
                            Ticket_Description = ticket.Ticket_Description,
                            Ticket_Type = ticket.Ticket_Type,
                            Ticket_Subject = ticket.Ticket_Subject,
                            CustomerName = user.CustomerName,
                            SID = user.SID,
                            TicketID = ticket.TicketID
                        }).FirstOrDefault();
            if (data != null)
            {
                DropDownList1.SelectedValue = data.Ticket_Type;
                subject.Text = data.Ticket_Subject;
                Description.Text = data.Ticket_Description;
                RadioButtonList1.SelectedValue = data.Ticket_Status;
                customerName.Text = data.CustomerName;
                HiddenFieldCustomerId.Value = Convert.ToString(data.RowID);
                ticketIDHiddenField.Value = Convert.ToString(data.TicketID);

            }
            ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showPopup();", true);
        }

        protected void EditButton2_Click(object sender, EventArgs e)
        {
            LinkButton editButton = (LinkButton)sender;
            int _rowID = Convert.ToInt32(editButton.CommandArgument);

            ticketIDHiddenField.Value = editButton.CommandArgument;
            var data = (from ticket in db.tbl_Tickets
                        join user in db.tbls on ticket.RowID equals user.RowID
                        where ticket.TicketID == _rowID
                        select new
                        {
                            RowID = ticket.RowID,
                            Ticket_Status = ticket.Ticket_Status,
                            Ticket_Description = ticket.Ticket_Description,
                            Ticket_Type = ticket.Ticket_Type,
                            Ticket_Subject = ticket.Ticket_Subject,
                            CustomerName = user.CustomerName,
                            SID = user.SID,
                            TicketID = ticket.TicketID
                        }).FirstOrDefault();
            if (data != null)
            {
                DropDownList1.SelectedValue = data.Ticket_Type;
                subject.Text = data.Ticket_Subject;
                Description.Text = data.Ticket_Description;
                RadioButtonList1.SelectedValue = data.Ticket_Status;
                customerName.Text = data.CustomerName;
                HiddenFieldCustomerId.Value = Convert.ToString(data.RowID);
                ticketIDHiddenField.Value = Convert.ToString(data.TicketID);

            }
            ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showPopup();", true);
        }

    }
}