<%@ Page Title="Feed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feed.aspx.cs" Inherits="WebEnterprise.Feed" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 align="center">News Feed</h2>
    <h3 align="center">You may add, view or comment on posts.</h3>

    <div align="center" class="jumbotron">
    <p><form id="submitForm" class="form-horizontal">
  <fieldset>

    <legend>Submit a post</legend>

    <div class="form-group">
        <!-- Trigger the modal with a button -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Submit a post</button>
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content bigModal">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Insert post information below</h4>
      </div>
      <div class="modal-body">
          <%-- Title--%>
      <label for="inputTitle" class="col-lg-2 control-label">Title:</label>
      <div class="col-lg-10">
          <asp:TextBox  class="form-control" ID="inputTitle" runat="server" placeholder="Title"></asp:TextBox>
      </div>
      <br/><br/>
           <%-- Body--%>
      <label for="inputBody" class="col-lg-2 control-label">Body:</label>
      <div class="col-lg-10">
          <asp:TextBox  class="form-control" ID="inputBody" runat="server" placeholder="Body"></asp:TextBox>
      </div>
      <br/><br/>
           <%-- Description--%>
      <label for="inputDescription" class="col-lg-2 control-label">Description:</label>
      <div class="col-lg-10">
          <asp:TextBox  class="form-control" ID="inputDescription" runat="server" placeholder="Description" TextMode="MultiLine"></asp:TextBox>
      </div>
          <br/><br/>
           <%-- Category--%>
      <label for="inputCategory" class="col-lg-2 control-label">Category:</label>
       <div class="col-lg-10">
        <select multiple="" id="feedSelect" name="feedSelect" class="form-control">
          <option>1</option>
          <option>2</option>
          <option>3</option>
          <option>4</option>
          <option>5</option>
        </select>
      </div>
    </div>
      <br/><br/><br/><br/><br/>
   

      </div>
      <br/><br/>
          
          
          
  
    <br/><br/><br/><br/>

    

      <div class="form-group">
      <label for="inputImage" class="col-lg-2 control-label">Image upload:</label>
      <div class="col-lg-10">
        <input type="file"  class="form-control" name="inputImage" id="inputImage">
      </div>
    </div>
      <br/><br/>
      <div class="form-group">
      <label class="col-lg-2 control-label">Would you like this post to be done anonymously?</label>
      <div class="col-lg-10">
        <div class="radio">
          <label>
            <input type="radio" name="optionsRadios" id="optionsRadios1" value="1">
            Yes
          </label>
        </div>
        <div class="radio">
          <label>
            <input type="radio" name="optionsRadios" id="optionsRadios2" value="2" checked="">
            No
          </label>
        </div>
      </div>
    </div>

    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button id="formSubmit" OnClick="formSubmit_Click" name="formSubmit" type="submit" class="btn btn-primary">Submit</button>
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

</fieldset>      
      
</form> 
        
        </p>
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
