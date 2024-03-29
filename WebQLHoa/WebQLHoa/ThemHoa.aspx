<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemHoa.aspx.cs" Inherits="WebQLHoa.ThemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <h2> Thêm Mới Sản Phẩm</h2>
    <hr />
    <div class="row mt-3 mb-2">
        <div class="col-md-2">Danh Mục</div>
        <div class="col-md-10">
            <asp:DropDownList ID="ddlLoai" runat="server" CssClass="form-control" DataSourceID="dsloai" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
        </div>
    </div>
    <div class="row mt-3 mb-2">
        <div class="col-md-2">Tên Hoa</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtTenHoa" runat="server" TextMode="MultiLine" CssClass="form-control"  ></asp:TextBox>
        </div>
    </div>
     <div class="row mt-3 mb-2">
        <div class="col-md-2">Giá</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtGia" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </div>
    </div> <div class="row mt-3 mb-2">
        <div class="col-md-2">Ngày Cập Nhật</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtNgayCapNhat" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row mt-3 mb-2">
        <div class="col-md-2">Hình</div>
        <div class="col-md-10">
            <asp:FileUpload ID="Fhinh" runat="server" />
        </div>

    </div>
   <asp:Button ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click" />
<asp:Label ID="lbThongbao" runat="server"></asp:Label>

   <asp:SqlDataSource ID="dsloai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>

</asp:Content>
