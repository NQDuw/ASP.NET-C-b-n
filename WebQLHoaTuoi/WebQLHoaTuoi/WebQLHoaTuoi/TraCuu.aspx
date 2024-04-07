<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="WebQLHoaTuoi.TraCuu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">
  
 
    <h4>Trang Tra Cứu</h4>

    <div class="form-inline mb-2 ">
        Giá bán từ: <asp:TextBox ID="txtGiaTu" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvGiaTu" runat="server" ControlToValidate="txtGiaTu" 
            ErrorMessage="Chưa nhập giá từ (*)"  ForeColor="Red"></asp:RequiredFieldValidator>
        
    </div>
    <div class="form-inline mb-3 ">
        Giá đến: <asp:TextBox ID="txtGiaDen" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvGiaDen" runat="server" ControlToValidate="txtGiaDen" 
            ErrorMessage="Chưa nhập giá đến (*)"  ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvGia" runat="server" ErrorMessage="Dữ Liệu Không hợp lệ (*)" ForeColor="Red"
            ControlToValidate="txtGiaDen" ControlToCompare="txtGiaTu" Operator="GreaterThanEqual" Type="Double" ></asp:CompareValidator>
    </div>
    <div class="mb-3">
        <asp:Button ID="btTraCuu" runat="server" Text="Tìm Kiếm" CssClass="btn btn-danger" />
    </div>


    <asp:ValidationSummary ID="vsLoi" runat="server" ShowSummary="False" />
     <div class="row mt-2">
         <%--<asp:Repeater ID="rptHoa" runat="server" DataSourceID="sdsHoaTheoGia">
             <ItemTemplate>
                 
             </ItemTemplate>
         </asp:Repeater>--%>

         <asp:ListView ID="lvHoa" runat="server" DataSourceID="sdsHoaTheoGia">
             <ItemTemplate>
                 <div class="col-md-3 text-center mb-2">
                     <a href="#">
                         <img alt=""style="width:200px;height:300px" src="hinh_san_pham/<%# Eval("hinh") %>"  />
                     </a> <br />

                     <%# Eval("TenHoa") %> <br />
                     <h6 >Giá bán: <p class="d-inline" style="color:red" ><%# Eval("gia","{0:#,##0} đồng") %></p></h6> 
                     <asp:Button ID="btAddToCard" runat="server" Text="Thêm vào giỏ" 
                         CssClass="btn btn-danger text-white active" />
                 </div>
             </ItemTemplate>
             <LayoutTemplate>
                 <div class="row">
                     <div id="itemPlaceHolder" runat="server">

                     </div>
                     <div class=" text-center w-100 mt-3 p-3 pb-3">
                         <div class="row-cols-3 ">
                         Trang  <asp:DataPager  ID="dpageHoa" runat="server" PageSize="8">
                             <Fields>
                                 <asp:NextPreviousPagerField ButtonCssClass="active badge-primary" FirstPageText="Đầu" ShowFirstPageButton="true" 
                                      PreviousPageText="Trước" NextPageText="Sau" LastPageText="Cuối" ShowLastPageButton="true"   />
                             </Fields>
                         </asp:DataPager>
                     </div>
                   </div>
                 </div>
             </LayoutTemplate>
             <EmptyDataTemplate>
                 
                 <div class="alert alert-info">
                 Không có dữ liệu
                     </div>
                     

             </EmptyDataTemplate>
         </asp:ListView>

        </div>


    <asp:SqlDataSource ID="sdsHoaTheoGia" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Hoa] WHERE (([Gia] &gt;= @Gia) AND ([Gia] &lt;= @Gia2))">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtGiaTu" Name="Gia" PropertyName="Text" Type="Double" DefaultValue="0" />
            <asp:ControlParameter ControlID="txtGiaDen" Name="Gia2" PropertyName="Text" Type="Double" DefaultValue="10000000" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
