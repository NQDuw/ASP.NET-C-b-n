using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebQLHoaTuoi
{
    public partial class ThemHoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            //Lấy giá trị chuỗi kết nối trong Web.config
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["HoaTuoiDBConnectionString"].ConnectionString;
            //Tạo đối tượng Connection
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);
            conn.Open();
            //Tạo câu sql để thêm bản tin
            string sql = "insert into hoa(tenhoa,gia,hinh,maloai,ngaydang,soluotxem) " +
                "values (@tenhoa,@gia,@hinh,@maloai,@ngaydang,@soluotxem)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            //Truyền giá trị cho các tham số trong câu lệnh sql
            cmd.Parameters.AddWithValue("@tenhoa", txtTenHoa.Text);
            cmd.Parameters.AddWithValue("@gia", txtGia.Text);

            //Xử lý upload Hình
            if (FHinh.HasFile)
            {
                //Xử lý uploads hình
                string duong_dan = Server.MapPath("~/Hinh_san_pham/") + FHinh.FileName;
                FHinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@hinh", FHinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@hinh", "no_image.png");
            }
            cmd.Parameters.AddWithValue("@maloai", ddlLoai.SelectedValue);
            cmd.Parameters.AddWithValue("@ngaydang", txtNgay.Text);
            cmd.Parameters.AddWithValue("@soluotxem", 0);
            //Thực hiện câu lệnh truy vấn CSDL
            if (cmd.ExecuteNonQuery() > 0)
                Response.Redirect("XemHoa.aspx");
            else
                lbThongBao.Text = "Thao tác thêm hoa thất bại";
        }
    }
}