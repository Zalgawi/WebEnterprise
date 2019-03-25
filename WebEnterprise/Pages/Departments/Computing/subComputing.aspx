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
 <asp:HiddenField id="deptName" runat="server"/>
 <script type="text/javascript">


     
     $(document).ready(function () {
         
        $('#postsTable').DataTable({
            pageLength: "5",
            ajax: {
                url: "/api/posts/GetDatatables",
                type: "GET",
                
                dataType: "json",
                dataSrc: ""
            },
            columns: [
                {
                    render: function (data, type, row, meta) {

                        return '<a href="/PostDisplay/LoadPost?postId="' + row.postId + '">' + row.postTitle+'</a>';

                    }
                },
                {data: "postCategory"},
                {data: "postDate"},
                
            ]
        });
    });
</script>
</asp:Content>
