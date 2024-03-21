<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="qlTinTuc.aspx.cs" Inherits="WebQLNS.qlTinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="text-right">
       <a href="ThemBanTin.aspx" class="btn btn-outline-primary">Thêm bản tin</a>
    </div>
    <asp:SqlDataSource ID="dsBanTin" runat="server" ConnectionString="<%$ ConnectionStrings:TinTucDBConnectionString %>" DeleteCommand="DELETE FROM [BanTin] WHERE [Id] = @Id" InsertCommand="INSERT INTO [BanTin] ([TieuDe], [TomTat], [NoiDung], [Hinh], [NgayDang], [TrangThai], [TheLoaiID]) VALUES (@TieuDe, @TomTat, @NoiDung, @Hinh, @NgayDang, @TrangThai, @TheLoaiID)" SelectCommand="SELECT * FROM [BanTin]" UpdateCommand="UPDATE [BanTin] SET [TieuDe] = @TieuDe, [TomTat] = @TomTat, [NoiDung] = @NoiDung, [Hinh] = @Hinh, [NgayDang] = @NgayDang, [TrangThai] = @TrangThai, [TheLoaiID] = @TheLoaiID WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TieuDe" Type="String" />
            <asp:Parameter Name="TomTat" Type="String" />
            <asp:Parameter Name="NoiDung" Type="String" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="NgayDang" Type="DateTime" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
            <asp:Parameter Name="TheLoaiID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TieuDe" Type="String" />
            <asp:Parameter Name="TomTat" Type="String" />
            <asp:Parameter Name="NoiDung" Type="String" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="NgayDang" Type="DateTime" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
            <asp:Parameter Name="TheLoaiID" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="gvBanTin" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dsBanTin" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="TieuDe" HeaderText="TieuDe" SortExpression="TieuDe" />
            <asp:BoundField DataField="TomTat" HeaderText="TomTat" SortExpression="TomTat" />
            <asp:BoundField DataField="NoiDung" HeaderText="NoiDung" SortExpression="NoiDung" />
            <asp:BoundField DataField="Hinh" HeaderText="Hinh" SortExpression="Hinh" />
            <asp:BoundField DataField="NgayDang" HeaderText="NgayDang" SortExpression="NgayDang" />
            <asp:CheckBoxField DataField="TrangThai" HeaderText="TrangThai" SortExpression="TrangThai" />
            <asp:BoundField DataField="TheLoaiID" HeaderText="TheLoaiID" SortExpression="TheLoaiID" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    </asp:Content>