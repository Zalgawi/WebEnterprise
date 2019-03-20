<%@ Page Title="Feed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feed.aspx.cs" Inherits="WebEnterprise.Feed" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center" style="margin-left: 40px">News Feed</h2>
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
  
      
      <%-- Title--%>
      <label for="inputTitle" class="col-lg-2 control-label">Title:</label><asp:RequiredFieldValidator controltovalidate="inputTitle" ID="TitleValidator" runat="server" ErrorMessage="*Title is required" ForeColor="Red"></asp:RequiredFieldValidator>      
          <asp:TextBox class="form-control" style="resize:none;" ID="inputTitle" runat="server" placeholder="Title"></asp:TextBox>

          <br />
        <%-- Body--%>
      <label for="inputBody" class="col-lg-2 control-label">Body:</label><asp:RequiredFieldValidator controltovalidate="inputBody" ID="BodyValidator" runat="server" ErrorMessage="*Body is required" ForeColor="Red"></asp:RequiredFieldValidator>    
         <asp:TextBox Width="400px" style="resize:none;" class="form-control" ID="inputBody" runat="server" placeholder="Body" TextMode="MultiLine"></asp:TextBox>
          <br />      
       <%-- Category--%>
      
      <label for="inputCategory" class="col-lg-2 control-label">Category:</label><asp:RequiredFieldValidator controltovalidate="inputAnonymous" ID="categoryValidator" runat="server" ErrorMessage="*Please select a category" ForeColor="Red"></asp:RequiredFieldValidator>    

      <asp:DropDownList class="form-control" ID="inputCategory" runat="server" Width="270px">
          <asp:ListItem Value="Suggestion">Suggestion</asp:ListItem>
          <asp:ListItem Value="Events">Events</asp:ListItem>
          <asp:ListItem Value="Education">Education</asp:ListItem>
          <asp:ListItem Value="Other">Other</asp:ListItem>
      </asp:DropDownList>

      <br />
       <%--Anonymous--%>    
      <label for="inputAnonymous" class="col-lg-2 control-label">Would you like this post to be submitted anonymously?:</label><asp:RequiredFieldValidator controltovalidate="inputAnonymous" ID="AnonymousValidator" runat="server" ErrorMessage="*Please select an option" ForeColor="Red"></asp:RequiredFieldValidator>    
      <asp:RadioButtonList ID="inputAnonymous" runat="server" BorderStyle="None" CellPadding="0" CellSpacing="0">
        <asp:ListItem Value="1" Text="Yes">Yes</asp:ListItem>
        <asp:ListItem Value="0" Text="No">No</asp:ListItem>
    </asp:RadioButtonList>

      <%-- Terms and Conditions tickbox --%>
      <%--MUST DO BACKEND CODE FOR THIS TO ENSURE THE VALIDATION WORKS--%>
      <label for="inputTaC" class="col-lg-2 control-label">By ticking the following box, you are declaring that you agree to the terms and conditions:</label>
      <asp:CheckBox ID="inputTaC" runat="server" />

     
      <%-- submit button --%>
    <div>
        <br />
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
          <asp:Button  class="btn btn-default" ID="formSubmitBtn" runat="server" autopostback="false" onclick="AddPost" Text="Submit" />
      </div>
    </div>
 
  
        </fieldset>
             </div>
</div>

    <%--------------------------------------------------------------------%>

    
        
</asp:Content>
