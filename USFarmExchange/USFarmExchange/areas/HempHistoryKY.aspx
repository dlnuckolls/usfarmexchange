<%@ Page Title="" Language="C#" MasterPageFile="~/MasterContentPage.Master" AutoEventWireup="true" CodeBehind="HempHistoryKY.aspx.cs" Inherits="USFarmExchange.areas.HempHistoryKY" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
     <link href="../styles/CropInsurance.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TableOfContents1" runat="server">
</asp:Content>
<asp:Content ID="Column1" ContentPlaceHolderID="MainContent1" runat="server">
    <telerik:RadAjaxPanel runat="server">
          <div id="CropInsurance">
            <asp:Panel ID="KYHempHistory" runat="server">
                <h1>Brief History of Hemp in Kentucky</h1>
                <hr />
                <hr />
                <p>TThe first hemp crop in Kentucky was raised near Danville in 1775.  Kentucky was the greatest producer of U.S. hemp in the 19th and 20th centuries, with thousands of acres of hemp in production, when it was the source of three fourths of U.S. hemp fiber.  Production reached a peak in 1917 at 18,000 acres, mostly grown in the Bluegrass region, then waned after World War I due to market forces, as the rise of tobacco as the cash crop of choice in Kentucky and foreign sources of hemp fiber were introduced.  A Federal program to reintroduce hemp for wartime needs in Kentucky and other states during World War II reached 52,000 acres in Kentucky in 1943.</p>
                <p>In 1970, federal policies virtually banned the production of industrial hemp during the War on Drugs, saying all Cannabis sativa is a Schedule I controlled substance.  Federal law under the Agricultural Act of 2014 allowed research back into hemp.  Kentucky began production again with 33 acres in 2014.  During the 2016 harvest season, only two U.S. states other than Kentucky had over 100 acres in hemp production.  The first 500-acre commercial crop was planted in Harrison County in 2017, and research permits were issued for over 12,000 acres that year.  With the introduction of the 2018 Farm Bill, the rest is history.</p>
               </asp:Panel>
              </div>
        </telerik:RadAjaxPanel>
    </asp:Content>
    <asp:Content ID="Content3" ContentPlaceHolderID="RightColumn1" runat="server">
</asp:Content>
