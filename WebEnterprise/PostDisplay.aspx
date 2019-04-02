    <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PostDisplay.aspx.cs" Inherits="WebEnterprise.PostDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" />
   
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <br /> 
    
    <div class="panel panel-primary">
  <div class="panel-body">

        <div id="outputTitleContainer" class="text-center"><asp:Label class="label label-primary" ID="outputTitle" runat="server" style="font-size: xx-large"></asp:Label></div>
                <hr>
        <div id="outputUserIdContainer" class="text-center"><asp:Label class="label label-primary" ID="outputId" runat="server" style="font-size: medium"></asp:Label></div>
                <hr>
       
  
<div id="outputBodyContainer" class="text-center"><asp:Label class="label label-primary" ID="outputBody" runat="server" style="font-size: medium"></asp:Label></div>
        <hr>
        <div id="outputCategoryContainer" class="text-center"><asp:Label class="label label-primary" ID="outputCategory" runat="server" style="font-size: x-small"></asp:Label></div> 
     <hr>
      <div id="imagesContainer" class="text-center"></div>
  </div>
</div>
        <div align="center">
            
    <asp:Button ID="btnLike" class="btn btn-primary" runat="server" Text="👍 Like" Width="99.99px" CausesValidation="false"  OnClick="btnLike_Click" />&nbsp <asp:Button ID="btnUnlike" visible="false" Enabled="false" Text="👍 UnLike" class="btn btn-primary" runat="server" CausesValidation="false" OnClick="btnUnlike_Click" />
    <br />
    <asp:Button ID="btnDislike" CausesValidation="false" Width="99.99px" class="btn btn-primary" runat="server" Text="Dislike 👎" OnClick="btnDislike_Click"  />&nbsp<asp:Button ID="btnUndislike" Enabled="false" visible="false" class="btn btn-primary" Text="UnDislike 👎" CausesValidation="false" runat="server" OnClick="btnUndislike_Click" />
        </div>
    <br />
         <%--------------------------------------
          Inserting Comment Information
          --------------------------------------%>
 <div class="col-md-12">
            <div class="panel panel-primary">
                  <div class="panel-heading">
    <h3 class="panel-title text-center">Add Comment</h3>
  </div>

  <div class="panel-body">


      <fieldset>
      <table class="nav-justified">
          <tr>
              <td class="modal-sm" style="width: 237px; height: 21px;">
      <label for="commentBody" class="col-lg-2 control-label">Comment:</label></td>
              <td style="width: 434px; height: 21px;">    
         <asp:TextBox Width="400px" style="resize:none;" class="form-control" ID="commentBody" runat="server" placeholder="Body" TextMode="MultiLine"></asp:TextBox>
              </td>
              <td style="height: 21px">    
                  <asp:RequiredFieldValidator controltovalidate="commentBody" ID="commentBodyValidator" runat="server" ErrorMessage="*Comment is required" ForeColor="Red"></asp:RequiredFieldValidator>    
              </td>
          </tr>
          </table>
      <br />
      <table class="nav-justified">
          <tr>
              <td style="height: 21px; width: 511px">    
      <label for="commentAnonymous" class="col-lg-2 control-label" style="left: 0px; top: 0px; width: 538px">Would you like this comment to be submitted anonymously?:</label></td>
              <td style="height: 21px; width: 104px">    
      <asp:RadioButtonList ID="commentAnonymous" runat="server" BorderStyle="None" CellPadding="0" CellSpacing="0">
        <asp:ListItem Value="1" Text="Yes">Yes</asp:ListItem>
        <asp:ListItem Value="0" Text="No">No</asp:ListItem>
    </asp:RadioButtonList>  
              </td>
              <td style="height: 21px"><asp:RequiredFieldValidator controltovalidate="commentAnonymous" ID="commentAnonymousValidator" runat="server" ErrorMessage="*Please select an option" ForeColor="Red"></asp:RequiredFieldValidator>    
              </td>
          </tr>
      </table>
      <br />
      <table class="nav-justified">
          <tr>
              <td class="modal-sm" style="width: 408px">&nbsp;</td>
              <td>
        <button type="reset" class="btn btn-default">Cancel</button>
          <asp:Button  class="btn btn-default" ID="commentSubmitBtn" runat="server" autopostback="false" onclick="AddComment" Text="Submit" />
              </td>
              <td>&nbsp;</td>
          </tr>
      </table>
          </fieldset>
                      <hr>

      <table class="display" id="commentsTable">
        <thead>
            <tr>
                <th>Comment</th>
                <th>User</th>
                <th>Date</th>
                
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>


  </div>
</div>
     </div>

    <asp:HiddenField runat="server" ID="postIdHidden" />
    <script>
        $(document).ready(function () {
            var postId = $('#<%= postIdHidden.ClientID %>').val();
            
            $.ajax({
                type: "GET",
                url: "/api/posts/GetPost",
                data: { id: postId },
                success: function (data) {
                    //alert("succeeded");
                    $('#MainContent_outputTitle').html(data.post.postTitle);

                    var email = "Anonymous User";
                    if (data.post.Email != "") {
                        email = data.Email;
                    }
                    
                    $('#MainContent_outputId').html(data.post.Email);

                    $('#MainContent_outputBody').html(data.post.postBody);
                    $('#MainContent_outputCategory').html(data.post.postCategory);

                    var imageContainer = $('#imagesContainer');

                    if (data.images != null)
                    {
                        data.images.forEach(function(image) {

                            imageContainer.append('<p><img src="'+image.filePath+'"/></p><br/>')

                                                 });
                    }
                },
                error: function (data) {
                    // alert('error: '+JSON.stringify(data));
                },
            });

            $('#commentsTable').DataTable({
             "bLengthChange": false,
             pageLength: "5",
            ajax: {
                type: "GET",
                url: "/api/posts/GetComments",
                data: { Id: postId },
                dataType: "json",
                dataSrc: ""
            },
            columns: [
                {data: "commentBody"},
                {
                    render: function (data, type, row, meta) {

                        var returnString = "";

                        if (row.Email == "") {
                            returnString = 'Anonymous User';
                        } else {
                            returnString = row.Email;
                        }
                        return returnString;
                    }
                },
                {
                    render: function (data, type, row, meta) {

                        var date = new Date(row.commentDate);

                        return date.toLocaleString();         
                    }
                },                
            ]
        });

        });
    </script>

    
  <br />

 
</asp:Content>
