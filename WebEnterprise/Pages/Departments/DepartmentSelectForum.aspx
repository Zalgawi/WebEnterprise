<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DepartmentSelectForum.aspx.cs" Inherits="WebEnterprise.Pages.DepartmentSelectForum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h2 class="text-center">Select Department</h2>
    <h3 class="text-center">You may only access a department that you are a part of.</h3>
    <h4 class="text-center">(If there are any issues, please get in touch with the administration)</h4>

    <div  class="jumbotron">

        <script src="../../../Scripts/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" />


    


<div  class="jumbotron">

    <table class="display" id="departmentsTable">
        <thead>
            <tr>
                <th>Departments</th>
                <th>Topics</th>
                <th>Posts</th>
                
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
  <br />

</div>
<asp:HiddenField id="departmentselectId" runat="server" /> 
 <script type="text/javascript">


     var department = $('#departmentselectId').val();
    $(document).ready(function () {
        $('#departmentsTable').DataTable({
            ajax: {
                url: "/Pages/Departments/Computing/subComputing.aspx/GetDatatable",
                type: "GET",
                id: { department: department },
                dataSrc: ""
            },
            columns: [
                {data: "postTitle"},
                {data: "postCategory"},
                {data: "postDate"},
                
            ]
        });
    });
</script>

        <%-------------------------------------------------------------------------------------------------%>

  <tbody>
    <tr>
      <td style="width: 1600px">
          <a class="TableHyperlink" href="/Pages/Departments/Computing/subComputing?Department=Computing" style="width:inherit">
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
