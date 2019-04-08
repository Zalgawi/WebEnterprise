<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="WebEnterprise.Admin.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center">
        <hr/>
    <h3 class="text-center">User Report Table</h3>
     <hr />
        </div>
    <br />

    <div>
        
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Sort By Departments<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="deptName" DataValueField="deptName" Width="171px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>
        </strong>
        <asp:Button ID="Button5" runat="server" Text="Refresh" Width="153px" OnClick="Button5_Click" Font-Bold="True" />
        <asp:Button ID="Button4" runat="server" Text="Back" Width="136px" Font-Bold="True" OnClick="Button4_Click" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT [deptName] FROM [AspNetUsers]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
        
    </div>
     <br />
     <br />
     <br />
     <br />
   <div>
        <asp:Panel ID="Panel2" runat="server">
            <div class="text-justify">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" BorderStyle="Solid" ShowFooter="True" Width="1174px" AllowPaging="True" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="Email" HeaderText="UserName" SortExpression="Email" />
                        <asp:BoundField DataField="deptName" HeaderText="Department" SortExpression="deptName" />
                        <asp:CheckBoxField DataField="LockoutEnabled" HeaderText="LockoutEnabled" SortExpression="LockoutEnabled" />
                        <asp:BoundField DataField="LockoutEndDateUtc" HeaderText="LockoutEndDate" SortExpression="LockoutEndDateUtc" />
                        
                        
                    </Columns>
                    <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" BorderStyle="Solid" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" BorderStyle="Solid" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" BorderStyle="Solid" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" BorderStyle="Solid" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>

           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
           SelectCommand="SELECT * FROM [AspNetUsers]"
           UpdateCommand="UPDATE [AspNetUsers] Set [LockoutEnabled]=@LockoutEnabled [LockoutEndDateUtc]=@LockoutEndDateUtc[deptName]=@deptName [Email]=@Email  Where [Id]=@Id"
           DeleteCommand="DELETE from [AspNetUsers] Where [Id]=@Id"

           >
               </asp:SqlDataSource>
                </div>
                </asp:Panel>
</div>

       <div>
     
       
        <asp:Panel ID="Panel3" runat="server">
            <div class="text-justify">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource3" GridLines="Horizontal" ShowFooter="True" Width="1174px" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                   <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="Email" HeaderText="UserName" SortExpression="Email" />
                       <asp:BoundField DataField="deptName" HeaderText="Department" SortExpression="deptName" />
                        <asp:CheckBoxField DataField="LockoutEnabled" HeaderText="LockoutEnabled" SortExpression="LockoutEnabled" />
                        <asp:BoundField DataField="LockoutEndDateUtc" HeaderText="LockoutEndDate" SortExpression="LockoutEndDateUtc" />
                        
                    </Columns>
                    <FooterStyle BackColor="White" BorderColor="#3399FF" BorderStyle="Solid" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
                  <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
           SelectCommand="SELECT * FROM [AspNetUsers]"
           UpdateCommand="UPDATE [AspNetUsers] Set [LockoutEnabled]=@LockoutEnabled [LockoutEndDateUtc]=@LockoutEndDateUtc[deptName]=@deptName [Email]=@Email  Where [Id]=@Id"
           DeleteCommand="DELETE from [AspNetUsers] Where [Id]=@Id" OnSelecting="SqlDataSource3_Selecting"
>
                      <SelectParameters>
                          <asp:ControlParameter ControlID="DropDownList1" Name="deptName" PropertyName="SelectedValue" Type="String" />
                      </SelectParameters>
                      </asp:SqlDataSource>

           
                        
                      
              
                      
                     
                </div>

        </asp:Panel>
    </div>
    

             <br />




         
   
</asp:Content>
