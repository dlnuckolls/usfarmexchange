using System;

namespace USFarmExchange
{
    [AttributeUsage(AttributeTargets.Enum)]
    public class CustomEnumAttribute : Attribute
    {
        public bool IsCustomEnum { get; set; }
        public CustomEnumAttribute(bool isCustomEnum) : this() { IsCustomEnum = isCustomEnum; }
        private CustomEnumAttribute() { IsCustomEnum = false; }
    }

    [AttributeUsage(AttributeTargets.Field)]
    class TextValueAttribute : CustomEnumAttribute
    {
        public string Value { get; set; }
        public TextValueAttribute(string textValue) : this() { Value = textValue ?? throw new NullReferenceException("Null not allowed in textValue at TextValue attribute"); }
        private TextValueAttribute() : base(true) => Value = string.Empty;
    }

    [CustomEnum(true)]
    public enum PageNames
    {
        [TextValue("Login Page")] Login,
        [TextValue("US Farm Exchange")] Home,
        [TextValue("About")] About,
        [TextValue("Registration")] Registration,
        [TextValue("Reset Password")] ResetPassword,
        [TextValue("Forgot Password")] ForgotPassword,
        [TextValue("Our Team")] OurTeam,
        [TextValue("Find Events")] Search,
        [TextValue("Questions")] FAQ,
        [TextValue("Contact")] Contact,
        [TextValue("Blog")] Blog,
        [TextValue("Helpful Links")] Resources,
        [TextValue("Podcasts")] Communications,
        [TextValue("Crop Insurance")] CropInsurance,
        [TextValue("Compliance")] Compliance,
        [TextValue("Crop Insurance")] crop,
        [TextValue("Technology")] Technology,
        [TextValue("Education")] Education,
        [TextValue("Insurance")] Insurance,
        [TextValue("Financial Services")] Financial,
        [TextValue("News")] News,
        [TextValue("Partners")] Partners,
        [TextValue("Admin Dashboard")] Admin,
        [TextValue("Page Management")] PageAdmin,
        [TextValue("My Dashboard")] Dashboard,
        [TextValue("Hemp History of KY")] HempHistoryKY,
        [TextValue("Agritourism")] Agritourism,
        [TextValue("Forum")] Forum
    }
    [CustomEnum(true)]
    public enum PageContentBlocks
    {
        [TextValue("4667B33D-BE48-4B7D-816E-D705F1F732C5")] AdminHomeTop,
        [TextValue("06688FA2-EBCB-4F42-9F63-091524C9B839")] AdminHomeToolHeader,
        [TextValue("61175E8D-6131-4789-8989-DC4C4695E711")] PageAdminHeader,
        [TextValue("D42ABA67-51F4-4416-AFA4-A4015551B07C")] DashboardHeader,
        [TextValue("8F9B4D10-6294-45AC-9692-9A29335F1661")] HomePageBottom,
        [TextValue("4BD53B47-C3FB-4290-9A02-A29E099190EC")] CommunicationHomeContent,
        [TextValue("12D27D83-3FE3-4777-B1BE-F0A0F4DF764B")] TechnologyHomeContent,
        [TextValue("7F4E7B55-F845-4A7B-B485-CE98474BB732")] EducationHomeContent,
        [TextValue("EDAD6341-5FEF-48B4-9F07-1F7E6B647E06")] InsuranceHomeContent,
        [TextValue("DD0AE211-21C9-4E3B-A654-101EABB3F4E4")] FinancialServicesHomeContent,
        [TextValue("25CFE0DF-5DDA-48E8-8C1C-091167A99169")] ComplianceHomeContent,
        [TextValue("96463B34-FE4B-4760-BD11-5463AA30DBF6")] PartnersHomeContent,
        [TextValue("D9E75614-BEA8-472D-9A42-E37CAEAA7506")] AboutUsHomeContent,
        [TextValue("84CF66D9-A864-4029-8976-71AB25FD430C")] AgritourismHomeContent,
        [TextValue("D9744A18-D526-45D5-B0F6-B347A4581DBD")] ForumLeft,
        [TextValue("75A0CE6A-A837-4261-B480-240EEABF4D55")] ForumTop,
        [TextValue("329D0E46-3C1E-4B53-9C6C-4CA7BAAE6536")] ResourceLinksContent,
     }
}