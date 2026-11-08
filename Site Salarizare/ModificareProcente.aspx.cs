using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Globalization;

public partial class ModificareProcente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    string password;
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        if (string.IsNullOrWhiteSpace(Text1.Text) &&
            string.IsNullOrWhiteSpace(Text2.Text) &&
            string.IsNullOrWhiteSpace(Text3.Text))
        {
            Label1.Text = "Adaugă cel puțin un procent!";
        }
        else
        {
            string query_parola = @"
                    SELECT parola_hash
                    FROM procente
                    WHERE ID=1
                ";

            string cas_procent = Text1.Text == "" ? "NULL" : Convert.ToString(Convert.ToDouble(Text1.Text) / 100).Replace(",", ".");
            string cass_procent = Text2.Text == "" ? "NULL" : Convert.ToString(Convert.ToDouble(Text2.Text) / 100).Replace(",", ".");
            string impozit_procent = Text3.Text == "" ? "NULL" : Convert.ToString(Convert.ToDouble(Text3.Text) / 100).Replace(",", ".");

            string query_update_procente = @"
                UPDATE procente
                    SET cas_procent = NVL(" + cas_procent + @", cas_procent),
                        cass_procent = NVL(" + cass_procent + @", cass_procent),
                        impozit_procent = NVL(" + impozit_procent + @", impozit_procent)
                WHERE id=1
            ";

            try
            {
                OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["Oracle"].ConnectionString);
                OracleDataReader dr;
                OracleCommand cmd = new OracleCommand(query_parola, conn);

                conn.Open();
                dr = cmd.ExecuteReader();

                if (dr.Read())
                    password = Convert.ToString(dr["parola_hash"]);

                using (SHA256 sha256 = SHA256.Create())
                {
                    byte[] hash = sha256.ComputeHash(Encoding.UTF8.GetBytes(Text4.Text));

                    if (password == Convert.ToBase64String(hash))
                    {
                        Label1.Text = Convert.ToString((Convert.ToDouble(Text1.Text) / 100)).Replace(",", ".");
                        cmd = new OracleCommand(query_update_procente, conn);
                        cmd.ExecuteNonQuery();
                        Label1.Text = "Procentele au fost modificate cu success!";
                        Text1.Text = Text2.Text = Text3.Text = Text4.Text = "";
                    }
                    else
                    {
                        Label1.Text = "PAROLĂ GREȘITĂ!";
                        Text4.Text = "";
                    }
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
        }
    }
}