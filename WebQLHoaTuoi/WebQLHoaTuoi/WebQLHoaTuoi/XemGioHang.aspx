<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemGioHang.aspx.cs" Inherits="WebQLHoaTuoi.XemGioHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">

    <h1>Giỏ hàng</h1>
    <asp:GridView ID="gvGioHang" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false"
        DataKeyNames="masp" OnRowDeleting="gvGioHang_RowDeleting" OnRowUpdating="gvGioHang_RowUpdating" >
        <Columns>
            <asp:ImageField ItemStyle-HorizontalAlign="Center" DataImageUrlField="hinh"
                DataImageUrlFormatString="hinh_san_Pham/{0}"
                HeaderText="Ảnh sản phẩm" ControlStyle-Width="150px">
            </asp:ImageField>
            <asp:BoundField HeaderText="Tên sản phẩm" DataField="tensp" />
            <asp:BoundField HeaderText="Đơn giá" DataField="DonGia"
                DataFormatString="{0:#,##0}đ" />
            <asp:TemplateField HeaderText="Số lượng">
                <ItemTemplate>
                    <asp:TextBox ID="txtSoLuong" TextMode="Number" runat="server"
                        CssClass="form-control text-center" Width="100px" Text='<%# Eval("soluong")%>'>
                    </asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Thành tiền" DataField="Thanhtien"
                DataFormatString="{0:#,##0}đ" />
            
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="btDelete" Width="60px" CssClass=" btn btn-danger" runat="server" ToolTip="Xóa"
                        CommandName="Delete"  ImageUrl="~/Hinh_San_Pham/delete.gif" />
                    <asp:ImageButton ID="btCapNhat" Width="70px" CssClass=" btn btn-info" runat="server" ToolTip="Cập nhật"
                        CommandName="Update"  ImageUrl="~/Hinh_San_Pham/save.gif" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        
        <EmptyDataTemplate>
            <div class="alert alert-danger">
                Chưa có sản phẩm trong giỏ
            </div>
        </EmptyDataTemplate>
    </asp:GridView>
    <div class="row">
        <div class="col-md-6">
            <a href="XemHoa.aspx" class="btn btn-info">Tiếp tục mua hàng</a>
        </div>
        <div class="col-md-6 text-right">
            <asp:Label ID="lbTongTien" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row" style="padding-bottom: 10px">
        <div class="col-md-12 text-right">
            <asp:Button ID="btDatHang" runat="server" Text="Đặt hàng" CssClass="btn btn-success" />
        </div>
    </div>

</asp:Content>
