﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="cpmtact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>禾益網路資訊系統/新北網頁設計/台北網頁設計/系統開發</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="keywords" content="新北網頁設計、新北網頁、新北網頁設計公司、新北系統開發、台北網頁設計、台北網頁、台北網頁設計公司、台北系統開發、高雄網頁設計、高雄網頁、高雄網頁設計公司、高雄系統開發、台中網頁、台中網頁設計公司、台中系統開發、桃園網頁設計、桃園網頁、桃園網頁設計公司、桃園系統開發、系統開發、網頁設計、響應式網站、SEO、網站優化、程式設計、人事系統、管理系統、客戶管理系統、商品攝影、型錄攝影、商業攝影" />
    <meta name="description" content="新北網頁設計、新北網頁、新北網頁設計公司、新北系統開發、台北網頁設計、台北網頁、台北網頁設計公司、台北系統開發、高雄網頁設計、高雄網頁、高雄網頁設計公司、高雄系統開發、台中網頁、台中網頁設計公司、台中系統開發、桃園網頁設計、桃園網頁、桃園網頁設計公司、桃園系統開發、系統開發、網頁設計、響應式網站、SEO、網站優化、程式設計、人事系統、管理系統、客戶管理系統、商品攝影、型錄攝影、商業攝影" />
    <link rel="shortcut icon" href="assets/heryi.ico" type="assets/heryi.ico" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/multipage.css" />
    <link rel="stylesheet" type="text/css" href="css/animate.css" />
    <link href='https://fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500italic,500,700,700italic' rel='stylesheet' type='text/css' />
    <link href='https://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="../dist/css/bootstrapValidator.css" />
    <link rel="stylesheet" type="text/css" href="css/mycontact.css" />
    <link href="css/goTop.css" type="text/css" rel="stylesheet" />
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(init);
        function init() {
            jQuery("img[name='imgCode']").attr("src", "validate/ValidateNumber.ashx?" + Math.random());
        }
        function isPassValidateCode() {
            var nowValidateNumber = jQuery.ajax({
                url: "validate/readSessionValidateNumber.ashx",
                type: "post",
                async: false,
                data: {},
                success: function (htmlVal) { }
            }).responseText;

            if (nowValidateNumber == "" || nowValidateNumber == null) {
                alert("驗證碼逾時，請重新整理");
                return false;
            }

            var userInput = jQuery("#<%= txt_input.ClientID%>").val();

            var validateResult = ((nowValidateNumber == userInput) ? true : false);


            if (validateResult == false) {
                jQuery("#span_result").html("驗證碼輸入不正確");
            }
            else
                jQuery("#span_result").html("");

            //回傳true Or false
            return validateResult;
        }
    </script>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->


                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand scroll" href="index.html">
                        <p>禾益網路資訊系統</p>
                        <small>HERYI SYSTEM WEB</small></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.html">首頁</a></li>
                        <li><a href="about.html">關於我們</a></li>
                        <li><a href="services.html">服務項目</a></li>
                        <!--<li><a href="team.html">專案介紹</a></li>-->
                        <li><a href="webDesign.html">網頁設計</a></li>
                        <li><a href="system.html">系統開發</a></li>
                        <li><a href="howwork.html">製作流程</a></li>
                        <li><a href="contact.aspx">聯絡我們</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>

        <!-- 插入滿版 -->

        <div class="contair-fluid">
            <div class="row">
                <div class="col-sm-12  col-md-12 col-lg-12">
                    <img src="assets/about/contact.png" class="img-responsive">
                </div>
            </div>
        </div>

        <!-- 插入滿版 -->

        <div class="clearfix"></div>
        <!-- contact us section -->

        <section class="contact" id="contact">
            <header class="defaultHeaderContact">
                <h1 class="wow fadeIn" data-wow-duration="5s">線上報價</h1>
                <h6 class="wow fadeIn" data-wow-duration="5s">WE ARE HAPPY TO HELP YOU ANY TIME 24/7</h6>
            </header>

            <div class="container">
                <div class="row">

                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 padding0">
                        <div class="form-group">
                            <label class="col-lg-3 col-xs-12">
                                <h4>公司名稱:</h4>
                            </label>
                            <asp:TextBox ID="iptCompany" runat="server" ValidationGroup="ck_inst" CssClass="form-control wow fadeIn" placeholder="(必填)請輸入您的公司名稱"></asp:TextBox>
                            <asp:RequiredFieldValidator EnableClientScript="true" ID="RequiredFieldValidator1" runat="server" ErrorMessage="不可空白" ForeColor="Red" ControlToValidate="iptCompany" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-xs-12">
                                <h4>聯絡人姓名:</h4>
                            </label>
                            <asp:TextBox ID="name" runat="server" ValidationGroup="ck_inst" CssClass="form-control wow fadeIn" placeholder="(必填)請輸入您的姓名"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="name_empty" runat="server" ErrorMessage="不可空白" ForeColor="Red" ControlToValidate="name" Display="Dynamic"></asp:RequiredFieldValidator>
                            
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-xs-12">
                                <h4>您的電話</h4>
                            </label>
                            <input id="iptNumber" runat="server" type="text" class="form-control wow fadeIn" placeholder="(必填)請輸入您的聯絡電話" data-wow-duration="1s" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不可空白" ForeColor="Red" ControlToValidate="iptNumber" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-xs-12">
                                <h4>您的手機</h4>
                            </label>
                            <input id="iptPhone" runat="server" type="text" class="form-control wow fadeIn" placeholder="請輸入您的手機" data-wow-duration="1s" />
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-xs-12">
                                <h4>您的傳真</h4>
                            </label>
                            <input id="iptFax" runat="server" type="text" class="form-control wow fadeIn" placeholder="請輸入您的傳真" data-wow-duration="1s" />
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-xs-12">
                                <h4>您的信箱</h4>
                            </label>
                            <asp:TextBox ID="iptEmail" CssClass="form-control wow fadeIn" runat="server"  placeholder="(必填)請輸入您的電子信箱"></asp:TextBox>
                            <asp:RegularExpressionValidator ForeColor="Red" ID="email_chk" runat="server" ErrorMessage="非E-MAIL 格式" ControlToValidate="iptEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="不可空白" ForeColor="Red" ControlToValidate="iptEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-xs-12">
                                <h4>您的地址</h4>
                            </label>
                            <input id="iptAddress" runat="server" type="text" class="form-control wow fadeIn" placeholder="請輸入您的地址" data-wow-duration="1s" />
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-xs-12">
                                <h4>您的網站</h4>
                            </label>
                            <input id="iptWebSite" runat="server" type="text" class="form-control wow fadeIn" placeholder="請輸入您的網站" data-wow-duration="1s" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 col-xs-12">
                            <h4>詢問項目</h4>
                        </label>
                        <select id="sltOption" runat="server" class="form-control myform-control">
                            <option>網站製作詢價</option>
                            <option>程式規劃需求</option>
                            <option>合作配合事項</option>
                        </select>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 padding0">
                        <div class="form-group">
                            <label class="col-lg-3 col-xs-12">
                                <h4>詢問內容:</h4>
                            </label>
                            <textarea id="txtMessage" runat="server" class="form-control wow fadeIn" rows="10" placeholder="請填入詢問內容" data-wow-duration="1s"></textarea>
                        </div>

                        <!-- this is mine -->
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 padding0">
                            <label class="col-lg-12 col-xs-12">
                                <h4>您搜尋的關鍵字:(填寫的廠商有報價優惠)</h4>
                            </label>
                            <select id="sltKeyword" runat="server" class="form-control wow fadeIn">
                                <option>網頁設計</option>
                                <option>網頁製作</option>
                                <option>程式設計</option>
                                <option>系統開發</option>
                                <option>台北網頁</option>
                                <option>台北網頁設計</option>
                                <option>新北網頁</option>
                                <option>新北網頁設計</option>
                                <option>桃園網頁</option>
                                <option>桃園網頁設計</option>
                                <option>台中網頁</option>
                                <option>台南網頁</option>
                                <option>台南網頁設計</option>
                                <option>高雄網頁</option>
                                <option>高雄網頁設計</option>
                                <option>其他</option>
                            </select>
                        </div>
                        <div class="col-lg-12 col-xs-12 padding0">
                            <label>
                                <h4>驗證碼:</h4>
                            </label>
                            <img src="validate/ValidateNumber.ashx" alt="驗證碼" name="imgCode" />
                            <input class="btn btn-info" type="button" onclick="form1.imgCode.src = 'validate/ValidateNumber.ashx?' + Math.random();" value="重新整理" />
                        </div>
                        <div class="col-lg-12 col-xs-12 padding0">
                            <asp:TextBox ID="txt_input" runat="server" placeholder="請輸入驗證碼" CssClass="mytxt form-control wow fadeIn" /><span id="span_result"></span>
                        </div>
                        <div class="divCenter col-lg-12 col-xs-12">
                            <asp:Button Text="送出表單" CssClass="send wow fadeIn" ID="btn_submit" runat="server" OnClientClick="return isPassValidateCode();" OnClick="BtnSend_Click" />
                            <asp:Button Text="清除" CssClass="send wow fadeIn" ID="btn_clear" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--Google maps-->
        <!--   <div id="map"> -->

        <div class="clearfix"></div>
        <div class="Flexible-container">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.792271059523!2d121.44352531541774!3d25.041122744158887!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a877d50ce165%3A0xd17f235053ab266d!2zMjQy5paw5YyX5biC5paw6I6K5Y2A5paw5rOw6LevMzA26Jmf!5e0!3m2!1szh-TW!2stw!4v1450331286809" frameborder="0" style="border: 0" allowfullscreen></iframe>
        </div>
        <div class="clearfix"></div>
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 item1Footer padding0">
                        <h1>聯絡方式</h1>
                        <div class="borderBottom"></div>
                        <p>電 話：02-2998-8895</p>
                        <p>傳 真：02-2998-8895</p>
                        <p>Email：service@spdg.com.tw</p>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 item2Footer text-center">
                        <h1>禾益網路資訊系統</h1>
                        <br />
                        <p>提供客戶網頁設計、虛擬主機、網站建置、系統整合開發、網站行銷、電子商務整合、資料庫程式設計等服務。</p>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 item3Footer padding0">
                        <h1>公司地址</h1>
                        <div class="borderBottom"></div>
                        <p>242新北市新莊區新泰路306號9樓</p>
                        <p>上班時間:AM8:40-PM5:40</p>
                    </div>
                    <div class="col-lg-12 copyright padding0">
                        <p>版權所有©禾益網路資訊系統股份有限公司</p>
                    </div>
                </div>
            </div>
        </footer>

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/jquery.mixitup.js"></script>
        <script src="js/morphext.js"></script>
        <script src="js/backstretch.min.js"></script>
        <script src="http://maps.google.com/maps/api/js"></script>
        <script src="js/googleMaps.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/custom.js"></script>
        <script src="js/multipage.js"></script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script type="text/javascript" src="../dist/js/bootstrapValidator.js"></script>

    </form>
</body>
</html>
