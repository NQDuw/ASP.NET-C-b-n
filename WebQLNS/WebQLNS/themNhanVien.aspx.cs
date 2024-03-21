using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebQLNS
{
    public partial class themNhanVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //lay gia tri ket noi trong webconfig
            string chuoiketnoi = ConfigurationManager.ConnectionStrings["QLNhanVienConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(chuoiketnoi);
            conn.Open();
            string sql = "INSERT INTO NhanVien(honv,tennv,phai,ngaysinh,noisinh,maphong) values(@honv,@tennv,@phai,@ngaysinh,@noisinh,@maphong)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@honv", txtnhanvien.Text);
            cmd.Parameters.AddWithValue("@tennv", txttennv.Text);
            if (rdlnam.Checked)
                cmd.Parameters.AddWithValue("@phai", true);
            else
                cmd.Parameters.AddWithValue("@phai", false);
            cmd.Parameters.AddWithValue("@ngaysinh", txtngay.Text);
            cmd.Parameters.AddWithValue("@noisinh", txtnoisinh.Text);
            cmd.Parameters.AddWithValue("@maphong", idPhong.SelectedValue);
            //thuc hien truy van them nhan vien
            try
            {
                // Các dòng code để mở kết nối và thực thi câu lệnh SQL ở đây...

                if (cmd.ExecuteNonQuery() > 0)
                {
                    lblthongbao.Text = "Thêm Nhân Viên Thành Công!!!";
                    Response.Redirect("qlNhanVien.aspx");
                }
                else
                {
                    lblthongbao.Text = "Thêm Nhân Viên Thất Bại!!!";
                }
            }
            catch (Exception ex)
            {
                lblthongbao.Text = "Đã xảy ra lỗi: " + ex.Message;
            }
        }

    }
}
