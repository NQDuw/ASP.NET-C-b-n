<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="qlNhanVien.aspx.cs" Inherits="WebQLNS.qlNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="dsNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString2 %>" DeleteCommand="DELETE FROM [NhanVien] WHERE [MaNV] = @MaNV" InsertCommand="INSERT INTO [NhanVien] ([HoNV], [TenNV], [Phai], [NgaySinh], [NoiSinh], [MaPhong]) VALUES (@HoNV, @TenNV, @Phai, @NgaySinh, @NoiSinh, @MaPhong)" SelectCommand="SELECT * FROM [NhanVien]" UpdateCommand="UPDATE [NhanVien] SET [HoNV] = @HoNV, [TenNV] = @TenNV, [Phai] = @Phai, [NgaySinh] = @NgaySinh, [NoiSinh] = @NoiSinh, [MaPhong] = @MaPhong WHERE [MaNV] = @MaNV">
        <DeleteParameters>
            <asp:Parameter Name="MaNV" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="HoNV" Type="String" />
            <asp:Parameter Name="TenNV" Type="String" />
            <asp:Parameter Name="Phai" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="NgaySinh" />
            <asp:Parameter Name="NoiSinh" Type="String" />
            <asp:Parameter Name="MaPhong" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="HoNV" Type="String" />
            <asp:Parameter Name="TenNV" Type="String" />
            <asp:Parameter Name="Phai" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="NgaySinh" />
            <asp:Parameter Name="NoiSinh" Type="String" />
            <asp:Parameter Name="MaPhong" Type="Int32" />
            <asp:Parameter Name="MaNV" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="gvNhanVien" runat="server"
        DataSourceID="dsNhanVien" AutoGenerateColumns="False" DataKeyNames="MaNV" CssClass="table table-hover" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" >
        <Columns>
            <asp:BoundField DataField="MaNV" HeaderText="Mã Nhân Viên" InsertVisible="False" ReadOnly="True"/>
            <asp:BoundField DataField="HoNV" HeaderText="Họ Nhân Viên"  />
            <asp:BoundField DataField="TenNV" HeaderText="Tên Nhân Viên" />
            <asp:CheckBoxField DataField="Phai" HeaderText="Phái"  />
            <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh"  />
            <asp:BoundField DataField="NoiSinh" HeaderText="Nơi Sinh"  />
            <asp:BoundField DataField="MaPhong" HeaderText="Mã Phòng" />
            <asp:CommandField ShowEditButton="true" ButtonType="Button" ShowDeleteButton="true" />
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle CssClass="bg-info" BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"/>
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
</asp:Content>
