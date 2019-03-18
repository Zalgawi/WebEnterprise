<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="subComputing.aspx.cs" Inherits="WebEnterprise.Pages.Departments.Computing.subComputing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div  class="jumbotron">

        <%--<table class="table table-hover" align="center">
  <thead>
    <tr class="table-primary">
      <th scope="col" style="width: 1593px">Departments</th>
      <th scope="col" class="text-center">Views</th>
      <th scope="col" class="text-center">Comments</th>
      <th scope="col" class="text-center">Likes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="width: 1600px">
          <a class="TableHyperlink" href="/Pages/Departments/Computing/SubComputing" style="width:inherit">
              <h5>-insert post name-</h5>
          </a>
      </td>

      <td class="text-center">
          <h5>0</h5>
      </td>
      <td class="text-center">
              <h5>0</h5>
      </td>
        <td class="text-center">
              <h5>0</h5>
      </td>
    </tr>
      <tr>
      <td style="width: 1600px">
          <a class="TableHyperlink" href="~/Pages/Departments/Computing/SubHumanities" style="width:inherit">
              <h5>-insert post name-</h5>
          </a>
      </td>
      <td class="text-center">
          <h5>0</h5>
      </td>
      <td class="text-center">
              <h5>0</h5>
      </td>
          <td class="text-center">
              <h5>0</h5>
      </td>
    </tr>
      <tr>
      <td style="width: 1600px">
          <a class="TableHyperlink" href="~/Pages/Departments/Computing/SubMusic" style="width:inherit">
              <h5>-insert post name-</h5>
          </a>
      </td>
      <td class="text-center">
          <h5>0</h5>
      </td>
      <td class="text-center">
              <h5>0</h5>
      </td>
          <td class="text-center">
              <h5>0</h5>
      </td>
    </tr>
      <tr>
      <td style="width: 1600px">
          <a class="TableHyperlink" href="~/Pages/Departments/Computing/SubMedicine" style="width:inherit">
              <h5>-insert post name-</h5>
          </a>
      </td>
      <td class="text-center">
          <h5>0</h5>
      </td>
      <td class="text-center">
              <h5>0</h5>
      </td>
          <td class="text-center">
              <h5>0</h5>
      </td>
    </tr>
      <tr>
      <td style="width: 1600px">
          <a class="TableHyperlink" href="~/Pages/Departments/Computing/SubBusiness" style="width:inherit">
              <h5>-insert post name-</h5>
          </a>
      </td>
      <td class="text-center">
          <h5>0</h5>
      </td>
      <td class="text-center">
              <h5>0</h5>
      </td>
          <td class="text-center">
              <h5>0</h5>
      </td>
    </tr>
  </tbody>
</table>--%>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [postTitle], [postCategory], [postDate] FROM [Posts]"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="525px">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="postTitle" HeaderText="postTitle" SortExpression="postTitle" />
                <asp:BoundField DataField="postCategory" HeaderText="postCategory" SortExpression="postCategory" />
                <asp:BoundField DataField="postDate" HeaderText="postDate" SortExpression="postDate" />
            </Columns>
        </asp:GridView>

        </div>
</asp:Content>
