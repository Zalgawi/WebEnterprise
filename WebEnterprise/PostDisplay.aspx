<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PostDisplay.aspx.cs" Inherits="WebEnterprise.PostDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">

        <br />
        <asp:Label class="label label-default" ID="outputAnonymous" runat="server"></asp:Label>
        <br />
        <asp:Label class="label label-default" ID="outputlikeORdislike" runat="server"></asp:Label>
        <div id="outputTitleContainer" class="text-center"><asp:Label class="label label-default" ID="outputTitle" runat="server" style="font-size: xx-large"></asp:Label></div>
        <br />
        <div id="outputUserIdContainer" class="text-center"><asp:Label class="label label-default" ID="outputId" runat="server" style="font-size: x-large"></asp:Label></div>
        <br />
</div>

    <div class="jumbotron">
        <div id="outputBodyContainer" class="text-center"><asp:Label class="label label-default" ID="outputBody" runat="server" style="font-size: medium"></asp:Label></div>
        <hr class="my-4">
        <div id="outputCategoryContainer" class="text-center"><asp:Label class="label label-default" ID="outputCategory" runat="server" style="font-size: x-small"></asp:Label></div>
</div>

    <div class="jumbotron">
        <fieldset>
            <h3 class="panel-title" style="text-align: center">Add Comment</h3>
         <%--------------------------------------
          Inserting Comment Information
          --------------------------------------%>


    
      
     <%-- Body--%>
      <label for="commentBody" class="col-lg-2 control-label">Comment:</label><asp:RequiredFieldValidator controltovalidate="commentBody" ID="commentBodyValidator" runat="server" ErrorMessage="*Comment is required" ForeColor="Red"></asp:RequiredFieldValidator>    
         <asp:TextBox Width="400px" style="resize:none;" class="form-control" ID="commentBody" runat="server" placeholder="Body" TextMode="MultiLine"></asp:TextBox>
          <br />      
    <%--Anonymous--%>    
      <label for="commentAnonymous" class="col-lg-2 control-label">Would you like this comment to be submitted anonymously?:</label><asp:RequiredFieldValidator controltovalidate="commentAnonymous" ID="commentAnonymousValidator" runat="server" ErrorMessage="*Please select an option" ForeColor="Red"></asp:RequiredFieldValidator>    
      <asp:RadioButtonList ID="commentAnonymous" runat="server" BorderStyle="None" CellPadding="0" CellSpacing="0">
        <asp:ListItem Value="1" Text="Yes">Yes</asp:ListItem>
        <asp:ListItem Value="0" Text="No">No</asp:ListItem>
    </asp:RadioButtonList>  
    <br />
    <%-- submit button --%>
    <div>
        <br />
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
          <asp:Button  class="btn btn-default" ID="commentSubmitBtn" runat="server" autopostback="false" onclick="AddComment" Text="Submit" />
      </div>
    </div>
        </fieldset>
   </div>

</asp:Content>
