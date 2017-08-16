using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class crm_frmImportData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    //{
    //    string fileNameWithPath = Server.MapPath("~/temp/") + e.FileName.ToString();
    //    AjaxFileUpload1.SaveAs(fileNameWithPath);


    //    DataTable dt = new DataTable();
    //    dt.Columns.AddRange(new DataColumn[16] { new DataColumn("resp_center", typeof(string)),
    //                            new DataColumn("comp_type", typeof(string)),
    //                            new DataColumn("act",typeof(string)),
    //       new DataColumn("comp_desc", typeof(string)),
    //    new DataColumn("timeline", typeof(string)),
    //    new DataColumn("periodicity", typeof(string)),
    //    new DataColumn("department", typeof(string)),
    //    new DataColumn("responsible_person", typeof(string)),
    //    new DataColumn("approving_authority", typeof(string)),
    //    new DataColumn("task", typeof(string)),
    //    new DataColumn("due_dt", typeof(DateTime)),
    //    new DataColumn("target_dt", typeof(DateTime)),
    //    new DataColumn("amount_payable", typeof(Decimal)),
    //    new DataColumn("attachment_mandatory", typeof(string)),
    //    new DataColumn("acknowledgement_req", typeof(string)),
    //    new DataColumn("acknowledgement_days", typeof(Int64)),});


    //    //Read the contents of CSV file.
    //    string csvData = System.IO.File.ReadAllText(fileNameWithPath);

    //    //Execute a loop over the rows.
    //    foreach (string row in csvData.Split('\n'))
    //    {
    //        if (!string.IsNullOrEmpty(row))
    //        {
    //            dt.Rows.Add();
    //            int i = 0;

    //            //Execute a loop over the columns.
    //            foreach (string cell in row.Split(','))
    //            {
    //                dt.Rows[dt.Rows.Count - 1][i] = cell;
    //                i++;
    //            }
    //        }
    //    }


    //    string conString = ConfigurationManager.ConnectionStrings["Constring"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(conString))
    //    {
    //        using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
    //        {
    //            //Set the database table name.
    //            sqlBulkCopy.DestinationTableName = "dbo.Customers";

    //            //[OPTIONAL]: Map the DataTable columns with that of the database table
    //            sqlBulkCopy.ColumnMappings.Add("resp_center", "resp_center");
    //            sqlBulkCopy.ColumnMappings.Add("comp_type", "comp_type");
    //            sqlBulkCopy.ColumnMappings.Add("comp_catg", "comp_catg");

    //            sqlBulkCopy.ColumnMappings.Add("act", "act");
    //            sqlBulkCopy.ColumnMappings.Add("comp_desc", "comp_desc");
    //            sqlBulkCopy.ColumnMappings.Add("timeline", "timeline");

    //            sqlBulkCopy.ColumnMappings.Add("periodicity", "periodicity");
    //            sqlBulkCopy.ColumnMappings.Add("department", "department");
    //            sqlBulkCopy.ColumnMappings.Add("responsible_person", "responsible_person");

    //            sqlBulkCopy.ColumnMappings.Add("approving_authority", "approving_authority");
    //            sqlBulkCopy.ColumnMappings.Add("task", "task");
    //            sqlBulkCopy.ColumnMappings.Add("due_dt", "due_dt");

    //            sqlBulkCopy.ColumnMappings.Add("target_dt", "target_dt");
    //            sqlBulkCopy.ColumnMappings.Add("amount_payable", "amount_payable");
    //            sqlBulkCopy.ColumnMappings.Add("attachment_mandatory", "attachment_mandatory");

    //            sqlBulkCopy.ColumnMappings.Add("acknowledgement_req", "acknowledgement_req");
    //            sqlBulkCopy.ColumnMappings.Add("acknowledgement_days", "acknowledgement_days");
               
    //            con.Open();
    //            sqlBulkCopy.WriteToServer(dt);
    //            con.Close();
    //        }
    //    }


    //}

    protected void AsyncFileUpload1_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        string fileNameWithPath = Server.MapPath("~/temp/") + e.FileName.ToString();
        AsyncFileUpload1.SaveAs(fileNameWithPath);
        string extension = Path.GetExtension(fileNameWithPath);

        //DataTable dt = new DataTable();
        //dt.Columns.AddRange(new DataColumn[17] { new DataColumn("resp_center", typeof(string)),
        //                        new DataColumn("comp_type", typeof(string)),
        //                         new DataColumn("comp_catg", typeof(string)),
        //                        new DataColumn("act",typeof(string)),
        //   new DataColumn("comp_desc", typeof(string)),
        //new DataColumn("timeline", typeof(string)),
        //new DataColumn("periodicity", typeof(string)),
        //new DataColumn("department", typeof(string)),
        //new DataColumn("responsible_person", typeof(string)),
        //new DataColumn("approving_authority", typeof(string)),
        //new DataColumn("task", typeof(string)),
        //new DataColumn("due_dt", typeof(DateTime)),
        //new DataColumn("target_dt", typeof(DateTime)),
        //new DataColumn("amount_payable", typeof(Decimal)),
        //new DataColumn("attachment_mandatory", typeof(string)),
        //new DataColumn("acknowledgement_req", typeof(string)),
        //new DataColumn("acknowledgement_days", typeof(Int64))});


        ////Read the contents of CSV file.
        //string csvData = System.IO.File.ReadAllText(fileNameWithPath);

        //int rowi = 0;
        ////Execute a loop over the rows.
        //foreach (string row in csvData.Split('\n'))
        //{
        //    if (rowi != 0)
        //    {

        //    if (!string.IsNullOrEmpty(row))
        //    {
        //        dt.Rows.Add();
        //        int i = 0;

        //        //Execute a loop over the columns.
        //        foreach (string cell in row.Split(','))
        //        {
        //                if (i == 11 || i == 12)
        //                {

        //                    dt.Rows[dt.Rows.Count - 1][i] = DateTime.Now;
        //                }
        //                else if (i == 13)
        //                {
        //                    if (cell == "" || cell == "\r")
        //                    {
        //                        dt.Rows[dt.Rows.Count - 1][i] = 0;
        //                    }
        //                    else
        //                    {
        //                        dt.Rows[dt.Rows.Count - 1][i] = cell;
        //                    }

        //                }
        //                else if (i == 16)
        //                {

        //                    if (cell == ""|| cell == "\r")
        //                    {
        //                        dt.Rows[dt.Rows.Count - 1][i] = 0;
        //                    }
        //                    else
        //                    {
        //                        dt.Rows[dt.Rows.Count - 1][i] = cell;
        //                    }
        //                }
        //                else
        //                {
        //                    dt.Rows[dt.Rows.Count - 1][i] = cell;
        //                }

        //            i++;
        //        }
        //    }
        //    }
        //    rowi = rowi + 1;
        //}


        string conString = string.Empty;
        switch (extension)
        {
            case ".xls": //Excel 97-03.
                conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                break;
            case ".xlsx": //Excel 07 and above.
                conString = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
                break;
        }

        DataTable dt = new DataTable();
        conString = string.Format(conString, fileNameWithPath);

        using (OleDbConnection connExcel = new OleDbConnection(conString))
        {
            using (OleDbCommand cmdExcel = new OleDbCommand())
            {
                using (OleDbDataAdapter odaExcel = new OleDbDataAdapter())
                {
                    cmdExcel.Connection = connExcel;

                    //Get the name of First Sheet.
                    connExcel.Open();
                    DataTable dtExcelSchema;
                    dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                    string sheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
                    connExcel.Close();

                    //Read Data from First Sheet.
                    connExcel.Open();
                    cmdExcel.CommandText = "SELECT * From [" + sheetName + "]";
                    odaExcel.SelectCommand = cmdExcel;
                    odaExcel.Fill(dt);
                    connExcel.Close();
                }
            }
        }



        conString = ConfigurationManager.ConnectionStrings["dbString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
            {
                //Set the database table name.
                sqlBulkCopy.DestinationTableName = "dbo.compliance";

                //[OPTIONAL]: Map the DataTable columns with that of the database table
                sqlBulkCopy.ColumnMappings.Add(0, 1);
                sqlBulkCopy.ColumnMappings.Add(1, 2);
                sqlBulkCopy.ColumnMappings.Add(2, 3);

                sqlBulkCopy.ColumnMappings.Add(3, 4);
                sqlBulkCopy.ColumnMappings.Add(4, 5);
                sqlBulkCopy.ColumnMappings.Add(5, 6);

                sqlBulkCopy.ColumnMappings.Add(6, 7);
                sqlBulkCopy.ColumnMappings.Add(7, 8);
                sqlBulkCopy.ColumnMappings.Add(8, 9);

                sqlBulkCopy.ColumnMappings.Add(9, 10);
                sqlBulkCopy.ColumnMappings.Add(10, 11);
                sqlBulkCopy.ColumnMappings.Add(11, 12);

                sqlBulkCopy.ColumnMappings.Add(12, 13);
                sqlBulkCopy.ColumnMappings.Add(13, 14);
                sqlBulkCopy.ColumnMappings.Add(14, 15);

                sqlBulkCopy.ColumnMappings.Add(15, 16);
                sqlBulkCopy.ColumnMappings.Add(16, 17);

                con.Open();
                sqlBulkCopy.WriteToServer(dt);
                con.Close();
            }
        }

        Response.Redirect("~/crm/frmManageCms.aspx");
    }
}