<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DepartmentSelectForum.aspx.cs" Inherits="WebEnterprise.Pages.DepartmentSelectForum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h2 class="text-center">Select Department</h2>
    <h3 class="text-center">You may only access a department that you are a part of.</h3>
    <h4 class="text-center">(If there are any issues, please get in touch with the administration)</h4>

    <div  class="jumbotron">

        <table class="table table-hover" align="center">
  <thead>
    <tr class="table-primary">
      <th scope="col" style="width: 1593px">Departments</th>
      <th scope="col" class="text-center">Topics</th>
      <th scope="col" class="text-center">Posts</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="width: 1600px">
          <a class="TableHyperlink" href="/Pages/Departments/Computing/SubComputing" style="width:inherit">
              <h5>Computing</h5>
          </a>
      </td>
      <td class="text-center">
          <h5>0</h5>
      </td>
      <td class="text-center">
              <h5>0</h5>
      </td>
    </tr>
      <tr>
      <td style="width: 1600px">
          <a class="TableHyperlink" href="~/Pages/Departments/Computing/SubHumanities" style="width:inherit">
              <h5>Humanities</h5>
          </a>
      </td>
      <td class="text-center">
          <h5>0</h5>
      </td>
      <td class="text-center">
              <h5>0</h5>
      </td>
    </tr>
      <tr>
      <td style="width: 1600px">
          <a class="TableHyperlink" href="~/Pages/Departments/Computing/SubMusic" style="width:inherit">
              <h5>Music</h5>
          </a>
      </td>
      <td class="text-center">
          <h5>0</h5>
      </td>
      <td class="text-center">
              <h5>0</h5>
      </td>
    </tr>
      <tr>
      <td style="width: 1600px">
          <a class="TableHyperlink" href="~/Pages/Departments/Computing/SubMedicine" style="width:inherit">
              <h5>Medicine</h5>
          </a>
      </td>
      <td class="text-center">
          <h5>0</h5>
      </td>
      <td class="text-center">
              <h5>0</h5>
      </td>
    </tr>
      <tr>
      <td style="width: 1600px">
          <a class="TableHyperlink" href="~/Pages/Departments/Computing/SubBusiness" style="width:inherit">
              <h5>Business</h5>
          </a>
      </td>
      <td class="text-center">
          <h5>0</h5>
      </td>
      <td class="text-center">
              <h5>0</h5>
      </td>
    </tr>
  </tbody>
</table>

        </div>

</asp:Content>
