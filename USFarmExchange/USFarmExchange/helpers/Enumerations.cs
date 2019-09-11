using System;

namespace USFarmExchange {
  [AttributeUsage(AttributeTargets.Enum)]
  public class CustomEnumAttribute :Attribute {
    public bool IsCustomEnum { get; set; }
    public CustomEnumAttribute(bool isCustomEnum) : this() { IsCustomEnum = isCustomEnum; }
    private CustomEnumAttribute() { IsCustomEnum = false; }
  }

  [AttributeUsage(AttributeTargets.Field)]
  class TextValueAttribute :CustomEnumAttribute {
    public string Value { get; set; }
    public TextValueAttribute(string textValue) : this() { Value = textValue ?? throw new NullReferenceException("Null not allowed in textValue at TextValue attribute"); }
    private TextValueAttribute() : base(true) => Value = string.Empty;
  }

  [CustomEnum(true)]
  public enum PageNames {
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
    [TextValue("Resources")] Resources,
    [TextValue("Communication")] Communications,
    [TextValue("Crop Insurance")] CropInsurance
    
    }
}