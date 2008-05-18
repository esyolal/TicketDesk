﻿<%@ Page Language="C#" Theme="TicketDeskTheme" MasterPageFile="~/TicketDeskMain.Master"
    AutoEventWireup="true" CodeBehind="TicketCenter2.aspx.cs" Inherits="TicketDesk.TicketCenter2"
    Title="Untitled Page" %>

<%@ Register Src="Controls/ListViewSettingsEditor.ascx" TagName="ListViewSettingsEditor"
    TagPrefix="ticketDesk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <%  // TicketDesk - Attribution notice
        // Contributor(s):
        //
        //      Stephen Redd (stephen@reddnet.net, http://www.reddnet.net)
        //
        // This file is distributed under the terms of the Microsoft Public 
        // License (Ms-PL). See http://www.codeplex.com/TicketDesk/Project/License.aspx
        // for the complete terms of use. 
        //
        // For any distribution that contains code from this file, this notice of 
        // attribution must remain intact, and a copy of the license must be 
        // provided to the recipient.
    %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
    <ticketDesk:ListViewSettingsEditor ID="ListViewSettingsEditorControl" OnSettingsChanged="ListViewSettingsEditorControl_SettingsChanged"
        EnableFilters="false" ListName="Unassigned" runat="server" />
    <div style="clear: both;">
        <asp:ListView ID="TicketListView" runat="server" OnItemCommand="TicketListView_ItemCommand">
            <AlternatingItemTemplate>
                <tr class="TicketListAltRow">
                    <td>
                        <asp:Label ID="TicketIdLabel" runat="server" Text='<%# Eval("TicketId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                    </td>
                    <td style="white-space: normal;">
                        <asp:HyperLink ID="TitleLabel" runat="server" NavigateUrl='<%# string.Format("~/ViewTicket.aspx?id={0}", Eval("TicketId")) %>'
                            Text='<%# Eval("Title") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OwnerLabel" runat="server" Text='<%# TicketDesk.Engine.SecurityManager.GetUserDisplayName((string)Eval("Owner")) %>' />
                    </td>
                    <td>
                        <asp:Label ID="AssignedToLabel" runat="server" Text='<%# TicketDesk.Engine.SecurityManager.GetUserDisplayName((string)Eval("AssignedTo")) %>' />
                    </td>
                    <td>
                        <asp:Label ID="CurrentStatusLabel" runat="server" Text='<%# Eval("CurrentStatus") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PriorityLabel" runat="server" Text='<%# Eval("Priority") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# ((DateTime)Eval("CreatedDate")).ToString("g") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastUpdateDateLabel" runat="server" Text='<%# ((DateTime)Eval("LastUpdateDate")).ToString("g") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <LayoutTemplate>
                <table id="Table1" runat="server" style="width: 100%; margin-top: 0px;" cellpadding="0"
                    cellspacing="0">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" cellpadding="3" class="TicketListTable">
                                <tr id="Tr2" runat="server" class="TicketListHeaderRow">
                                    <th id="Th1" runat="server">
                                        <asp:LinkButton runat="server" CssClass="SortLink" ID="TicketIdSortLink" CommandName="ChangeSort"
                                            CommandArgument="TicketId" Text="ID" />
                                        <asp:ImageButton ID="SortDirectionImageTicketId" runat="server" OnPreRender="SortLinkPreRendering"
                                            CommandName="ChangeSort" CommandArgument="TicketId" EnableViewState="false" />
                                    </th>
                                    <th id="Th2" runat="server">
                                        <asp:LinkButton runat="server" CssClass="SortLink" ID="TypeSortLink" CommandName="ChangeSort"
                                            CommandArgument="Type" Text="Type" />
                                        <asp:ImageButton ID="SortDirectionImageType" runat="server" OnPreRender="SortLinkPreRendering"
                                            CommandName="ChangeSort" CommandArgument="Type" EnableViewState="false" />
                                    </th>
                                    <th id="Th3" runat="server" style="width: 100%; white-space: normal;">
                                        <asp:LinkButton runat="server" CssClass="SortLink" ID="TitleSortLink" CommandName="ChangeSort"
                                            CommandArgument="Title" Text="Title" />
                                        <asp:ImageButton ID="SortDirectionImageTitle" runat="server" OnPreRender="SortLinkPreRendering"
                                            CommandName="ChangeSort" CommandArgument="Title" EnableViewState="false" />
                                    </th>
                                    <th id="Th4" runat="server">
                                        <asp:LinkButton runat="server" CssClass="SortLink" ID="OwnerSortLink" CommandName="ChangeSort"
                                            CommandArgument="Owner" Text="Owner" />
                                        <asp:ImageButton ID="SortDirectionImageOwner" runat="server" OnPreRender="SortLinkPreRendering"
                                            CommandName="ChangeSort" CommandArgument="Owner" EnableViewState="false" />
                                    </th>
                                    <th id="Th5" runat="server">
                                        <asp:LinkButton runat="server" CssClass="SortLink" ID="AssignedToSortLink" CommandName="ChangeSort"
                                            CommandArgument="AssignedTo" Text="Assigned" />
                                        <asp:ImageButton ID="SortDirectionImageAssignedTo" runat="server" OnPreRender="SortLinkPreRendering"
                                            CommandName="ChangeSort" CommandArgument="AssignedTo" EnableViewState="false" />
                                    </th>
                                    <th id="Th6" runat="server">
                                        <asp:LinkButton runat="server" CssClass="SortLink" ID="CurrentStatusSortLink" CommandName="ChangeSort"
                                            CommandArgument="CurrentStatus" Text="Status" />
                                        <asp:ImageButton ID="SortDirectionImageCurrentStatus" runat="server" OnPreRender="SortLinkPreRendering"
                                            CommandName="ChangeSort" CommandArgument="CurrentStatus" EnableViewState="false" />
                                    </th>
                                    <th id="Th7" runat="server">
                                        <asp:LinkButton runat="server" CssClass="SortLink" ID="CategorySortLink" CommandName="ChangeSort"
                                            CommandArgument="Category" Text="Category" />
                                        <asp:ImageButton ID="SortDirectionImageCategory" runat="server" OnPreRender="SortLinkPreRendering"
                                            CommandName="ChangeSort" CommandArgument="Category" EnableViewState="false" />
                                    </th>
                                    <th id="Th8" runat="server">
                                        <asp:LinkButton runat="server" CssClass="SortLink" ID="PrioritySortLink" CommandName="ChangeSort"
                                            CommandArgument="Priority" Text="Priority" />
                                        <asp:ImageButton ID="SortDirectionImagePriority" runat="server" OnPreRender="SortLinkPreRendering"
                                            CommandName="ChangeSort" CommandArgument="Priority" EnableViewState="false" />
                                    </th>
                                    <th id="Th9" runat="server">
                                        <asp:LinkButton runat="server" CssClass="SortLink" ID="CreatedDateSortLink" CommandName="ChangeSort"
                                            CommandArgument="CreatedDate" Text="Created" />
                                        <asp:ImageButton ID="SortDirectionImageCreatedDate" runat="server" OnPreRender="SortLinkPreRendering"
                                            CommandName="ChangeSort" CommandArgument="CreatedDate" EnableViewState="false" />
                                    </th>
                                    <th id="Th10" runat="server">
                                        <asp:LinkButton runat="server" CssClass="SortLink" ID="LastUpdateDateSortLink" CommandName="ChangeSort"
                                            CommandArgument="LastUpdateDate" Text="Updated" />
                                        <asp:ImageButton ID="SortDirectionImageLastUpdateDate" runat="server" CommandName="ChangeSort"
                                            CommandArgument="LastUpdateDate" OnPreRender="SortLinkPreRendering" EnableViewState="false" />
                                    </th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                                <tr class="TicketListPagerRow">
                                    <td colspan="10">
                                        <asp:DataPager ID="TicketListDataPager" runat="server" OnInit="TicketListDataPager_Load">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" ShowNextPageButton="False"
                                                    ShowPreviousPageButton="True" />
                                                <asp:NumericPagerField />
                                                <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ShowNextPageButton="True"
                                                    ShowPreviousPageButton="False" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <EmptyDataTemplate>
                <table id="Table2" runat="server" style="width: 100%; background-color: #FFFFFF;
                    margin-top: 20px; margin-bottom: 10px; border-collapse: collapse; border-color: #999999;
                    border-style: solid; border-width: 1px;">
                    <tr>
                        <td style="width: 100%; height: 75px; padding: 5px;">
                            No data was returned.
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr class="TicketListRow">
                    <td>
                        <asp:Label ID="TicketIdLabel" runat="server" Text='<%# Eval("TicketId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                    </td>
                    <td style="white-space: normal;">
                        <asp:HyperLink ID="TitleLabel" runat="server" NavigateUrl='<%# string.Format("~/ViewTicket.aspx?id={0}", Eval("TicketId")) %>'
                            Text='<%# Eval("Title") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OwnerLabel" runat="server" Text='<%# TicketDesk.Engine.SecurityManager.GetUserDisplayName((string)Eval("Owner")) %>' />
                    </td>
                    <td>
                        <asp:Label ID="AssignedToLabel" runat="server" Text='<%# TicketDesk.Engine.SecurityManager.GetUserDisplayName((string)Eval("AssignedTo")) %>' />
                    </td>
                    <td>
                        <asp:Label ID="CurrentStatusLabel" runat="server" Text='<%# Eval("CurrentStatus") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PriorityLabel" runat="server" Text='<%# Eval("Priority") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# ((DateTime)Eval("CreatedDate")).ToString("g") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastUpdateDateLabel" runat="server" Text='<%# ((DateTime)Eval("LastUpdateDate")).ToString("g") %>' />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>