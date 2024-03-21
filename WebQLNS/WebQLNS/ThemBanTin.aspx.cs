using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebQLNS
{
    public partial class ThemBanTin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            // lấy giá trị chuỗi kết nối trong wed.config
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["QLNhanVienConnectionString"].ConnectionString;
            // tạo đối tượng Connection
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);
            conn.Open();
            // tao cau sql de them ban tin
            string sql = "insert into bantin(tieude, tomtat, noidung, hinh,ngaydang,trangthai,theloaiid)" +
                " values (@tieude, @tomtat, @noidung, @hinh,@ngaydang,@trangthai,@theloaiid)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            // truyen gia tri cho cac tham so trong cau lenh sql
            cmd.Parameters.AddWithValue("@tieude", txtTieuDe.Text);
            cmd.Parameters.AddWithValue("@tomtat", txtTomTat.Text);
            cmd.Parameters.AddWithValue("@noidung", txtNoiDung.Text);

            if (Fhinh.HasFile)
            {
                // xu ly upload hinh
                string duong_dan = Server.MapPath("~/Uploads/") + Fhinh.FileName;
                Fhinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@hinh", Fhinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@hinh", "no_image.png");
            }

            cmd.Parameters.AddWithValue("@ngaydang", txtNgayDang.Text);
            cmd.Parameters.AddWithValue("@trangthai", chkTrangThai.Checked);
            cmd.Parameters.AddWithValue("@theloaiid", ddlTheLoai.SelectedValue);
            //thuc hien cau lenh truy van den CSDL
            if (cmd.ExecuteNonQuery() > 0)
                Response.Redirect("qlTinTuc.aspx");
            else
                lbThongBao.Text = "Thao tác thêm tin thất bại";
        }
    }
}