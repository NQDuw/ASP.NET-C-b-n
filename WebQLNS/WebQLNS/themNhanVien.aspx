<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="themNhanVien.aspx.cs" Inherits="WebQLNS.themNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-2 border-1">Họ Tên Nhân Viên</div>
            <div class="col-md-10">
                <asp:TextBox ID="txtnhanvien" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">Tên Nhân Viên</div>
            <div class="col-md-10">
                <asp:TextBox ID="txttennv" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">Giới tính</div>
            <div class="col-md-10">
                <asp:RadioButton ID="rdlnam" runat="server" Text="Nam" GroupName="rld" Checked="true" CssClass="form-check-input" />
                <asp:RadioButton ID="rdlnu" runat="server" Text="Nữ" GroupName="rld" CssClass="form-check-input" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">Ngày Sinh</div>
            <div class="col-md-10">
                <asp:TextBox ID="txtngay" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">Nơi Sinh</div>
            <div class="col-md-10">
                <asp:TextBox ID="txtnoisinh" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">Phòng</div>
            <div class="col-md-10">
                <asp:DropDownList ID="idPhong"  runat="server" DataSourceID="SqlDataSource1" DataTextField="TenPhong" DataValueField="MaPhong"></asp:DropDownList>
            </div>
        </div>
    </div>
  
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"  />
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" SelectCommand="SELECT * FROM [PhongBan]"></asp:SqlDataSource>
    <asp:TextBox ID="lblthongbao" BackColor="Red" runat="server"></asp:TextBox>

</asp:Content>
