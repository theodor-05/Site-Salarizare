using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Configuration;

public partial class CalculSalarii : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string query = @"
            BEGIN
                recalc_angajati(1, 999999);
            END;";
        try
        {
            OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["Oracle"].ConnectionString);
            OracleCommand cmd = new OracleCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            Label1.Text = "Toate salariile au fost recalculate cu succes!";
            GridView1.DataBind();
            conn.Close();

        }
        catch (OracleException ex) {
            Label1.Text = "EroareȘ:" + ex;
        }
    }
}