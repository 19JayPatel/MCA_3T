using System;
using System.Collections.Generic;
using System.Data;
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
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            fillgrid();
        }

        void startcon()
        {
            emp = new Signup_form_BL();
            emp.getcon();
        }

        void fillgrid()
        {
            startcon();
            GridView1.DataSource = emp.select();
            GridView1.DataBind();
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
        void clear()
        {
            txtnm.Text = "";
            txteml.Text = "";
            txtmbl.Text = "";
            drpct.SelectedIndex = 0;
        }

        //Paring

        void filltext()
        {
            ds = emp.selectbyID(Convert.ToInt32(ViewState["Id"]));
            //It will return DS
            //Paring

            txtnm.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            txteml.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            drpct.SelectedValue = ds.Tables[0].Rows[0]["City"].ToString();
            txtmbl.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();

            if (ds.Tables[0].Rows[0]["Gender"].ToString() == "Male")
            {
                rdgen.Text = "Male";
            }
            else
            {
                rdgen.Text = "Female";
            }
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
                fillgrid();
            }
            else
            {
                startcon();
                emp.update(Convert.ToInt32(ViewState["Id"]), txtnm.Text, txteml.Text, rdgen.Text, drpct.SelectedValue, txtmbl.Text);
                clear();
                fillgrid();
                Button1.Text = "Save";

                //Update code
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["Id"] = id;
                Button1.Text = "Update";
                filltext();
            }
            else
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["Id"] = id;
                startcon();
                emp.delete(Convert.ToInt16(ViewState["Id"]));
                fillgrid();

                //Delete code
            }
        }
    }
}