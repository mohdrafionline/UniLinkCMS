using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class AlertDAL
    {


        #region Public Methods

        public int AddAlert(AlertInfo objAlertInfo)
        {
            SqlParameter[] parms = GetAddAlertParameters();
            parms[0].Value = objAlertInfo.AlertName;
            parms[1].Value = objAlertInfo.AlertType;
            parms[2].Value = objAlertInfo.ApplicabilityRule;
            parms[3].Value = objAlertInfo.DueDays;
            parms[4].Value = objAlertInfo.AlertValidityFrom;
            parms[5].Value = objAlertInfo.AlertValidityTo;


            string AudienceString = string.Empty;

            if (objAlertInfo.Audience.Count > 0)
            {
                for (int i = 0; i < objAlertInfo.Audience.Count; i++)
                {
                    AudienceString = AudienceString + objAlertInfo.Audience[i] + ",";                    
                }
            }

            if(!string.IsNullOrEmpty(AudienceString))
            {
                AudienceString = AudienceString.Substring(0, AudienceString.Length - 1);
            }

            parms[6].Value = AudienceString;
            parms[7].Value = objAlertInfo.Schedule;
            parms[8].Value = DateTime.Now;
            parms[9].Value = DateTime.Now;

            try
            {

                SqlHelper.ExecuteNonQuery(ConfigInfo.CmsConnectionString, CommandType.StoredProcedure, "AddAlert", parms);
                return 1;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return 0;
        }

        public void DeleteAlert(int AlertId)
        {
            SqlParameter[] parms = GetDeleteAlertParameters();
            parms[0].Value = AlertId;

            try
            {

                SqlHelper.ExecuteNonQuery(ConfigInfo.CmsConnectionString, CommandType.StoredProcedure, "DeleteAlert", parms);
               
            }
            catch (Exception ex)
            {
                throw ex;
            } 
        }

        public int UpdateAlert(AlertInfo objAlertInfo)
        {
            SqlParameter[] parms = GetUpdateAlertParameters();
            parms[0].Value = objAlertInfo.AlertName;
            parms[1].Value = objAlertInfo.AlertType;
            parms[2].Value = objAlertInfo.ApplicabilityRule;
            parms[3].Value = objAlertInfo.DueDays;
            parms[4].Value = objAlertInfo.AlertValidityFrom;
            parms[5].Value = objAlertInfo.AlertValidityTo;


            string AudienceString = string.Empty;

            if (objAlertInfo.Audience.Count > 0)
            {
                for (int i = 0; i < objAlertInfo.Audience.Count; i++)
                {
                    AudienceString = AudienceString + objAlertInfo.Audience[i] + ",";
                }
            }

            if (!string.IsNullOrEmpty(AudienceString))
            {
                AudienceString = AudienceString.Substring(0, AudienceString.Length - 1);
            }

            parms[6].Value = AudienceString;
            parms[7].Value = objAlertInfo.Schedule;
            parms[8].Value = DateTime.Now;
            parms[9].Value = objAlertInfo.AlterId;

            try
            {
                SqlHelper.ExecuteNonQuery(ConfigInfo.CmsConnectionString, CommandType.StoredProcedure, "UpdateAlert", parms);
                return 1;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return 0;
        }

        

        public List<AlertInfo> GetAllAlerts()
        {
            List<AlertInfo> lstAlertInfo = null;
            SqlDataReader reader = null;

            try
            {
                reader = SqlHelper.ExecuteReader(ConfigInfo.CmsConnectionString, CommandType.StoredProcedure, "GetAllAlerts", null);

                if (reader.HasRows)
                {
                    lstAlertInfo = new List<AlertInfo>();
                    while (reader.Read())
                    {
                        AlertInfo objAlertInfo = new AlertInfo();

                        objAlertInfo.AlterId = Convert.ToInt32(reader["AlterId"]);
                        objAlertInfo.AlertName = Convert.ToString(reader["AlertName"]);
                        objAlertInfo.AlertType = Convert.ToString(reader["AlertType"]);
                        objAlertInfo.ApplicabilityRule = Convert.ToString(reader["ApplicabilityRule"]);
                        objAlertInfo.DueDays= Convert.ToString(reader["DueDays"]);
                        objAlertInfo.AlertValidityFrom = Convert.ToDateTime(reader["AlertValidityFrom"]);
                        objAlertInfo.AlertValidityTo = Convert.ToDateTime(reader["AlertValidityTo"]);

                        List<string> lstAudience = null;
                         
                        if(!string.IsNullOrEmpty(Convert.ToString(reader["Audience"])))
                        {
                             lstAudience = Convert.ToString(reader["Audience"]).Split(',').ToList();
                            
                        }


                        objAlertInfo.Audience = lstAudience;
                        objAlertInfo.Schedule = Convert.ToString(reader["Schedule"]);
                        objAlertInfo.CreatedDate = Convert.ToDateTime(reader["CreatedDate"]);
                        objAlertInfo.UpdatedDate = Convert.ToDateTime(reader["UpdatedDate"]);

                        lstAlertInfo.Add(objAlertInfo);
                    }
                }

            }
            finally
            {
                if (reader != null)
                    reader.Close();
            }


            return lstAlertInfo;
        }

        public AlertInfo GetAlertsInfoById(int AlertId)
        {
            AlertInfo objAlertInfo = null;
            SqlDataReader reader = null;

            SqlParameter[] parms = GetDeleteAlertParameters();
            parms[0].Value = AlertId;

            try
            {
                reader = SqlHelper.ExecuteReader(ConfigInfo.CmsConnectionString, CommandType.StoredProcedure, "GetAlertsInfoById", parms);

                if (reader.HasRows)
                {
                    objAlertInfo = new AlertInfo();

                        reader.Read();
                        objAlertInfo.AlterId = Convert.ToInt32(reader["AlterId"]);
                        objAlertInfo.AlertName = Convert.ToString(reader["AlertName"]);
                        objAlertInfo.AlertType = Convert.ToString(reader["AlertType"]);
                        objAlertInfo.ApplicabilityRule = Convert.ToString(reader["ApplicabilityRule"]);
                        objAlertInfo.DueDays = Convert.ToString(reader["DueDays"]);
                        objAlertInfo.AlertValidityFrom = Convert.ToDateTime(reader["AlertValidityFrom"]);
                        objAlertInfo.AlertValidityTo = Convert.ToDateTime(reader["AlertValidityTo"]);

                        List<string> lstAudience = null;

                        if (!string.IsNullOrEmpty(Convert.ToString(reader["Audience"])))
                        {
                            lstAudience = Convert.ToString(reader["Audience"]).Split(',').ToList();

                        }


                        objAlertInfo.Audience = lstAudience;
                        objAlertInfo.Schedule = Convert.ToString(reader["Schedule"]);
                        objAlertInfo.CreatedDate = Convert.ToDateTime(reader["CreatedDate"]);
                        objAlertInfo.UpdatedDate = Convert.ToDateTime(reader["UpdatedDate"]); 
                   
                }

            }
            finally
            {
                if (reader != null)
                    reader.Close();
            }


            return objAlertInfo;
        }
        #endregion


        #region Private Methods

        private SqlParameter[] GetDeleteAlertParameters()
        {
            SqlParameter[] parms ={
                                     new SqlParameter("@AlterId",SqlDbType.Int)
                                  };
            return parms;
        }

        private SqlParameter[] GetUpdateAlertParameters()
        {
            SqlParameter[] parms ={
                                     new SqlParameter("@AlertName",SqlDbType.VarChar),
                                     new SqlParameter("@AlertType",SqlDbType.VarChar),
                                     new SqlParameter("@ApplicabilityRule",SqlDbType.VarChar),
                                     new SqlParameter("@DueDays",SqlDbType.VarChar),
                                     new SqlParameter("@AlertValidityFrom",SqlDbType.Date),
                                     new SqlParameter("@AlertValidityTo",SqlDbType.Date),
                                     new SqlParameter("@Audience",SqlDbType.VarChar),
                                     new SqlParameter("@Schedule",SqlDbType.VarChar),                                      
                                     new SqlParameter("@UpdatedDate",SqlDbType.DateTime),
                                     new SqlParameter("@AlterId",SqlDbType.Int)
                                  };
            return parms;
        }

        private SqlParameter[] GetAddAlertParameters()
        {
            SqlParameter[] parms ={
                                     new SqlParameter("@AlertName",SqlDbType.VarChar),
                                     new SqlParameter("@AlertType",SqlDbType.VarChar),
                                     new SqlParameter("@ApplicabilityRule",SqlDbType.VarChar),
                                      new SqlParameter("@DueDays",SqlDbType.VarChar),
                                     new SqlParameter("@AlertValidityFrom",SqlDbType.Date),
                                     new SqlParameter("@AlertValidityTo",SqlDbType.Date),
                                     new SqlParameter("@Audience",SqlDbType.VarChar),
                                     new SqlParameter("@Schedule",SqlDbType.VarChar),
                                     new SqlParameter("@CreatedDate",SqlDbType.DateTime),
                                     new SqlParameter("@UpdatedDate",SqlDbType.DateTime)
                                  };
            return parms;
        }

        #endregion
    }
}
