using PdfSharp.Drawing;
using PdfSharp.Drawing.Layout;
using PdfSharp.Pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Taxe : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=db;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            TextBoxPlataTVA.Attributes.Add("readonly", "readonly");

            if (con.State==System.Data.ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            // Create a new PDF document
            PdfDocument document = new PdfDocument();

            // Create an empty page
            PdfPage page = document.AddPage();

            // Get an XGraphics object for drawing
            XGraphics gfx = XGraphics.FromPdfPage(page);

            // Create a font
            XFont font = new XFont("Verdana", 10, XFontStyle.Bold);

            XTextFormatter tf = new XTextFormatter(gfx);

            String first_name = TextBoxNume.Text.ToString();
            String second_name = TextBoxPrenume.Text.ToString();
            String CNP = TextBoxCNP.Text.ToString();
            String institutie = DropDownListInstitutie.Text.ToString();
            String oras = DropDownListOras.Items[DropDownListOras.SelectedIndex].Text;
            String judet = DropDownListJudet.Items[DropDownListJudet.SelectedIndex].Text;
            String suma_totala = TextBoxPlataTVA.Text.ToString();

            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "insert into Date values('"+first_name+"','"+second_name+"','"+CNP+"','"+ judet + "','"+oras+"','"+institutie+"','"+suma_totala+"')";
            cmd.ExecuteNonQuery();

            String final_text = "Subsemnatul " + first_name + " " + second_name + ", cu CNP: " + CNP + ", din localitatea " + oras + ", " + judet + " " + "se angajeaza sa plateasca suma de " + suma_totala + " LEI institutiei " + institutie + "!";

            XRect rect = new XRect(50, 50, page.Width-50, page.Height-50);
            gfx.DrawRectangle(XBrushes.White, rect);
            tf.DrawString(final_text, font, XBrushes.Black, rect, XStringFormats.TopLeft);

            // Send PDF to browser
            MemoryStream stream = new MemoryStream();
            document.Save(stream, false);
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment; filename= ordin.pdf");
            Response.BinaryWrite(stream.ToArray());
            Response.Flush();
            stream.Close();
            Response.End();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.RawUrl);
        }
    }
}