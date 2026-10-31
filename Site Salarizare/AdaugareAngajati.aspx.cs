using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class AdaugareAngajati : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Afisare_Dari();
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

        double total_brut = salariu_de_baza * (1 + 0 / 100) + 0; // primul 0 este spor% care este la angajare 0, al doilea este premii brute care la angajare este tot 0

        dataTable.Rows.Add(
            total_brut,
            total_brut - (total_brut / 4) - (total_brut / 10), // Brut Impozitabil
            total_brut / 10, // Impozit
            total_brut / 4, // CAS
            total_brut / 10, // CASS
            total_brut - (total_brut / 4) - (total_brut / 10) - (total_brut / 10) // Virat card
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