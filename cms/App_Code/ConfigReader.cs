using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for ConfigReader
/// </summary>
public static class ConfigReader
{


    public static void LoadSettings()
    {
        ConfigInfo.CmsConnectionString = WebConfigurationManager.ConnectionStrings["CmsConnectionString"].ConnectionString;
    }
}