<%@ Page Language="C#" Inherits="IEILShell.CustomerIdView" Debug="true" CodeFile="BusinessLogic/CustomerIdView.aspx.cs" %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CustomerId View</title>
        <script src="/Integrated/Scripts/jquery-3.5.1.js"></script>
        <script src="/Integrated/Scripts/AjaxLoaderV2.js"></script>
        <script src="/Integrated/Scripts/CommonKeypress.js"></script>
        <script src="Scripts/Insurance_ReportAllAjax.js"></script>
        <link rel="stylesheet" href="Styles/GiftCityDaywiseReport.css">
        <link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
    </head>
    <body>
    <form runat="server" autocomplete="off"> 
    <div class="bodyarea">                        
        <input type="hidden" id="PicHidden" runat="server">
        <input type="hidden" id="AddCheckHidden" runat="server">
        <div>
            <div class="BtnCls" id="BtnCont">
                <input type="button" value="PERSONAL" id="PersonalBtn" class="Button Button1 active" onclick="TabView(event,'PersonalDivContent',this.id)">
                <input type="button" value="ADDRESS" id="AddressBtn" class="Button Button2" onclick="TabView(event,'AddressDivContent',this.id)">
                <input type="button" value="CONTACT" id="ContactBtn" class="Button Button3" onclick="TabView(event,'ContactDivContent',this.id)">
                <input type="button" value="STATUTORY" id="StatutoryBtn" class="Button Button4" onclick="TabView(event,'StatutoryDivContent',this.id)">
                <input type="button" value="BANK" id="BankBtn" class="Button Button5" onclick="TabView(event,'BankDivContent',this.id)">
                <!-- <input type="button" id="HideBtn" class="Button" style="display: none;"> -->
                <!-- <input type="button" value="Attachments" id="AttachmentsBtn" class="Button Button5" onclick="TabView(event,'AttachmentsDivContent')"> -->
            </div>
            <div id="BankDivContent" class="TabContent">
                <div class="HeadingCls" style="font-weight: bolder; color: white;padding: 4px;border-bottom-right-radius: 15px;border-top-right-radius: 15px;width: 27%;background-color: #142d5f;   font-size: 16px;letter-spacing: 1px;">Bank Details <img src="./Images/bank.png"  style="color: white; width: 20px;" alt="Bank"></div>
                <div class="CustStatutoryDetails">
                   <div>IFSC Code/MICR Code</div><label class="colon">:</label>&emsp;<span id="IfscCode" runat="server"></span>
                </div>
                <div class="CustStatutoryDetails">
                   <div>Bank Name/Branch Name</div><label class="colon">:</label>&emsp;<span id="BankName" runat="server"></span>
                </div>
                <div class="CustStatutoryDetails">
                   <div>Ac.Type/Ac.No</div><label class="colon">:</label>&emsp;<span id="Acno" runat="server"></span>
                </div>
                <div class="CustStatutoryDetails">
                   <div>Product</div><label class="colon">:</label>&emsp;<span id="Prdt" runat="server"></span>
                </div>
                <div class="CustStatutoryDetails">
                  <div>Status</div><label class="colon">:</label>&emsp;<span id="BankStatus" runat="server"></span>
                </div>
                <div class="CustStatutoryDetails">
                  <div>Monthly New Letter Required</div><label class="colon">:</label>&emsp;<span id="sub" runat="server"></span>
                </div>
                <div class="CustStatutoryDetails">
                   <div>Learning Session for SMD</div><label class="colon">:</label>&emsp;<span id="sess" runat="server"></span>
                </div>
                <div class="CustStatutoryDetails">
                   <div>Client Alive Status</div><label class="colon">:</label>&emsp;<span id="CustAlivestatusSp" runat="server"></span>
                </div>
                <div class="CustStatutoryDetails">
                   <div>How did you know about integrated</div><label class="colon">:</label>&emsp;<span id="CustRefSp" runat="server">Others</span>
                </div>
                <div class="CustStatutoryDetails">
                  <div>Other Details</div><label class="colon">:</label>&emsp;<span id="CustRefDetailsSp" runat="server"></span>
                </div>

                <div id="TableMainDiv">
                    <div class="TableHeader">
                        <div class="Header1 ReferalItemData">
                            <div>Family Id</div>
                            <div>Cutomer Id</div>
                            <div>Customer Name</div>
                            <div>Age</div>
                            <div>RelationShip</div>
                            <div>Family Head (or) Decision Maker</div>
                            <div>Same Address as Customer Id</div>
                        </div>
                    </div>
                    <div class="ReferalItemData" style="text-align: center;">
                        <div id="FamId" runat="server" class="DataDiv"></div>
                        <div id="CustId" runat="server" class="DataDiv"></div>
                        <div id="CustName" runat="server" class="DataDiv"></div>
                        <div id="Age" runat="server" class="DataDiv"></div>
                        <div id="RelationShip" runat="server" class="DataDiv"></div>
                        <div id="FamilyHead" runat="server" class="DataDiv"></div>
						<div id="AddressDiv" runat="server" class="DataDiv"></div>
                    </div>
                </div>
            </div>

            <div id="PersonalDivContent" class="TabContent">
                <div class="HeadingCls" style="padding: 4px;border-bottom-right-radius: 15px; border-top-right-radius: 15px; width: 27%; background-color: #142d5f; font-weight: bolder;color: white; font-size: 16px;letter-spacing: 1px;margin-bottom: 5px;">Personal Details <i class="fa fa-user" aria-hidden="true"></i></div>
                <div style="display: flex; flex-direction: row;">
                    <div style="width: 75%;">
                        <div class="CustDetails">
                            <div>IEP Customer Id</div><label class="colon">:</label>&emsp;<span id="CustIdSp" runat="server"></span>
                        </div>
                        <div class="CustDetails">
                            <div>Client Name</div><label class="colon">:</label>&emsp;<span id="CustnameSp" runat="server"></span>
                        </div>
                        <div class="CustDetails">
                            <div>Created Branch</div><label class="colon">:</label>&emsp;<span id="CustbranchSp" runat="server"></span>
                        </div>
                        <div class="CustDetails">
                            <div>Gender</div><label class="colon">:</label>&emsp;<span id="CustGenSp" runat="server"></span>
                        </div>
                        <div class="CustDetails">
                            <div>Date Of Birth</div><label class="colon">:</label>&emsp;<span id="CustdobSp" runat="server"></span>
                        </div>
                        <div class="CustDetails">
                            <div>Martial Status</div><label class="colon">:</label>&emsp;<span id="CustMrgstsSp" runat="server"></span>
                        </div>
                        <div class="CustDetails">
                            <div>Residence</div><label class="colon">:</label>&emsp;<span id="CustResidenceSp" runat="server"></span>
                        </div>
                        <div class="CustDetails">
                            <div>Mother Name</div><label class="colon">:</label>&emsp;<span id="CustMotehrSp" runat="server"></span>
                        </div>
                        <div class="CustDetails">
                            <div>Father Name</div><label class="colon">:</label>&emsp;<span id="CustFatherSp" runat="server"></span>
                        </div>
                        <div class="CustDetails">
                            <div>Spouse Name</div><label class="colon">:</label>&emsp;<span id="CustSpouseSp" runat="server"></span>
                        </div>
                        <div class="CustDetails">
                            <div>Occupation</div><label class="colon">:</label>&emsp;<span id="CustOccSp" runat="server"></span>
                        </div>
                        <div class="CustDetails">
                            <div>Annual Income</div><label class="colon">:</label>&emsp;<span id="CustIncSp" runat="server"></span>
                        </div>
                        <div class="CustDetails">
                            <div>Political Exposure</div><label class="colon">:</label>&emsp;<span id="CustPoliticalSp" runat="server"><i class='fa fa-times-circle' style='color: red;'></i></span>
                        </div>
                    </div>
                    <div class="ImgDiv" id="ImgDiv" runat="server" style="width: 25%;">
                        <span style="color:red" id="Imgcont"></span>
                        <img id="ImgId" style="padding-top: 3%; border-radius: 20px; height: auto; width: 80%;margin: auto;" runat="server">
                    </div>
                </div>
            </div>

            <div id="AddressDivContent" class="TabContent">
                <div class="HeadingCls" style="padding: 4px; font-weight: bolder;color: white;border-bottom-right-radius: 15px;border-top-right-radius: 15px;width: 27%;margin-bottom: 12px;background-color: #142d5f;font-size: 16px;letter-spacing: 1px;">Address Details <i class="fa fa-address-card-o" aria-hidden="true"></i></div>
                <div class="tablediv">
                    <div class="tablesize">
                        <div style="font-weight: bold; border-bottom: 1px solid gainsboro; padding: 8px; background-color: #142d5f; color: white;">Correspondence Address</div>
                        <div class="CustAddDetails">
                            <div>Flat/Door no/Street no</div><label class="colon">:</label>&emsp;
                            <span id="CustDoornoSp" runat="server"></span>
                        </div>
                        <div class="CustAddDetails">
                            <div>Village/Post Office</div><label class="colon">:</label>&emsp;
                            <span id="CustPOSp" runat="server"></span>
                        </div>
                        <div class="CustAddDetails">
                            <div>Area/Locality/Taluka</div><label class="colon">:</label>&emsp;
                            <span id="CustAreaSp" runat="server"></span>
                        </div>
                        <div class="CustAddDetails">
                            <div>Town/City/District</div><label class="colon">:</label>&emsp;
                            <span id="CustTownSp" runat="server"></span>
                        </div>
                        <div class="CustAddDetails">
                            <div>State</div><label class="colon">:</label>&emsp;
                            <span id="CustStateSp" runat="server"></span>
                        </div>
                        <div class="CustAddDetails">
                            <div>Country</div><label class="colon">:</label>&emsp;
                            <span id="CustCountrySp" runat="server"></span>
                        </div>
                    </div>
                    <div class="tablesize">
                        <div style="font-weight: bold; border-bottom: 1px solid gainsboro; background-color: #142d5f;  color: white; padding: 8px;" class="ckdiv">
                            Permanent Address :<input type="checkbox" disabled id="AddCheckbox">&nbsp;Same as Correspondence Address
                        </div>
                        <div class="CustAddDetails">
                            <div>Flat/Door no/Street no</div><label class="colon">:</label>&emsp;<span id="PerCustDoornoSp" runat="server"></span>
                        </div>
                        <div class="CustAddDetails">
                            <div>Village/Post Office</div><label class="colon">:</label>&emsp;<span id="PerCustPOSp" runat="server"></span>
                        </div>
                        <div class="CustAddDetails">
                            <div>Area/Locality/Taluka</div><label class="colon">:</label>&emsp;<span id="PerCustAreaSp" runat="server"></span>
                        </div>
                        <div class="CustAddDetails">
                            <div>Town/City/District</div><label class="colon">:</label>&emsp;<span id="PerCustTownSp" runat="server"></span>
                        </div>
                        <div class="CustAddDetails">
                            <div>State</div><label class="colon">:</label>&emsp;<span id="PerCustStateSp" runat="server"></span>
                        </div>
                        <div class="CustAddDetails">
                            <div>Country</div><label class="colon">:</label>&emsp;<span id="PerCustCountrySp" runat="server"></span>
                        </div>
                    </div>
                </div>
            </div>

            <div id="ContactDivContent" class="TabContent">
                <div class="HeadingCls" style="padding: 4px;font-weight: bolder;color: white;padding: 4px;margin-bottom: 10px;border-bottom-right-radius: 15px;border-top-right-radius: 15px;width: 27%;background-color: #142d5f;font-size: 16px;letter-spacing: 1px;">Contact Details <i class="fa fa-mobile" aria-hidden="true" style="font-size: 25px;"></i></div>
                <div class="PerMobDiv" style="display: flex; background-color: whitesmoke;">
                    <div class="MobNo" style="width: 17%;">Personal Mobile No.</div><label class="colon" style="padding: 8px;">:</label><div class="PerMobDetails" style="width: 18%;" id="PerPhoneDiv"  runat="server"></div>
                    <div class="Call" style="width: 3%; font-weight: 500; color: black;">Call</div><div class="PerMobDetails" style="width: 2%;" id="Callimg" runat="server"></div>
                    <div  class="SMS" style="width: 3%; font-weight: 500; color: black;">SMS</div><div class="PerMobDetails" style="width: 2%;" id="SMSImg" runat="server"></div>
                    <div class="Wp" style="width: 7%; font-weight: 500; color: black;">WhatsApp</div><div class="PerMobDetails" id="WpImg" runat="server"></div>
                </div>
                <div class="OffMobDiv" style="display: flex;">
                    <div class="OffMobNo" style="width: 17.2%;">Official Mobile No.</div><label class="colon" style="padding: 8px;">:</label><div  style="width: 17.99%;" class="PerMobDetails" id="OffPhoneDiv"  runat="server"></div>
                    <div class="OffCall" style="width: 3%; font-weight: 500; color: black;">Call</div> <div class="PerMobDetails" style="width: 1.95%;" id="OffCall" runat="server"></div>
                    <div  class="OffSMS" style="width: 2.9%; font-weight: 500; color: black;">SMS</div> <div class="PerMobDetails" style="width: 2%;" id="OffSms" runat="server"></div>
                    <div class="OffWp" style="width: 6.9%; font-weight: 500; color: black;"  >WhatsApp</div> <div class="PerMobDetails" style="width: 1.4%;" id="OffWp" runat="server"></div>
                </div>
                <div class="PerMailDiv" style="display: flex; background-color: whitesmoke;">
                    <div class="MailId" style="width: 17%;">Personal Mail-Id</div><label class="colon" style="padding: 8px;">:</label><div class="PerMobDetails" style="width: 20%;" id="PerMailId"  runat="server"></div>
                </div>  
                <div class="OffMobDiv" style="display: flex;">
                    <div class="MailId" style="width: 17%;">Official Mail-Id</div><label class="colon" style="padding: 8px;">:</label><div class="PerMobDetails" style="width: 18%;" id="OffMailId"  runat="server"></div>
                </div>  
                <div class="PerStdDiv" style="display: flex; background-color: whitesmoke;">
                    <div class="PerStdNo" style="width: 17%;"> STD No</div><label class="colon" style="padding: 8px;">:</label><div style="width: 18%;" class="PerMobDetails" id="PerStd"  runat="server"></div>
                    <div class="PerLandLineNo" style="width: 22.2%;"> Personal LandLine No</div><label class="colon" style="padding: 8px;">:</label><div style="width: 7.4%;" class="PerMobDetails" id="PerLandLine" runat="server"></div>
                    <div class="StdCall" style="width: 3%; font-weight: 500; color: black;">Call</div> <div class="PerMobDetails" style="width: 3%;" id="CallStd" runat="server"></div>
                </div>
                <div class="NriDiv" style="display: flex;">
                    <div class="CCode" style="width: 17%;">Country Code</div><label class="colon" style="padding: 8px;">:</label><div class="PerMobDetails" style="width: 18%;" id="CountryCodeDiv"  runat="server"></div>
                    <div class="NRINum" style="width: 22.2%;">Non-Residential Mobile No</div><label class="colon" style="padding: 8px;">:</label><div style="width: 7.5%;" class="PerMobDetails" id="NonResidential" runat="server"></div>
                    <div class="NriCall" style="width: 2.5%; font-weight: 500; color: black;">Call</div> <div class="PerMobDetails" id="CCall" runat="server"></div>
                    <div class="NriSMS" style="width: 3%; font-weight: 500; color: black;">SMS</div> <div class="PerMobDetails" id="CSms" runat="server"></div>
                    <div class="NriWP" style="width: 6%; font-weight: 500; color: black;">Whatapp</div> <div class="PerMobDetails" id="CWp" runat="server"></div>
                </div>
                <div class="OffStdDiv" style="display: flex; background-color: whitesmoke;">
                    <div class="StdNo" style="width: 17.8%;">STD No.</div><label class="colon" style="padding: 8px;">:</label><div class="PerMobDetails"  style="width: 19%;" id="OffStd"  runat="server"></div>
                    <div class="StdOff" style="width: 22.5%;">Official Landline No.
                    </div><label class="colon" style="padding: 8px;">:</label><div class="PerMobDetails" style="width: 7.5%;" id="OffLandLine" runat="server"></div>
                    <div class="Extn" style="width: 7%;">Extn No.
                    </div><label class="colon" style="padding: 8px;">:</label><div class="PerMobDetails" style="width:9%" id="Extn" runat="server"></div>
                    <div class="StdCall" style="width: 2.5%; font-weight: 500; color: black;">Call</div> <div class="PerMobDetails" style="width: 1%;" id="LandlineCall" runat="server"></div>
                </div>  
            </div>

            <div id="StatutoryDivContent" class="TabContent">
                <div class="HeadingCls" style="padding: 4px;border-bottom-right-radius: 15px;border-top-right-radius: 15px;width: 27%;background-color: #142d5f; font-weight: bolder;  color: white;font-size: 16px;letter-spacing: 1px;">Statutory Details <i class="fa fa-id-card" aria-hidden="true"></i></div>
                <div class="TotalDiv" style="display: flex; width: 100%;">
                    <div class="TotalDiv1" style="width: 50%;">
                        <div class="CustStatutoryDetails">
                            <div>Name as per Income Tax</div><label class="colon">:</label>&emsp;
                            <span id="CustNameAsPerItnoSp" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div>Pan No</div><label class="colon">:</label>&emsp;
                            <span id="CustPanNoSp" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div>Title</div><label class="colon">:</label>&emsp;
                            <span id="pantitle" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div>First Name</div><label class="colon">:</label>&emsp;
                            <span id="PanFname" runat="server"></span>
                        </div> 
                        <div class="CustStatutoryDetails">
                            <div>Middle Name</div><label class="colon">:</label>&emsp;
                            <span id="PanMname" runat="server"></span>
                        </div>  
                        <div class="CustStatutoryDetails">
                            <div>Last Name</div><label class="colon">:</label>&emsp;
                            <span id="PanLname" runat="server"></span>
                        </div>  
                        <div class="CustStatutoryDetails">
                            <div>Pan Status</div><label class="colon">:</label>&emsp;
                            <span id="CustPanStatusSp" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div>KYC Pan Status</div><label class="colon">:</label>&emsp;
                            <span id="CustkycstatusSp" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails RepDivCls">
                            <div>Repositary Type</div><label class="colon">:</label>&emsp;
                            <span id="CustReptypeSp" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div class="EiaNo">EIA No</div><label class="colon">:</label>&emsp;
                            <span id="CustEiaSp" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div>PRAN No.</div><label class="colon">:</label>&emsp;
                            <span id="CustpranSp" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div>CKYC No.</div><label class="colon">:</label>&emsp;
                            <span id="CustCkycnoSp" runat="server"></span>
                        </div>
                    </div>
                    <div class="TotalDiv2" style="width: 50%;">
                        <div class="CustStatutoryDetails">
                            <div>PAN Number</div><label class="colon">:</label>&emsp;
                            <span id="PanNo" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div>Depositary Type</div><label class="colon">:</label>&emsp;
                            <span id="DType" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div>Dp Id</div><label class="colon">:</label>&emsp;
                            <span id="DpID" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div>Client Id</div><label class="colon">:</label>&emsp;
                            <span id="ClientId" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div>Dp Status</div><label class="colon">:</label>&emsp;
                            <span id="DpStatus" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div>ISL Code</div><label class="colon">:</label>&emsp;
                            <span id="IslCode" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div>SMD Status</div><label class="colon">:</label>&emsp;
                            <span id="SmdCode" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div>Unified Payment Interface</div><label class="colon">:</label>&emsp;
                            <span id="UpiId" runat="server"></span>
                        </div>
                        <div class="CustStatutoryDetails">
                            <div>UPI Status</div><label class="colon">:</label>&emsp;
                            <span id="UpiStatus" runat="server"></span>
                        </div>
                    </div>
               </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>
 