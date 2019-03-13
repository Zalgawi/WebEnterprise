<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DepartmentSelectForum.aspx.cs" Inherits="WebEnterprise.Pages.DepartmentSelectForum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h2 class="text-center">Select Department</h2>
    <h3 class="text-center">You may only access a department that you are a part of.</h3>
    <h4 class="text-center">(If there are any issues, please get in touch with the administration)</h4>

    <div  class="jumbotron">

        <table class="table table-hover" align="center">
  <thead>
    <tr class="table-primary">
      <th scope="col">Departments</th>
      <th scope="col" class="text-right">Topics</th>
      <th scope="col" class="text-center">Posts</th>
    </tr>
  </thead>
  <tbody>
    <tr class="">
      <td>Computing</td>
      <td class="text-right">0</td>
      <td class="text-center">0</td>
    </tr>
      <tr class="">
      <td>Humanities</td>
      <td class="text-right">0</td>
      <td class="text-center">0</td>
    </tr>
      <tr class="">
      <td>Music</td>
      <td class="text-right">0</td>
      <td class="text-center">0</td>
    </tr>
      <tr class="">
      <td>Medicine</td>
      <td class="text-right">0</td>
      <td class="text-center">0</td>
    </tr>
      <tr class="">
      <td>Business</td>
      <td class="text-right">0</td>
      <td class="text-center">0</td>
    </tr>
  </tbody>
</table>

        </div>

</asp:Content>
