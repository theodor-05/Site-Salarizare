using System;
using System.Activities.Expressions;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdaugareAngajati : System.Web.UI.Page
{
    double cas_procent, cass_procent, impozit_procent;
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        if (string.IsNullOrWhiteSpace(Text1.Text) ||
            string.IsNullOrWhiteSpace(Text2.Text) ||
            string.IsNullOrWhiteSpace(Text3.Text) ||
            string.IsNullOrWhiteSpace(Text4.Text))
            return;

        string query = @"
        BEGIN
            INSERT INTO angajati (
                nr_crt, nume, prenume, functie, salariu_baza
            )
            VALUES (
                seq_person.NEXTVAL,
                '" + Text1.Text + @"',
                '" + Text2.Text + @"',
                '" + Text3.Text + @"',
                " + Convert.ToDouble(Text4.Text) + @"
            );

            recalc_angajati(seq_person.CURRVAL, seq_person.CURRVAL);
        END;";

        try
        {
            OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["Oracle"].ConnectionString);
            OracleCommand cmd = new OracleCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();

            Text1.Text = "";
            Text2.Text = "";
            Text3.Text = "";
            Text4.Text = "";

            GridView1.Visible = false;
        }
        catch (OracleException ex)
        {
            Console.WriteLine(ex.Message);
        }
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Afisare_Dari()
    {
        double salariu_de_baza = Convert.ToDouble(Text4.Text);
        DataTable dataTable = new DataTable();
        dataTable.Columns.Add("Total brut");
        dataTable.Columns.Add("Brut impozitabil");
        dataTable.Columns.Add("Impozit");
        dataTable.Columns.Add("CAS");
        dataTable.Columns.Add("CASS");
        dataTable.Columns.Add("Virat card");

        string query = @"
            SELECT cas_procent, cass_procent, impozit_procent
            FROM procente
            WHERE id=1
            ";

        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["Oracle"].ConnectionString);
        OracleDataReader dr;
        OracleCommand cmd = new OracleCommand(query, conn);
        conn.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read()) {
            cas_procent = Convert.ToDouble(dr["cas_procent"]);
            cass_procent = Convert.ToDouble(dr["cass_procent"]);
            impozit_procent = Convert.ToDouble(dr["impozit_procent"]);
            dr.Close();
        } else

        conn.Close();

        double total_brut = salariu_de_baza * (1 + 0 / 100) + 0; // primul 0 este spor% care este la angajare 0, al doilea este premii brute care la angajare este tot 0

        dataTable.Rows.Add(
            total_brut,
            total_brut - (total_brut * cas_procent) - (total_brut * cass_procent), // Brut Impozitabil
            (total_brut - (total_brut * cas_procent) - (total_brut * cass_procent)) * impozit_procent, // Impozit
            total_brut * cas_procent, // CAS
            total_brut * cass_procent, // CASS
            total_brut - ((total_brut - (total_brut / 4) - (total_brut / 10)) / 10) - (total_brut / 4) - (total_brut / 10) - 0 // Virat card, 0 e retinerea default 0
        );

        GridView1.DataSource = dataTable;
        GridView1.DataBind();
    }

    public Boolean CheckType(String value, Type type) // https://stackoverflow.com/questions/8122604/check-if-string-can-be-converted-to-a-given-type-in-c-sharp
    {
        try
        {
            var obj = Convert.ChangeType(value, type);
            return true;
        }
        catch (InvalidCastException)
        {
            return false;
        }
        catch (FormatException)
        {
            return false;
        }
        catch (OverflowException)
        {
            return false;
        }
        catch (ArgumentNullException)
        {
            return false;
        }
    }
    protected void Text4_TextChanged(object sender, EventArgs e)
    {
        if(CheckType(Text4.Text, typeof(double)))
        {
            Afisare_Dari();
        }
    }
}

/*
TOTAL_BRUT= SALAR_BAZA*(1+SPOR_%/100)+PREMII_BRUTE
- ce “da” angajatul spre stat:
CAS = TOTAL_BRUT* CAS_%
SANAT= TOTAL_BRUT* CASS_%
BRUT_IMPOZABIL=TOTAL_BRUT-CAS – SANAT
IMPOZIT = BRUT_IMPOZABI* IMPOZIT_%
- cu ce “ramane” angajatul:
VIRAT_CARD= TOTAL_BRUT- IMPOZIT-CAS – CASS - RETINERI
*/