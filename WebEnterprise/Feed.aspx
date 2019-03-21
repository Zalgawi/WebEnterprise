<%@ Page Title="Feed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feed.aspx.cs" Inherits="WebEnterprise.Feed" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center" style="margin-left: 40px">News Feed</h2>
    <h3 class="text-center" >You may add, view or comment on posts.</h3>

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
                  <asp:RequiredFieldValidator controltovalidate="inputTitle" ID="TitleValidator0" runat="server" ErrorMessage="*Title is required" ForeColor="Red"></asp:RequiredFieldValidator>      

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
              <td style="width: 435px">
      
      <label for="inputCategory" class="col-lg-2 control-label">Category:</label></td>
              <td style="width: 187px">    

      <asp:DropDownList class="form-control" ID="inputCategory" runat="server" Width="270px">
          <asp:ListItem Value="Suggestion">Suggestion</asp:ListItem>
          <asp:ListItem Value="Events">Events</asp:ListItem>
          <asp:ListItem Value="Education">Education</asp:ListItem>
          <asp:ListItem Value="Other">Other</asp:ListItem>
      </asp:DropDownList>

              </td>
              <td><asp:RequiredFieldValidator controltovalidate="inputAnonymous" ID="categoryValidator" runat="server" ErrorMessage="*Please select a category" ForeColor="Red"></asp:RequiredFieldValidator>    

              </td>
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
       
</asp:Content>
