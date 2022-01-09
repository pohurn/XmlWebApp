using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Data;

namespace XmlWebApp
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Bind xml data to datalist
                BindDatalist();
            }
        }
        /// <summary>
        /// btnSubmit event is used to insert data into XML file
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            XmlDocument xmldoc = new XmlDocument();
            xmldoc.Load(Server.MapPath("Sample.xml"));
            XmlElement parentelement = xmldoc.CreateElement("Comments");
            XmlElement name = xmldoc.CreateElement("Name");
            name.InnerText = txtName.Text;
            XmlElement location = xmldoc.CreateElement("Address");
            location.InnerText = txtLocation.Text;
            XmlElement email = xmldoc.CreateElement("Nickname");
            email.InnerText = txtNickname.Text;
            XmlElement Description = xmldoc.CreateElement("Description");
            Description.InnerText = txtComments.Text;
            XmlElement date = xmldoc.CreateElement("Date");
            date.InnerText = DateTime.Now.ToString();
            parentelement.AppendChild(name);
            parentelement.AppendChild(location);
            parentelement.AppendChild(email);
            parentelement.AppendChild(Description);
            parentelement.AppendChild(date);
            xmldoc.DocumentElement.AppendChild(parentelement);
            xmldoc.Save(Server.MapPath("Sample.xml"));
            BindDatalist();
        }
        /// <summary>
        /// Bind xml data to datalist
        /// </summary>
        private void BindDatalist()
        {
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("Sample.xml"));
            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count != 0)
            {
                dlComments.DataSource = ds;
                dlComments.DataBind();
            }
            else
            {
                dlComments.DataSource = null;
                dlComments.DataBind();
            }
        }
    }
}