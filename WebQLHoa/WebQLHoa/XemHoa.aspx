<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="WebQLHoa.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-inline">
        chọn danh mục:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dstheloai" DataTextField="TenLoai" DataValueField="MaLoai" AutoPostBack="true"></asp:DropDownList>
    </div>


    <div class="row mt-2">
        <asp:Repeater ID="rqtHoa" runat="server" DataSourceID="dshoa">
            <ItemTemplate>
                <div class=" col-md-3 mt-2 text-center">
                    <a href="#">
                        <img src="Hinh_San_Pham/<%# Eval("Hinh") %>"style="width:200px;object-fit:cover"/>
                    </a>
                    <br />
                    <%# Eval("TenHoa") %><br/>
                    Giá bán: <span class="price"><%# Eval("Gia","{0:#,##0} VNĐ") %></span><br/>
                    <asp:Button ID="btnAddToCard" runat="server" Text="Add To Card" class="btn btn-success"/>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    


    <asp:SqlDataSource ID="dstheloai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Loai]">
</asp:SqlDataSource>
    <asp:SqlDataSource ID="dshoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="MaLoai" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
