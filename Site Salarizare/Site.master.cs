using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HtmlPage : System.Web.UI.MasterPage
{
    private int i = 0;
    private string[] img =
    {
        "~/Reclame/Reclama1.jpg",
        "~/Reclame/Reclama2.jpg",
        "~/Reclame/Reclama3.jpg",
        "~/Reclame/Reclama4.png",
        "~/Reclame/Reclama5.png"
    };

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["utilizator"] == null)
            Response.Redirect("~/Login.aspx");

        if (!IsPostBack)
        {
            if (Label1 != null)
                Label1.Text = DateTime.Now.ToString();

            if (Image1 != null)
                Image1.ImageUrl = img[0];
        }
    }
    protected void Timer1_Tick1(object sender, EventArgs e)
    {
        i = (i + 1) % img.Length;
        Image1.ImageUrl = img[i];
    }
    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        if(e.Item.Value == "Deconectare")
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void Timer2_Tick(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToString();
    }
}

