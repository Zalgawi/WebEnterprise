<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebEnterprise._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1 class="text-center">Staff Lounge</h1>
        <p class="lead" style="text-align: center">Welcome to the staff&#39;s suggestion lounge. Feel free to post suggestions or ideas that you think would be a good addition to the institution or department. You may also comment on already made posts or give the post a thumbs up or down.</p>
        
            <div align="center">
            <asp:Button ID="viewFeedBtn" class="btn btn-default" runat="server" Text="View Feed" PostBackUrl="~/Feed.aspx"  />
         </div>
                
        
    </div>

    <div class="row" style="height: 78px">
    </div>

</asp:Content>
