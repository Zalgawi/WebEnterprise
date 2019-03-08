<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DepartmentSelectForum.aspx.cs" Inherits="WebEnterprise.Pages.DepartmentSelectForum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h2 class="text-center">Select Department</h2>
    <h3 class="text-center">You may only access a department that you are a part of.</h3>
    <h4 class="text-center">(If there are any issues, please get in touch with the administration)</h4>

    <div  class="jumbotron">

       <table ID="DepartmentTable" class="table table-hover">

  <tbody>
       <tr>
      <th scope="col" class="text-center">Departments</th>
      <th scope="col" class="text-center">Topics</th>
      <th scope="col" class="text-center">Posts</th>
    </tr>
    <tr >
      <th scope="row" class="text-center">Computing</th>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    <tr>
      <th scope="row" class="text-center">Humanities</th>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    <tr>
      <th scope="row" class="text-center">Music</th>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    <tr>
      <th scope="row" class="text-center">Medicine</th>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
    <tr>
      <th scope="row" class="text-center">Business</th>
      <td>Column content</td>
      <td>Column content</td>
    </tr>

  </tbody>
</table> 
        </div>

</asp:Content>
