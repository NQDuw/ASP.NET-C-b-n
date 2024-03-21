<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="qlPhongBan.aspx.cs" Inherits="WebQLNS.qlPhongBan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row w-50 m-auto">
        <div class="col-md-12 form-inline">
            chọn phòng ban: <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsPhong" DataTextField="TenPhong" DataValueField="MaPhong" AutoPostBack="true"></asp:DropDownList>
        </div><br><br>

        <asp:GridView ID="gvNhanVien" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaNV" DataSourceID="dsNhanVienTheoPhong" ForeColor="#333333" GridLines="None" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MaNV" HeaderText="MaNV" InsertVisible="False" ReadOnly="True"  />
            <asp:BoundField DataField="HoNV" HeaderText="HoNV"  />
            <asp:BoundField DataField="TenNV" HeaderText="TenNV" />
            <asp:CheckBoxField DataField="Phai" HeaderText="Phai"  />
            <asp:BoundField DataField="NgaySinh" HeaderText="NgaySinh" DataFormatString="{0:dd/MM/yyyy}"  />
            <asp:BoundField DataField="NoiSinh" HeaderText="NoiSinh"  />
            <asp:BoundField DataField="MaPhong" HeaderText="MaPhong"  />
            <asp:CommandField ShowEditButton="true" ButtonType="Button" ShowDeleteButton="true"/>
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
        <EmptyDataTemplate>
            <div class="alert alert-warning"> 
                Không có nhân viên nào thuộc phòng ban này
            </div>
        </EmptyDataTemplate>
        <%--<HeaderStyle CssClass="bg-secondary text-light" />--%>
        <PagerSettings Mode ="NextPreviousFirstLast"  FirstPageText="Đầu" LastPageText ="Cuối"/>
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
    </div>
    
    
        
    <asp:SqlDataSource ID="dsPhong" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" 
        SelectCommand="SELECT * FROM [PhongBan]" DeleteCommand="DELETE FROM [PhongBan] WHERE [MaPhong] = @MaPhong" InsertCommand="INSERT INTO [PhongBan] ([TenPhong]) VALUES (@TenPhong)" UpdateCommand="UPDATE [PhongBan] SET [TenPhong] = @TenPhong WHERE [MaPhong] = @MaPhong">
        <DeleteParameters>
            <asp:Parameter Name="MaPhong" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenPhong" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenPhong" Type="String" />
            <asp:Parameter Name="MaPhong" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="dsNhanVienTheoPhong" runat="server" 
        ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" 
        DeleteCommand="DELETE FROM [NhanVien] WHERE [MaNV] = @MaNV"
        InsertCommand="INSERT INTO [NhanVien] ([HoNV], [TenNV], [Phai], [NgaySinh], [NoiSinh], [MaPhong]) VALUES (@HoNV, @TenNV, @Phai, @NgaySinh, @NoiSinh, @MaPhong)" 
        SelectCommand="SELECT * FROM [NhanVien] WHERE ([MaPhong] = @MaPhong)" 
        UpdateCommand="UPDATE [NhanVien] SET [HoNV] = @HoNV, [TenNV] = @TenNV, [Phai] = @Phai, [NgaySinh] = @NgaySinh, [NoiSinh] = @NoiSinh, [MaPhong] = @MaPhong WHERE [MaNV] = @MaNV">
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
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="MaPhong" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
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
</asp:Content>
