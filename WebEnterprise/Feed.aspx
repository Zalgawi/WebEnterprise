<%@ Page Title="Feed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feed.aspx.cs" Inherits="WebEnterprise.Feed" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" />
   
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>



    <h2 class="text-center" style="margin-left: 40px">News Feed</h2>
    <h3 class="text-center" >You may add, view or comment on posts.</h3>

    <%------MODAL BOX------%>

    <!-- Trigger the modal with a button -->
    <div align="center">
<button type="button" class="btn btn-info btn-lg text-center" data-toggle="modal" data-target="#submitPostModal">Submit a suggestion</button>
        </div>

<!-- Modal -->
<div id="submitPostModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title text-center">Submit Idea</h3>
  </div>
  <div class="panel-body">
     <table border="0" class="nav-justified">
          <tr>
              <td style="width: 435px">
      <label for="inputTitle" class="col-lg-2 control-label">Title:</label></td>
              <td style="width: 187px">      
          <asp:TextBox class="form-control" ID="inputTitle" runat="server" placeholder="Title" Width="569px"></asp:TextBox>

              </td>
              <td>      
                  <asp:RequiredFieldValidator controltovalidate="inputTitle" ID="TitleValidator" runat="server" ErrorMessage="*Title is required" ForeColor="Red"></asp:RequiredFieldValidator>      

              </td>
          </tr>
          <tr>
              <td style="width: 435px">
                  &nbsp;</td>
              <td style="width: 187px">&nbsp;</td>
              <td>      
                  &nbsp;</td>
          </tr>
          <tr>
              <td style="height: 21px; width: 435px;">
      <label for="inputBody" class="col-lg-2 control-label">Body:</label></td>
              <td style="height: 21px; width: 187px;">    
         <asp:TextBox Width="400px" style="resize:none;" class="form-control" ID="inputBody" runat="server" placeholder="Body" TextMode="MultiLine"></asp:TextBox>
              </td>
              <td style="height: 21px"><asp:RequiredFieldValidator controltovalidate="inputBody" ID="BodyValidator" runat="server" ErrorMessage="*Body is required" ForeColor="Red"></asp:RequiredFieldValidator>    
              </td>
          </tr>
          <tr>
              <td style="height: 21px; width: 435px;">&nbsp;</td>
              <td style="height: 21px; width: 187px;">&nbsp;</td>
              <td style="height: 21px">&nbsp;</td>
          </tr>
          <tr>
              <td style="width: 435px; height: 63px;">
      
      <label for="inputCategory" class="col-lg-2 control-label">Category:</label></td>
              <td style="width: 187px; height: 63px;">    

      <asp:DropDownList class="form-control" ID="inputCategory" runat="server" Width="270px">
          <asp:ListItem Value="Suggestion">Suggestion</asp:ListItem>
          <asp:ListItem Value="Events">Events</asp:ListItem>
          <asp:ListItem Value="Education">Education</asp:ListItem>
          <asp:ListItem Value="Other">Other</asp:ListItem>
      </asp:DropDownList>



              </td>
              <td style="height: 63px"><asp:RequiredFieldValidator controltovalidate="inputAnonymous" ID="categoryValidator" runat="server" ErrorMessage="*Please select a category" ForeColor="Red"></asp:RequiredFieldValidator>    

              </td>
          </tr>
          <tr>
              <td style="width: 435px; height: 21px;"></td>
              <td style="width: 187px; height: 21px;"></td>
              <td style="height: 21px"></td>
          </tr>
          <tr>
              <td style="width: 435px; height: 21px;">
      
      <label for="inputFiles" class="col-lg-2 control-label">Upload file:</label></td>
              <td style="width: 187px; height: 21px;">
                  <asp:FileUpload ID="inputFiles" class="form-control-file" runat="server" />
              </td>
              <td style="height: 21px"></td>
          </tr>
          <tr>
              <td style="width: 435px">&nbsp;</td>
              <td style="width: 187px">&nbsp;</td>
              <td>&nbsp;</td>
          </tr>
          <tr>
              <td style="width: 435px">    
      <label for="inputAnonymous" class="col-lg-2 control-label" style="left: 0px; top: 0px; width: 466px">Would you like this post to be submitted anonymously?:</label></td>
              <td style="width: 187px">    
      <asp:RadioButtonList ID="inputAnonymous" runat="server" BorderStyle="None" CellPadding="0" CellSpacing="0">
        <asp:ListItem Value="1" Text="Yes">Yes</asp:ListItem>
        <asp:ListItem Value="0" Text="No">No</asp:ListItem>
    </asp:RadioButtonList>


              </td>
              <td><asp:RequiredFieldValidator controltovalidate="inputAnonymous" ID="AnonymousValidator" runat="server" ErrorMessage="*Please select an option" ForeColor="Red"></asp:RequiredFieldValidator>    
              </td>
          </tr>
          <tr>
              <td style="width: 435px">&nbsp;</td>
              <td style="width: 187px">&nbsp;</td>
              <td>&nbsp;</td>
          </tr>
          <tr>
              <td style="width: 435px">
      <label for="inputTaC" class="col-lg-2 control-label" style="left: 0px; top: 10px; width: 369px">By ticking the following box, you are declaring that you agree to the terms and conditions:</label></td>
              <td style="width: 187px">
      <asp:CheckBox ID="inputTaC" runat="server" />

     
              </td>
              <td>&nbsp;</td>
          </tr>
          <tr>
              <td style="width: 435px">&nbsp;</td>
              <td style="width: 187px">&nbsp;</td>
              <td>&nbsp;</td>
          </tr>
          <tr>
              <td style="width: 435px" class="text-right">
        <button type="reset" class="btn btn-default">Cancel</button>
              </td>
              <td style="width: 187px">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button  class="btn btn-default" ID="formSubmitBtn" runat="server" autopostback="false" onclick="AddPost" Text="Submit" />
              </td>
          </tr>
      </table>
       <div class="col-lg-10 col-lg-offset-2">
      </div>

  </div>
</div>
    

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

    <%---------------------------------------------------------------%>
    <%---------------------------------------------------------------%>

    

    <div  class="jumbotron">

    <table data-page-length="5" class="display responsive no-wrap"" id="postsTable">
        <thead>
            <tr>
                <th>Likes</th>
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
         //alert("Feed page");
         $('#postsTable').DataTable({
             "bLengthChange": false,
              responsive: true,
            ajax: {
                url: "/api/posts/GetDataTables",
                type: "GET",
                
                dataType: "json",
                dataSrc: ""
            },
            columns: [  
                {
                    data: "postLikes",
                    "defaultContent": "<button>Not set</button>"
                },
                
                {
                    render: function (data, type, row, meta)
                    {
                        return '<a href="/PostDisplay?id=' + row.postId.toString() + '">' + row.postTitle+'</a>';
                    }
                },

                {data: "postCategory"},
                {
                    render: function (data, type, row, meta) {

                        var date = new Date(row.postDate);

                        return date.toLocaleString();           

                    }
                },
                
            ]
        });
    });
</script>



       
</asp:Content>
