using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cpmtact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void clearForm()
    {
        foreach (object ctrl in Page.Controls)
        {

            if (ctrl is System.Web.UI.HtmlControls.HtmlForm)
            {

                System.Web.UI.HtmlControls.HtmlForm form = (System.Web.UI.HtmlControls.HtmlForm)ctrl;

                foreach (object subctrl in form.Controls)
                {

                    if (subctrl is System.Web.UI.WebControls.TextBox)
                    {

                        TextBox textctrl = (TextBox)subctrl;

                        textctrl.Text = "";

                    }

                }

            }

        }
    }
    protected void BtnSend_Click(object sender, EventArgs e)
    {        
        string companyName = iptCompany.Value;
        string name = iptName.Value;
        string tel = iptNumber.Value;
        string phone = iptPhone.Value;
        string fax = iptFax.Value;
        string mail = iptEmail.Value;
        string address = iptAddress.Value;
        string webSite = iptWebSite.Value;
        string optionItem = sltOption.Value;
        string message = txtMessage.Value;
        string keyword = sltKeyword.Value;

        string content = "公司名稱：" + companyName + "<p/>聯絡人：" + name + "<p/>客戶電話：" + "<p/>客戶手機：" + phone + "<p/>客戶信箱："
            + mail + "<p/>客戶地址：" + address + "<p/>客戶網站：" + webSite + "<p/>詢問事項：" + optionItem + "<p/>詢問內容：" + message + "<p/>搜尋關鍵字為：" + keyword;
        SendEmail se = new SendEmail();
        try
        {
            Dictionary<string, Stream> listStream = new Dictionary<string, Stream>();
            string s = se.Mail_Send(SendEmail.sendMail, SendEmail.receiveMails.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries), new string[] { }, SendEmail.mailTitle, content, true, listStream);
            if (s == "成功")
                Response.Write("<script type='text/javascript'> alert('信件傳送成功');</script>");
            else
                Response.Write("<script type='text/javascript'> alert('信件伺服器異常，請直接來電與本公司聯繫(02)2998-8895');</script>");
            Response.AddHeader("Refresh", "0");
        }
        catch(Exception ex)
        {
            MessageBox(ex.ToString());
        }
    }

    private void MessageBox(string msg)
    {
        Label lbl = new Label();
        lbl.Text = "<script language='javascript'>" + Environment.NewLine + "window.alert('" + msg + "')</script>";
        Page.Controls.Add(lbl);
    }
}