using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MCA_3T
{
    public class Signup_form_BL
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        public SqlConnection getcon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        public void insert(string nm, string eml, string gen, string ct, string mbl, string img)
        {
            cmd = new SqlCommand("insert into Emp_tbl(Name,Email,Gender,City,Mobile,Image) values('" + nm + "','" + eml + "','" + gen + "','" + ct + "','" + mbl + "','" + img + "')", con);
            cmd.ExecuteNonQuery();
        }

        public DataSet getdata()
        {
            da = new SqlDataAdapter("select * from Emp_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}