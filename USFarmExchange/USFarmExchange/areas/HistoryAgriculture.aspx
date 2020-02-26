<%@ Page Title="" Language="C#" MasterPageFile="~/MasterContentPage.Master" AutoEventWireup="true" CodeBehind="HistoryAgriculture.aspx.cs" Inherits="USFarmExchange.areas.HistoryAgriculture" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
    <link href="/styles/CropInsurance.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TableOfContents1" runat="server">
</asp:Content>
<asp:Content ID="Column1" ContentPlaceHolderID="MainContent1" runat="server">
    <telerik:RadAjaxPanel runat="server">
        <div id="CropInsurance">
            <asp:Panel ID="KYHempHistory" runat="server">
                <h1>HISTORY OF AGRICULTURE</h1>
                <hr />
                <hr />
                <p>The history of agriculture is the story of humankind's development and cultivation of processes for producing food, feed, fiber fuel and other goods by the systematic raising of plants and animals. Prior to the development of plant cultivation, human beings were hunters and gatherers.</p>
                <p>The history of agriculture records the domestication of plants and animals and the development of techniques for raising them productively. Agriculture began independently in different parts of the globe, and included a diverse range of plants.  Fast forward from 20,000 BC, when agriculture was transformed in the Middle Ages with improved techniques and the diffusion of crop plants, including the introduction of sugar, rice, cotton and fruit trees to Europe.  After the voyages of Christopher Columbus in 1492, the Columbian exchange brought New World crops such as maize, potatoes, sweet potatoes and manioc to Europe, and Old World crops such as wheat, barley, rice and turnips, and livestock including horses, cattle, sheep and goats to the Americas.</p>
                <p>Irrigation, crop rotation and fertilizers were introduced soon after the First Agricultural Revolution, which is thought to have been around 12,000 years ago, and developed much further in the past 200 years.  Since 1900, agriculture in the developed nations has seen large rises in productivity as human labor has been replaced by mechanization, and assisted by synthetic fertilizers, pesticides and selective breeding.  Modern agriculture has raised social, political and environmental issues including water pollution, biofuels, genetically modified organisms, tariffs and farm subsidies. In response, organic farming developed in the twentieth century as an alternative to the use of synthetic pesticides.</p>
                <p>As you can see, agriculture has been ever-evolving since mankind advanced from being hunters and gatherers.</p>
                <br />
                <br />
            </asp:Panel>
        </div>
    </telerik:RadAjaxPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightColumn1" runat="server">
</asp:Content>
