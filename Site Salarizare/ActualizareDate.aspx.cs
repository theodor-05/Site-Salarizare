using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ActualizareDate : System.Web.UI.Page
{
    string all_query = "SELECT * FROM angajati ORDER BY nr_crt";
    OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["Oracle"].ConnectionString);
    OracleDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            Print_All();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string query;
            if(String.IsNullOrWhiteSpace(TextBox1.Text) && String.IsNullOrWhiteSpace(TextBox2.Text))
                query = "SELECT * FROM angajati ORDER BY nr_crt";
            else if(String.IsNullOrWhiteSpace(TextBox1.Text) && !String.IsNullOrWhiteSpace(TextBox2.Text)) 
                query = "SELECT * FROM angajati WHERE nr_crt=" + TextBox1.Text + " ORDER BY nr_crt";
            else if (!String.IsNullOrWhiteSpace(TextBox1.Text) && String.IsNullOrWhiteSpace(TextBox2.Text))
                query = "SELECT * FROM angajati WHERE nr_crt=" + TextBox1.Text + " ORDER BY nr_crt";
            else
                query = "SELECT * FROM angajati WHERE nr_crt=" + TextBox1.Text + " AND nume='" + TextBox2.Text + "' ORDER BY nr_crt";
            da = new OracleDataAdapter(query, conn);
            conn.Open();
            ds = new DataSet();
            da.Fill(ds, "angajat");

            if (ds.Tables[0].Rows.Count == 0)
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                Label1.Text = "Angajatul căutat nu există!";
            }
            else
            {
                GridView1.DataSource = ds.Tables["angajat"].DefaultView;
                GridView1.DataBind();
                Label1.Text = "!!!COLOANELE GALBENE SUNT READ ONLY!!!";
            }

            conn.Close();

        }
        catch (OracleException ex)
        {
            Console.WriteLine(ex.Message);
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Print_All();
    }

    protected void Print_All()
    {
        try
        {
            da = new OracleDataAdapter(all_query, conn);
            conn.Open();
            ds = new DataSet();
            da.Fill(ds, "angajat");

            if (ds.Tables[0].Rows.Count == 0)
            {
                Label1.Text = "Nu există angajați!";
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = ds.Tables["angajat"].DefaultView;
                GridView1.DataBind();
                Label1.Text = "!!!COLOANELE GALBENE SUNT READ ONLY!!!";
            }

            conn.Close();
        }
        catch (OracleException ex)
        {
            Console.WriteLine(ex.Message);
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        Print_All();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        Print_All();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}