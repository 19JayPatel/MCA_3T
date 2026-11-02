using System;
using System.Collections.Generic;
//Add new namespaces
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MCA_3T
{
    public class Signup_form_BL
    {
        SqlConnection con; //For connection with database
        SqlDataAdapter da; // Run time container
        DataSet ds; // Run time container to store data
        SqlCommand cmd; //insert, update, delete, select command

        string s = ConfigurationManager.ConnectionStrings["db"].ConnectionString;

        public SqlConnection getcon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        public void insert(string nm, string eml, string gen, string ct, string mbl, string img)
        {
            cmd = new SqlCommand("INSERT INTO Emp_tbl(Name,Email,Gender,City,Mobile,Image) values('" + nm + "','" + eml + "','" + gen + "','" + ct + "','" + mbl + "','" + img + "')", con);
            cmd.ExecuteNonQuery();
        }

        public DataSet select()
        {
            da = new SqlDataAdapter("SELECT * FROM Emp_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet selectbyID(int Id)
        {
            da = new SqlDataAdapter("SELECT * FROM Emp_tbl WHERE Id=" + Id, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public void update(int Id, string nm, string eml, string gen, string ct, string mbl)
        {
            cmd = new SqlCommand("UPDATE Emp_tbl SET Name='" + nm + "',Email='" + eml + "',Gender='" + gen + "',City='" + ct + "',Mobile='" + mbl + "' WHERE Id=" + Id, con);
            cmd.ExecuteNonQuery();
        }

        public void delete(int Id)
        {
            cmd = new SqlCommand("DELETE FROM Emp_tbl WHERE Id=" + Id, con);
            cmd.ExecuteNonQuery();
        }
    }
}