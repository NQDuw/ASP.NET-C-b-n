<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="WebQLHoaTuoi.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
   
    <h4>Trang Xem Hoa</h4>

    <div class="row mt-2">
        <asp:Repeater ID="rptHoa" runat="server" DataSourceID="sdsHoa">
            <ItemTemplate>
                <div class="col-md-3 text-center mb-2">
                    <a href="#">
                        <img alt="" style="width:200px;height:300px"  src="Hinh_San_Pham/<%# Eval("hinh") %>" />
                    </a>
                    <br />

                    <%# Eval("TenHoa") %>
                    <h6 >Giá bán: <p class="d-inline" style="color:red"><%# Eval("gia","{0:#,##0} đồng") %></p></h6>
                    <asp:Button ID="btAddToCard" runat="server" Text="Thêm vào giỏ"
                        CommandArgument='<%# Eval("MaHoa") %>' CssClass="btn btn-danger text-white" OnClick="btAddToCard_Click" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>



    <!--sql--->
    <asp:SqlDataSource ID="sdsHoa" runat="server"
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>"
        SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="MaLoai" QueryStringField="maloai" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>



</asp:Content>
