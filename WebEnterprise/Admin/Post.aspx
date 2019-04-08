<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Post.aspx.cs" Inherits="WebEnterprise.Admin.Post" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="text-center">
        <hr/>
    <h3 class="text-center">Post Data</h3>
     <hr />
   <div>
        <br />
       <hr />
      <div>
                  <asp:Button ID="Button4" runat="server" Text="Back" Width="136px" Font-Bold="True" OnClick="Button4_Click" />
        <hr />

      </div>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="postId" DataSourceID="SqlDataSource1" ShowFooter="True" Width="1211px" AllowSorting="True">
           <Columns>
               <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
               <asp:BoundField DataField="postId" HeaderText="PostID" InsertVisible="False" ReadOnly="True" SortExpression="postId" />
               <asp:BoundField DataField="postTitle" HeaderText="Title" SortExpression="postTitle" />
               <asp:BoundField DataField="postBody" HeaderText="Body" SortExpression="postBody" />
               <asp:BoundField DataField="postDepartment" HeaderText="Department" SortExpression="postDepartment" />
               <asp:BoundField DataField="postCategory" HeaderText="Category" SortExpression="postCategory" />
               <asp:BoundField DataField="postLikes" HeaderText="Likes" SortExpression="postLikes" />
               <asp:BoundField DataField="postDislikes" HeaderText="Dislikes" SortExpression="postDislikes" />
               <asp:BoundField DataField="postDate" HeaderText="Date" SortExpression="postDate" />
           </Columns>
           <EditRowStyle BorderStyle="Solid" />
           <FooterStyle BackColor="#990000" ForeColor="#330099" />
           <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
           <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
           <RowStyle BackColor="White" ForeColor="#330099" />
           <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
           <SortedAscendingCellStyle BackColor="#FEFCEB" />
           <SortedAscendingHeaderStyle BackColor="#AF0101" />
           <SortedDescendingCellStyle BackColor="#F6F0C0" />
           <SortedDescendingHeaderStyle BackColor="#7E0000" />
       </asp:GridView>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
           SelectCommand="SELECT * FROM [Posts]"
           UpdateCommand="UPDATE [Posts] Set [postLikes]=@postLikes [postDislike]=@postDislikes[postDate]=@postDate[postTitle]=@postTitle [postBody]=@postBody[postDepartment]=@postDepartment [postCategory]=@postCategory  Where [postId]=@postId"
           DeleteCommand="DELETE from [Posts] Where [postId]=@postId"

           >
               </asp:SqlDataSource>
       
        
      
    </div>
     </div>
</asp:Content>
