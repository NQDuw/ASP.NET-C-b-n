using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.IO;


namespace WebQLHoaTuoi
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            string textFile = Server.MapPath("~/Counter.txt");
            int demtruycap = int.Parse(File.ReadAllText(textFile));
            Application["DemTruyCap"] = demtruycap;
        }
        protected void Session_Start(object sender, EventArgs e)
        {
            
            //Đọc từ file
            Application.Lock();
            Application["DemTruyCap"] = (int)Application["DemTruyCap"] + 1;
            //Ghi vào file
            string textFile = Server.MapPath("~/Counter.txt");
            File.WriteAllText(textFile, Application["DemTruyCap"].ToString());
            Application.UnLock();
        }
    }
}