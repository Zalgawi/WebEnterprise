<%@ Page Title="Feed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feed.aspx.cs" Inherits="WebEnterprise.Feed" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center">News Feed</h2>
    <h3 class="text-center" >You may add, view or comment on posts.</h3>

    <div class="jumbotron">
         <div class="form-horizontal">
  <fieldset>

      <%--------------------------------------
          Inserting Post Information
      --------------------------------------%>

  <div class="panel-heading">
    <h3 class="panel-title" style="text-align: center">Add Post</h3>
  </div>
  <div class="panel-body">
  <div>
      
      <%-- Title--%>
      <label for="inputTitle" class="col-lg-2 control-label">Title:</label>
      <div class="col-lg-10">
          <asp:TextBox  class="form-control" ID="inputTitle" runat="server" placeholder="Title"></asp:TextBox>
          <br />
      </div>
        <%-- Body--%>
      <label for="inputBody" class="col-lg-2 control-label">Body:</label>
      <div class="col-lg-10">
          <asp:TextBox  class="form-control" ID="inputBody" runat="server" placeholder="Body"></asp:TextBox>
          <br />
      </div>
       <%-- Description--%>
      <label for="inputDescription" class="col-lg-2 control-label">Description:</label>
      <div class="col-lg-10">
          <asp:TextBox  class="form-control" ID="inputDescription" runat="server" placeholder="Description"></asp:TextBox>
          <br />
      </div>
       <%-- Category--%>
      <label for="inputCategory" class="col-lg-2 control-label">Category:</label>
          <asp:ListBox class="form-control" runat="server" id="inputCategory" SelectionMode="Multiple" Width="319px" >
  <asp:ListItem Value="Suggestion" Text="Suggestion">Suggestion</asp:ListItem>
  <asp:ListItem Value="Events" Text="Events">Events</asp:ListItem>
  <asp:ListItem Value="Other" Text="Other">Other</asp:ListItem>
</asp:ListBox>
      <br />
       <%--Anonymous--%>
      <label for="inputAnonymous" class="col-lg-2 control-label">Would you like this post to be done anonymously?:</label>
          <asp:RadioButtonList ID="inputAnonymous" runat="server">
        <asp:ListItem Value="1" Text="Yes">Yes</asp:ListItem>
        <asp:ListItem Value="0" Text="No">No</asp:ListItem>
    </asp:RadioButtonList>
   
     
    <div>
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
          <asp:Button ID="formSubmitBtn" runat="server" autopostback="false" onclick="AddPost" Text="Button" />
      </div>
    </div>
       
    </div>    <
  </div>
        </fieldset>
             </div>
</div>
      
     

 

  

     


    <div align="center" class="jumbotron">
  <h3>View posts</h3>
    <div class="card" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="card-link">Card link</a>
    <a href="#" class="card-link">Another link</a>
  </div>
</div>
  <div>
  <ul class="pagination pagination-sm">
  <li class="disabled"><a href="#">&laquo;</a></li>
  <li class="active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#">&raquo;</a></li>
      </div>
</ul>
</div>
   
        
</asp:Content>
