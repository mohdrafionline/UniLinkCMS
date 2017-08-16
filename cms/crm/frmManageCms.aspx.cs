using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class crm_frmManageCms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            if (Request.QueryString["cid"] != null)
            {
                FillCompliancebyID();
            }
        }
    }

    public DataTable getCompliance()
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbString"].ConnectionString);
        conn.Open();

        string query = "select * from [compliance]";
        SqlDataAdapter adp = new SqlDataAdapter(query, conn);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        return ds.Tables[0];

    }

    public void FillCompliancebyID()
    {
        if (Request.QueryString["cid"] != null)
        {

            DataSet ds = new DataSet();

            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbString"].ConnectionString);
            conn.Open();

            string query = "select * from [compliance] where compliance_id=" + Request.QueryString["cid"].ToString();
            SqlDataAdapter adp = new SqlDataAdapter(query, conn);

            adp.Fill(ds);

            if (ds.Tables.Count > 0)
            {

                if (ds.Tables[0].Rows.Count > 0)
                {



                    string resCenter = ds.Tables[0].Rows[0]["resp_center"].ToString();

                    if (resCenter.Contains("/"))
                    {
                        string[] d = resCenter.Split('/');

                        foreach (string value in d)
                        {

                            if (value == "NO")
                            {
                                txtRespCenterNO.Checked = true;
                            }
                            if (value == "Village")
                            {
                                txtRespCenterVillage.Checked = true;
                            }
                            if (value == "ZO")
                            {
                                txtRespCenterZO.Checked = true;
                            }
                        }

                    }
                    else
                    {
                        if (resCenter == "NO")
                        {
                            txtRespCenterNO.Checked = true;
                        }
                        if (resCenter == "Village")
                        {
                            txtRespCenterVillage.Checked = true;
                        }
                        if (resCenter == "ZO")
                        {
                            txtRespCenterZO.Checked = true;
                        }
                    }

                    try
                    {
                        foreach (ListItem value in chkct.Items)
                        {
                            if (value.Value == ds.Tables[0].Rows[0]["comp_type"].ToString().Replace(" ", "").ToString())
                            {
                                chkct.SelectedValue = ds.Tables[0].Rows[0]["comp_type"].ToString().Replace(" ", "").ToString();
                            }
                        }

                        // chkct.SelectedValue = ds.Tables[0].Rows[0]["comp_type"].ToString().Replace(" ", "").ToString();
                    }
                    catch (Exception ex)
                    {

                    }

                    try
                    {

                        foreach (ListItem value in drpDept.Items)
                        {
                            if (value.Value == ds.Tables[0].Rows[0]["department"].ToString().Replace(" ", "").ToString())
                            {
                                drpDept.SelectedValue = ds.Tables[0].Rows[0]["department"].ToString().Replace(" ", "").ToString();
                            }
                        }



                    }
                    catch (Exception ex)
                    {

                    }




                    try
                    {

                        foreach (ListItem value in chkperiodicaly.Items)
                        {
                            if (value.Value == ds.Tables[0].Rows[0]["periodicity"].ToString().Replace(" ", "").ToString())
                            {
                                chkperiodicaly.SelectedValue = ds.Tables[0].Rows[0]["periodicity"].ToString().Replace(" ", "").ToString();
                            }
                        }


                        // chkperiodicaly.SelectedValue = ds.Tables[0].Rows[0]["periodicity"].ToString().Replace(" ", "").ToString();
                    }
                    catch (Exception ex)
                    {

                    }



                    txtAthority.Text = "";



                    chkApplicable.SelectedValue = "No";


                    txtComplianceDesc.Text = ds.Tables[0].Rows[0]["comp_desc"].ToString().Replace(" ", "").ToString();

                    // txtTaskDueDate.Text = ds.Tables[0].Rows[0]["due_dt"].ToString().Replace(" ", "").ToString();

                    if (ds.Tables[0].Rows[0]["target_dt"].ToString() != "" || ds.Tables[0].Rows[0]["target_dt"].ToString().Replace(" ", "").ToString() != "")
                    {

                        txtTaskTargetDate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["target_dt"]).ToString("MM-dd-yyyy");
                    }


                    if (ds.Tables[0].Rows[0]["due_dt"].ToString() != "" || ds.Tables[0].Rows[0]["due_dt"].ToString().Replace(" ", "").ToString() != "")
                    {
                        txtTaskDueDate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["due_dt"]).ToString("MM-dd-yyyy");
                    }


                    txtTaskPanelty.Text = ds.Tables[0].Rows[0]["amount_payable"].ToString().Replace(" ", "").ToString();

                    txtApprovedby.Text = ds.Tables[0].Rows[0]["approving_authority"].ToString().Replace(" ", "").ToString();


                    txtApprovedON.Text = "";

                    txtApprovedDesc.Text = "";


                    txtTimeline.Text = ds.Tables[0].Rows[0]["timeline"].ToString().Replace(" ", "").ToString(); ;


                }
            }
        }
        




    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/crm/frmManageCms.aspx");
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {

        string resp_center="", comp_type = "", comp_desc = "", timeline = "", periodicity = "", department = "", approving_authority = "", task = "", amount_payable = "";

        

        if (txtRespCenterNO.Checked)
        {
            resp_center = "NO/";
        }
        if (txtRespCenterVillage.Checked)
        {
            resp_center = resp_center  +  "Village/";
        }
        if (txtRespCenterZO.Checked)
        {
            resp_center = resp_center + "ZO/";


        }
        resp_center = resp_center.Trim('/');

        comp_type = chkct.SelectedValue;

        comp_desc = txtComplianceDesc.Text;

        timeline = txtTimeline.Text;

        periodicity = chkperiodicaly.SelectedValue;

        department = drpDept.SelectedValue;

        approving_authority = txtApprovedby.Text;
        task = "";

        //if (txtTaskDueDate.Text == "")
        //{
        //    due_dt = DBNull.Value;

        //}
        

        amount_payable = txtTaskPanelty.Text;

        string dbquery = "resp_center='" + resp_center + "',comp_type='" + comp_type + "',comp_desc='" + comp_desc + "',timeline='" + timeline + "',periodicity='" + periodicity + "',department=' " + department + "',approving_authority='" + approving_authority + "'";

            if (txtTaskDueDate.Text == "")
        {
            dbquery = dbquery + ",due_dt=" + DBNull.Value;
           
        }
        else
        {
            dbquery = dbquery + ",due_dt='" + DateTime.Parse(txtTaskDueDate.Text).ToString("MM-dd-yyyy") + "'";
        }

        if (txtTaskTargetDate.Text == "")
        {
            dbquery = dbquery + ",target_dt=" + DBNull.Value;
        }
        else
        {
            dbquery = dbquery + ",target_dt='" + DateTime.Parse(txtTaskTargetDate.Text).ToString("MM-dd-yyyy") + "'";
        }

        if (txtTaskPanelty.Text == "")
        {
            dbquery = dbquery + ",amount_payable=" + DBNull.Value;
        }
        else
        {
            dbquery = dbquery + ",amount_payable=" + txtTaskPanelty.Text;
        }
        
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbString"].ConnectionString);
        conn.Open();

        string query;
        if (Request.QueryString["cid"] != null)
        {

            query = "update compliance set  " + dbquery + " where compliance_id=" + Request.QueryString["cid"].ToString();
        }
        else
        {
            dbquery = "";

            if (txtTaskDueDate.Text == "")
            {
                dbquery = dbquery + ",NULL";

            }
            else
            {
                dbquery = dbquery + ",'" + DateTime.Parse(txtTaskDueDate.Text).ToString("MM-dd-yyyy") + "'";
            }

            if (txtTaskTargetDate.Text == "")
            {
                dbquery = dbquery + ",NULL";
            }
            else
            {
                dbquery = dbquery + ",'" + DateTime.Parse(txtTaskTargetDate.Text).ToString("MM-dd-yyyy") + "'";
            }

            if (txtTaskPanelty.Text == "")
            {
                dbquery = dbquery + ",NULL";
            }
            else
            {
                dbquery = dbquery + "," + txtTaskPanelty.Text;
            }



            query = " insert into compliance(resp_center,comp_type,comp_desc,timeline,periodicity,department,approving_authority,due_dt,target_dt,amount_payable) values(" + "'" + resp_center + "','" + comp_type + "','" + comp_desc + "','" + timeline + "','" + periodicity + "',' " + department + "','" + approving_authority + "'" + dbquery + ")";
        }
       
        SqlCommand  adp = new SqlCommand(query, conn);

        adp.ExecuteNonQuery();
        Response.Redirect("~/crm/frmManageCms.aspx");

    }

    public DateTime? DOJ
    {
        get;
        set;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/crm/frmManageCms.aspx");
    }
}