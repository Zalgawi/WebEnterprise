﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DepartmentSelectForum.aspx.cs" Inherits="WebEnterprise.Pages.DepartmentSelectForum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h2 class="text-center">Select Department</h2>
    <h3 class="text-center">You may only access a department that you are a part of.</h3>
    <h4 class="text-center">(If there are any issues, please get in touch with the administration)</h4>

    <div  class="jumbotron">

        <table class="table table-hover">
  <thead>
    <tr class="table-primary">
      <th scope="col">Departments</th>
      <th scope="col">Topics</th>
      <th scope="col">Posts</th>
    </tr>
  </thead>
  <tbody>
    <tr class="table-light">
      <td>Computing</td>
      <td>0</td>
      <td>0</td>
    </tr>
      <tr class="table-light">
      <td>Humanities</td>
      <td>0</td>
      <td>0</td>
    </tr>
      <tr class="table-light">
      <td>Music</td>
      <td>0</td>
      <td>0</td>
    </tr>
      <tr class="table-light">
      <td>Medicine</td>
      <td>0</td>
      <td>0</td>
    </tr>
      <tr class="table-light">
      <td>Business</td>
      <td>0</td>
      <td>0</td>
    </tr>
  </tbody>
</table>

        </div>

</asp:Content>
