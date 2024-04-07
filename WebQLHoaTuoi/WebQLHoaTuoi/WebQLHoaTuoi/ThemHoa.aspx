<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemHoa.aspx.cs" Inherits="WebQLHoaTuoi.ThemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">

    <h4>Trang Thêm Hoa</h4>
    <div class=" m-auto w-75" >
        <div class="row mt-3 mb-2">
        <div class="col-md-2"> Danh Mục </div>
            <div class="col-md-10">
                <asp:DropDownList ID="ddlLoai" CssClass="form-control" runat="server" AutoPostBack="True" 
                    DataSourceID="sdsThemHoa" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
       </div>
    </div>
    <div class="row mb-2">
        <div class="col-md-2"> Tên Hoa</div>
            <div class="col-md-10">
                <asp:TextBox ID="txtTenHoa" CssClass="form-control" TextMode="MultiLine"   runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTenHoa" runat="server" ControlToValidate="txtTenHoa" 
            ErrorMessage="Tên hoa không được rỗng (*)"  ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
       </div>
    </div>
    <div class="row mb-2">
        <div class="col-md-2"> Giá</div>
            <div class="col-md-10">
                <asp:TextBox ID="txtGia" CssClass="form-control" TextMode="SingleLine" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvGia" runat="server" ControlToValidate="txtGia" 
            ErrorMessage="Giá bán không được rỗng (*)"  ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvGia" runat="server" ErrorMessage="Giá bán Không hợp lệ (*)" ForeColor="Red"
                    ControlToValidate="txtGia" Operator="DataTypeCheck" Type="Double" ></asp:CompareValidator>
       </div>
    </div>
        <div class="row mb-2">
        <div class="col-md-2"> Ngày Cập Nhật</div>
            <div class="col-md-10">
                <asp:TextBox ID="txtNgay" CssClass="form-control" TextMode="Date"  runat="server"></asp:TextBox>
       </div>
    </div>
        <div class="row mb-2">
        <div class="col-md-2"> Hình</div>
            <div class="col-md-10">
                <asp:FileUpload ID="FHinh" runat="server" />
       </div>
    </div>
        <div class="row mb-2">
        <div class="col-md-2"> </div>
            <div class="col-md-10">
                <asp:Button ID="btThem" CssClass="btn btn-danger" runat="server" Text="Thêm Hoa" OnClick="btThem_Click" />
       </div>
    </div>
    </div>
        <asp:SqlDataSource ID="sdsThemHoa" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
    <asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>

    <asp:ValidationSummary ID="vsLoi" runat="server" ShowSummary="False" />
</asp:Content>
