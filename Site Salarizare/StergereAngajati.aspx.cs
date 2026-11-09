using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StergereAngajati :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["utilizator"] == null)
            Response.Redirect("~/Login.aspx");
    }

    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Label1.Text = "Angajatul a fost șters!";
    }
}