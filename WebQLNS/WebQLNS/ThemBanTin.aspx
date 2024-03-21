<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThemBanTin.aspx.cs" Inherits="WebQLNS.ThemBanTin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2> Thêm Mới Bản Tin</h2>
    <hr />
    <div class="row mt-3 mb-2">
        <div class="col-md-2">Tiêu Đề</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtTieuDe" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row mt-3 mb-2">
        <div class="col-md-2">Tóm Tắt</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtTomTat" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row mt-3 mb-2">
        <div class="col-md-2">Nội Dung</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtNoiDung" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row mt-3 mb-2">
        <div class="col-md-2">Hình Đại Diện</div>
        <div class="col-md-10">
            <asp:FileUpload ID="Fhinh" runat="server" />
        </div>
    </div>
    <div class="row mt-3 mb-2">
        <div class="col-md-2">Ngày Đăng</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtNgayDang" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row mt-3 mb-2">
        <div class="col-md-2">Trạng Thái</div>
        <div class="col-md-10">
            <asp:CheckBox ID="chkTrangThai" runat="server" Text="Hiện" Checked="true" />
        </div>
    </div>
    <div class="row mt-3 mb-2">
        <div class="col-md-2">Thể Loại</div>
        <div class="col-md-10">
            <asp:DropDownList ID="ddlTheLoai" runat="server" CssClass="form-control"
                DataSourceID="dsTheLoai" DataTextField="TenTheLoai" DataValueField="Id">
            </asp:DropDownList>
        </div>
    </div>
    <div class="row mt-3 mb-2">
        <div class="col-md-2"></div>
        <div class="col-md-10">
            <asp:Button ID="btSave" runat="server" Text="Lưu" CssClass="btn btn-primary" OnClick="btSave_Click" />
            <asp:Label ID="lbThongBao" runat="server" Text="" ForeColor="#cc3300"></asp:Label>
        </div>
    </div>

    <asp:SqlDataSource ID="dsTheLoai" runat="server"
        ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" 
        SelectCommand="SELECT * FROM [TheLoai]"></asp:SqlDataSource>
</asp:Content>
