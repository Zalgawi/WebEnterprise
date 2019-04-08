﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QACoordinator.aspx.cs" Inherits="WebEnterprise.Account.QACoordinator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script src="../../../Scripts/jquery-3.3.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" />
<%--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>



<div class="text-center">
    <h3 class="text-center">QA Coordinator</h3>
    <hr />
    <div>
        <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click1" />
    </div>
     <hr />
    
    <ul  class="nav nav-tabs">
  <li  class="active"><a href="#medicalInfo" data-toggle="tab" aria-expanded="false">Add Categories</a></li>
   <li  class=""><a href="#update" data-toggle="tab" aria-expanded="false">Update Categorie</a></li>  
                   

        
    </ul>
    <div id="myTabContent" class="tab-content">

  <div class="tab-pane fade active in" id="medicalInfo">
    <br/> <br/>   
     <asp:TextBox  ID="txtAdd" runat="server"></asp:TextBox> <br/> <br/> 
     <asp:Button style="align-content:center" ID="addBtn" runat="server" Text="Add" OnClick="addBtn_Click" />
      

	</div>
  
  <div class="tab-pane fade in" id="update">
      <br/> <br/>  
 <div style="margin-left:auto; margin-right:auto; width:200px;">    
  <asp:GridView style="align-content:center" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="catId" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True">
    <Columns>
           <asp:CommandField ShowSelectButton="True" />
           <asp:BoundField DataField="catId" HeaderText="catId" InsertVisible="False" ReadOnly="True" SortExpression="catId" /> 
           <asp:BoundField DataField="catName" HeaderText="catName" SortExpression="catName" />
       </Columns>
       </asp:GridView>
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
           SelectCommand="SELECT * FROM [Categories]"
           UpdateCommand="UPDATE [Categories] Set [catName]=@catName Where [catId]=@catId"
           DeleteCommand="DELETE from [Categories] Where [catId]=@catId"
           >

       </asp:SqlDataSource>
      
                </div>


	</div>
  

  
    </div>
    </div>
</asp:Content>