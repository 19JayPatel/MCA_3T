using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MCA_3T
{
    public partial class SignUpForm : System.Web.UI.Page
    {
        Signup_form_BL emp;
        string path, fnm;
        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            getdata();
        }

        void startcon()
        {
            emp = new Signup_form_BL();
            emp.getcon();
        }

        void imageupload()
        {
            path = Path.GetExtension(flpimg.FileName);

            if (path == ".png" || path == ".jpg")
            {
                fnm = "Images/" + flpimg.FileName;
                flpimg.SaveAs(Server.MapPath(fnm));
            }
            else
            {
                Response.Write("Please select .png or .jpg file");
            }
        }

        void getdata()
        {
            emp = new Signup_form_BL();
            emp.getcon();
            GridView1.DataSource = emp.getdata();
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "Save Employee Details")
            {
                imageupload();
                emp = new Signup_form_BL();
                emp.getcon();
                emp.insert(txtnm.Text, txteml.Text, rdgen.Text, drpct.SelectedValue, txtmbl.Text, fnm);
                clear();
                getdata();
            }
        }

        void clear()
        {
            txtnm.Text = "";
            txteml.Text = "";
            txtmbl.Text = "";
        }
    }
}