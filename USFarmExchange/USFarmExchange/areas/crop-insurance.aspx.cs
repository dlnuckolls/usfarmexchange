using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USFarmExchange.areas
{
    public partial class crop_insurance : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            Hide_Panels();
            Display_Panel(UnderstandingCropInsurance);
            btnPrevious.Enabled = false;
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (UnderstandingCropInsurance.Visible)
            {
                Hide_Panels();
                Display_Panel(CropInsuranceCycle);
                btnPrevious.Enabled = true;
                return;
            }
            if (CropInsuranceCycle.Visible)
            {
                Hide_Panels();
                Display_Panel(Competition);
                return;
            }

        }
        private void Hide_Panels() {
            UnderstandingCropInsurance.Visible = false;
            CropInsuranceCycle.Visible = false;
            Competition.Visible = false;
            History.Visible = false;
            Glossary.Visible = false;
         }

        private void Display_Panel(Panel panel )
        {
            panel.Visible = true;
        }

    }

}