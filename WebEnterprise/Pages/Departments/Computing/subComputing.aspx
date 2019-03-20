<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="subComputing.aspx.cs" Inherits="WebEnterprise.Pages.Departments.Computing.subComputing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../../Scripts/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" />


    


<div  class="jumbotron">

    <table class="display" id="postsTable">
        <thead>
            <tr>
                <th>Title</th>
                <th>Category</th>
                <th>Date</th>
                
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
  <br />

</div>
<asp:HiddenField id="depId" runat="server" /> 
 <script type="text/javascript">


     var department = $('#depId').val();
    $(document).ready(function () {
        $('#postsTable').DataTable({
            pageLength: "5",
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
</asp:Content>
