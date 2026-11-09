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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Visible = false;
        string parola = "";
        string query = @"
            SELECT nume, parola_hash
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
                parola = Convert.ToString(dr["parola_hash"]);

                using (SHA256 sha256 = SHA256.Create())
                {
                    byte[] hash = sha256.ComputeHash(Encoding.UTF8.GetBytes(TextBox2.Text));

                    if (parola != Convert.ToBase64String(hash))
                    {
                        Label1.Text = "Parola introdusa este gresita!";
                        Label1.Visible = true;
                    }
                    else
                    {
                        Session["utilizator"] = TextBox1.Text;
                        Response.Redirect("~/Home.aspx");
                    }
                }
            } else {
                TextBox1.Text = "";
                Label1.Text = "Utilizatorul cu acest nume nu exista!";
                Label1.Visible = true;
            }
        }
        catch (Exception ex)
        {
            Label1.Visible = true;
            Label1.Text = ex.Message;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Register.aspx");
    }
}