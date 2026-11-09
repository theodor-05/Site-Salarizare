using OracleInternal.Secure.Network; 
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Visible = false;
        string query = @"
            SELECT nume
            FROM app_users
            WHERE nume = '" + TextBox1.Text + "'";
        try
        {
            OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["Oracle"].ConnectionString);
            OracleDataReader dr;
            OracleCommand cmd = new OracleCommand(query, conn);
            conn.Open();
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                TextBox1.Text = "";
                Label1.Text = "Un utilizator cu acest nume există deja!";
                Label1.Visible = true;
            }
            else
            {
                using (System.Security.Cryptography.SHA256 sha256 = System.Security.Cryptography.SHA256.Create())
                {
                    byte[] hash = sha256.ComputeHash(Encoding.UTF8.GetBytes(TextBox2.Text));
                    query = @"
                        INSERT INTO app_users (id, nume, parola_hash)
                        VALUES (seq_users.NEXTVAL, '" + TextBox1.Text + @"', '" + Convert.ToBase64String(hash) + @"')";
                }
                cmd.CommandText = query;
                cmd.ExecuteNonQuery();
                Session["utilizator"] = TextBox1.Text;
                Response.Redirect("~/Home.aspx");
            }
            conn.Close();
        }
        catch (Exception ex)
        {
            Label1.Visible = true;
            Label1.Text = ex.Message;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
}