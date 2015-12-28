using System;
using System.Collections.Generic;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.Configuration;
using System.IO;
/// <summary>
/// SendEmail 的摘要描述
/// </summary>
public class SendEmail
{

    #region 寄信相關
    /// <summary>
    /// 寄信標題
    /// </summary>
    public static string mailTitle = ConfigurationManager.AppSettings["mailTitle"].Trim();

    /// <summary>
    /// 寄信人Email
    /// </summary>
    public static string sendMail = ConfigurationManager.AppSettings["sendMail"].Trim();
    /// <summary>
    /// 收信人Email(多筆用逗號隔開)
    /// </summary>
    public static string receiveMails = ConfigurationManager.AppSettings["receiveMails"].Trim();

    /// <summary>
    /// 寄信smtp server
    /// </summary>
    public static string smtpServer = ConfigurationManager.AppSettings["smtpServer"].Trim();

    /// <summary>
    /// 寄信smtp server的Port，預設25
    /// </summary>
    public static int smtpPort = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPort"].Trim());

    /// <summary>
    /// 寄信帳號
    /// </summary>
    public static string mailAccount = ConfigurationManager.AppSettings["mailAccount"].Trim();

    /// <summary>
    /// 寄信密碼
    /// </summary>
    public static string mailPwd = ConfigurationManager.AppSettings["mailPwd"].Trim();




    /// <summary>
    /// 完整的寄信函數
    /// </summary>
    /// <param name="MailFrom">寄信人Email Address</param>
    /// <param name="MailTos">收信人Email Address</param>
    /// <param name="Ccs">副本Email Address</param>
    /// <param name="MailSub">主旨</param>
    /// <param name="MailBody">內文</param>
    /// <param name="isBodyHtml">是否為Html格式</param>
    /// <param name="files">要夾帶的附檔</param>
    /// <returns>回傳寄信是否成功(true:成功,false:失敗)</returns>
    public string Mail_Send(string MailFrom, string[] MailTos, string[] Ccs, string MailSub, string MailBody, bool isBodyHtml, Dictionary<string, Stream> files)
    {

        try
        {
            //沒給寄信人mail address
            if (string.IsNullOrEmpty(MailFrom))
            {//※有些公司的Smtp Server會規定寄信人的Domain Name須是該Smtp Server的Domain Name，例如底下的 system.com.tw
                MailFrom = "lidichu@spdg.com.tw";
            }

            //建立MailMessage物件
            MailMessage mms = new MailMessage();
            //指定一位寄信人MailAddress
            mms.From = new MailAddress(MailFrom);
            //信件主旨
            mms.Subject = MailSub;
            //信件內容
            mms.Body = MailBody;
            //信件內容 是否採用Html格式
            mms.IsBodyHtml = isBodyHtml;

            if (MailTos != null)//防呆
            {
                for (int i = 0; i < MailTos.Length; i++)
                {
                    //加入信件的收信人(們)address
                    if (!string.IsNullOrEmpty(MailTos[i].Trim()))
                    {
                        mms.To.Add(new MailAddress(MailTos[i].Trim()));
                    }

                }
            }//End if (MailTos !=null)//防呆

            if (Ccs != null) //防呆
            {
                for (int i = 0; i < Ccs.Length; i++)
                {
                    if (!string.IsNullOrEmpty(Ccs[i].Trim()))
                    {
                        //加入信件的副本(們)address
                        mms.CC.Add(new MailAddress(Ccs[i].Trim()));
                    }

                }
            }//End if (Ccs!=null) //防呆


            //附件處理
            if (files != null && files.Count > 0)//寄信時有夾帶附檔
            {
                foreach (string fileName in files.Keys)
                {
                    Attachment attfile = new Attachment(files[fileName], fileName);
                    mms.Attachments.Add(attfile);
                }//end foreach
            }//end if 
            SmtpClient client = new SmtpClient(smtpServer, smtpPort);
            if (!string.IsNullOrEmpty(mailAccount) && !string.IsNullOrEmpty(mailPwd))//.config有帳密的話
            {
                client.Credentials = new NetworkCredential(mailAccount, mailPwd);//寄信帳密
            }
            client.Send(mms);//寄出一封信
            //using (SmtpClient client = new SmtpClient(smtpServer, smtpPort))//或公司、客戶的smtp_server
            //{
            //    if (!string.IsNullOrEmpty(mailAccount) && !string.IsNullOrEmpty(mailPwd))//.config有帳密的話
            //    {
            //        client.Credentials = new NetworkCredential(mailAccount, mailPwd);//寄信帳密
            //    }
            //    client.Send(mms);//寄出一封信
            //}//end using 
            //釋放每個附件，才不會Lock住
            if (mms.Attachments != null && mms.Attachments.Count > 0)
            {
                for (int i = 0; i < mms.Attachments.Count; i++)
                {
                    mms.Attachments[i].Dispose();
                    mms.Attachments[i] = null;
                }
            }

            return "成功";//成功
        }
        catch (Exception ex)
        {
            //寄信失敗，寫Log文字檔
            //NLog.LogManager.GetCurrentClassLogger().ErrorException("寄信失敗", ex);
            return ex.ToString();
        }
    }//End 寄信
    #endregion
}