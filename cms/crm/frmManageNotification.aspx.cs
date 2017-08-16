using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using DAL;

public partial class crm_frmManageNotification : System.Web.UI.Page
{
    AlertDAL objAlertDAL = new AlertDAL(); 

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindData();
        }  
       
    }

    private void BindData()
    {
        List<AlertInfo> lstAlertInfo = objAlertDAL.GetAllAlerts();

        Grid.DataSource = lstAlertInfo;
        Grid.DataBind();  

    }

    private void unFillAllForm()
    {

        txtAlertName.Text = string.Empty;
        rdoEmail.Checked = true;
        txtDays.Text = string.Empty;


        txtFromDate.Value = string.Empty;
        txtToDate.Value = string.Empty;

        chkBoxResponsibleUser.Checked = false;

        chkBoxManager.Checked = false;
        chkBoxApprovingAuthority.Checked = false;
        chkBoxOther.Checked = false;

        rdoDaily.Checked = false;

        hdnAlertId.Value = string.Empty; 
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        AlertInfo objAlertInfo = new AlertInfo();

        string AlertName = txtAlertName.Text;
        objAlertInfo.AlertName = AlertName;

        string AlertType = string.Empty;

        List<string> lstAudience = new List<string>();

        if (rdoEmail.Checked)
        {
            AlertType = "Email";
        }

        if (rdoSMS.Checked)
        {
            AlertType = "SMS";
        }

        if (rdoBoth.Checked)
        {
            AlertType = "Both";
        }

        objAlertInfo.AlertType = AlertType;

        string ApplicabilityRule = string.Empty;
        

        if (rdoBefore.Checked)
        {
            ApplicabilityRule = "Before";
        }

        if (rdoAfter.Checked)
        {
            ApplicabilityRule = "After";
        }

        objAlertInfo.ApplicabilityRule = ApplicabilityRule;
        string dueDays = txtDays.Text;
        objAlertInfo.DueDays = dueDays;
        DateTime AlertValidityFrom = Convert.ToDateTime(txtFromDate.Value);
        DateTime AlertValidityTo = Convert.ToDateTime(txtToDate.Value);

        objAlertInfo.AlertValidityFrom = AlertValidityFrom;
        objAlertInfo.AlertValidityTo = AlertValidityTo;


        if (chkBoxResponsibleUser.Checked)
        {
            lstAudience.Add("Responsible User");
        }

        if (chkBoxManager.Checked)
        {
            lstAudience.Add("Manager");
        }

        if (chkBoxApprovingAuthority.Checked)
        {
            lstAudience.Add("Approving Authority");
        }

        if (chkBoxOther.Checked)
        {
            lstAudience.Add("Other");
        }

        objAlertInfo.Audience = lstAudience;

        string Schedule = string.Empty;

        if (rdoDaily.Checked)
        {
            Schedule = "Daily";
        }

        if (rdoWeekly.Checked)
        {
            Schedule = "Weekly";
        }

        if (rdoMonthly.Checked)
        {
            Schedule = "Monthly";
        }

        if (rdoYearly.Checked)
        {
            Schedule = "Yearly";
        }

        objAlertInfo.Schedule = Schedule;

        int insertId = 0;

        if (!string.IsNullOrEmpty(hdnAlertId.Value))
        {
            objAlertInfo.AlterId = Convert.ToInt16(hdnAlertId.Value);
            objAlertDAL.UpdateAlert(objAlertInfo);
        }
        else
        {
            objAlertDAL.AddAlert(objAlertInfo);
        }
        unFillAllForm();
        BindData(); 
    }

    protected void Grid_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        int AlterId = (int)Grid.DataKeys[(int)e.Item.ItemIndex];
        if (AlterId > 0)
        {
            objAlertDAL.DeleteAlert(AlterId);
            BindData();
        }
    }

    protected void Grid_EditCommand(object source, DataGridCommandEventArgs e)
    {
        unFillAllForm();
        int AlterId = (int)Grid.DataKeys[(int)e.Item.ItemIndex];
        if (AlterId > 0)
        {
             AlertInfo objAlertInfo = objAlertDAL.GetAlertsInfoById(AlterId);
            

             txtAlertName.Text = objAlertInfo.AlertName;

             if (objAlertInfo.AlertType == "Email")
             {
                 rdoEmail.Checked = true;
             }

             if (objAlertInfo.AlertType == "SMS")
             {
                  rdoSMS.Checked = true;
             }

             if (objAlertInfo.AlertType == "Both")
             {
                  rdoBoth.Checked = true;
             }
            txtDays.Text = objAlertInfo.DueDays;
             string ApplicabilityRule = string.Empty;

             

             if (objAlertInfo.ApplicabilityRule == "Before")
             {
                 rdoBefore.Checked = true;
             }

             if (objAlertInfo.ApplicabilityRule == "After")
             {
                 rdoAfter.Checked = true;
             }  

             

             txtFromDate.Value = objAlertInfo.AlertValidityFrom.ToString("MM/dd/yyy");
             txtToDate.Value = objAlertInfo.AlertValidityTo.ToString("MM/dd/yyy");


             if (objAlertInfo.Audience.Count > 0)
             {
                 foreach (string item in objAlertInfo.Audience)
                 {
                     if (item == "Responsible User")
                     {
                         chkBoxResponsibleUser.Checked = true;
                     }

                     if (item == "Manager")
                     {
                         chkBoxManager.Checked = true;
                     }

                     if (item == "Approving Authority")
                     {
                         chkBoxApprovingAuthority.Checked = true;
                     }

                     if (item == "Other")
                     {
                         chkBoxOther.Checked = true;
                     }
                     
                 }
             } 


             if (objAlertInfo.Schedule == "Daily")
             {
                 rdoDaily.Checked = true;
             }

             if (objAlertInfo.Schedule == "Weekly")
             {
                 rdoWeekly.Checked = true;
             }

             if (objAlertInfo.Schedule == "Monthly")
             {
                 rdoMonthly.Checked = true;
             }

             if (objAlertInfo.Schedule == "Yearly")
             {
                 rdoYearly.Checked = true;
             }

             hdnAlertId.Value = objAlertInfo.AlterId.ToString(); 
             btnSave.Visible = false;
             btnUpdate.Visible = true; 
        }
    } 
}