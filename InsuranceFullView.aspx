<%@ Page Language="C#" Culture="en-IN" UICulture="en-IN" Inherits="IEILShell.InsuranceFullView" Debug="true" CodeFile="BusinessLogic/InsuranceFullView.aspx.cs" %>
<!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7;chrome=1;IE=EDGE">
        <meta name="HandheldFriendly" content="true">
        <script src="/Integrated/Scripts/jquery-3.5.1.js"></script>
        <script src="/Integrated/Scripts/AjaxLoaderV2.js"></script>
        <script src="Scripts/Insurance_ReportAllAjax.js"></script>
        <link rel="stylesheet" href="Styles/GiftCityDaywiseReport.css">
        <title>Insurance All Report</title>
    </head>
    <body>
        <form runat="server" autocomplete="off">
        <div id="Full_View" runat="server">
            <div class="MainTitleMaskCls" id="NewAck" runat="server" style="position:sticky;top:0;">FULL VIEW REPORT<span class="SpanCloseId" style="font-size:25px;" onclick="return FullViewMaskClose()" runat="server">X</span></div>
            <div class="ContentDiv" runat="server">
                <div class="DivFlex">
                    <div class="Flexrow dth Brnnamelbl">BRANCH NAME</div>
                    <div class="Flexrow dthh Brnnamedata"><span id="Brnnamespan" style="color:green;font-weight: bold;" runat="server"></span></div>
                    <div class="Flexrow dth CusIdlbl">CUSTOMER ID</div>
                    <div class="Flexrow dthh CusIddata"><span id="CustIdspan" style="color:green;font-weight: bold;" runat="server"></span></div>
                    <div class="Flexrow dth Acknolbl">ACK NO</div>
                    <div class="Flexrow dthh Acknodata"><span id="Ackspan" style="color:green;font-weight: bold;" runat="server"></span></div>
                </div>
            </div>
            <div id="CancelBo" runat="server" style="display:none;">
                <div class="TitleMaskCls" style="margin-bottom:1%;">CANCELLATION DETAILS(BO)</div>
                <div class="ContentDiv" runat="server">
                    <div class="DivFlex">
                        <div class="Flexrow dth Cancdtlbl">Cancelled Date</div>
                        <div class="Flexrow dthh Cancdtdata"><span id="CancDtspan" runat="server"></span></div>
                        <div class="Flexrow dth CancRealbl">Reason</div>
                        <div class="Flexrow dthh CancReadata"><span id="CancReaspan" runat="server"></span></div>
                        <div class="Flexrow dth CancUserlbl">Cancelled User</div>
                        <div class="Flexrow dthh CancUserdata"><span id="CancUserspan" runat="server"></span></div>
                    </div>
                </div>
            </div>
          
            <div id="OtherHo" runat="server" style="display:none;">
                <div class="TitleMaskCls" style="margin-bottom:1%;">OTHER STATUS DETAILS(HO)</div>
                <div class="ContentDiv" runat="server">
                    <div class="DivFlex">
                        <div class="Flexrow dth StsDatelbl">Status Date</div>
                        <div class="Flexrow dthh StsDatedata"><span id="StsDatespan" runat="server"></span></div>
                        <div class="Flexrow dth OtherRealbl">Reason</div>
                        <div class="Flexrow dthh OtherReadata"><span id="OtherReaspan" runat="server"></span></div>
                    </div>
                </div>
            </div>

            <div id="CancelHo" runat="server" style="display:none;">
                <div class="TitleMaskCls" style="margin-bottom:1%;">CANCELLATION DETAILS(HO)</div>
                <div class="ContentDiv" runat="server">
                    <div class="DivFlex">
                        <div class="Flexrow dth BoReqDtlbl">BO Request Date</div>
                        <div class="Flexrow dthh BoReqDtdata"><span id="BoReqDtspan" runat="server"></span></div>
                        <div class="Flexrow dth ReqRealbl">Request Reason</div>
                        <div class="Flexrow dthh ReqReadata"><span id="ReqReaspan" runat="server"></span></div>
                        <div class="Flexrow dth BoReqUserlbl">BO Request User</div>
                        <div class="Flexrow dthh BoReqUserdata"><span id="BoReqUserspan" runat="server"></span></div>
                        <div class="Flexrow dth HoCancDtlbl">HO Cancel Date</div>
                        <div class="Flexrow dthh HoCancDtdata"><span id="HoCancDtspan" runat="server"></span></div>
                        <div class="Flexrow dth CancHoRealbl">Reason</div>
                        <div class="Flexrow dthh CancHoReadata"><span id="CancHoReaspan" runat="server"></span></div>
                        <div class="Flexrow dth HoCancUserlbl">HO Cancelled User</div>
                        <div class="Flexrow dthh HoCancUserdata"><span id="HoCancUserspan" runat="server"></span></div>
                    </div>
                </div>
            </div>

            <div class="TitleMaskCls" style="margin-bottom:5px;">CLIENT INSURANCE DETAILS</div>
            <div class="ContentDiv" runat="server">
                <div class="DivFlex">
                    <div class="Flexrow dth Proposerlbl">PROPOSER NAME</div>
                    <div class="Flexrow dthh Proposerdata"><span id="Proposerspan" runat="server"></span></div>
                    <div class="Flexrow dth Panlbl">PAN</div>
                    <div class="Flexrow dthh Pandata"><span id="Panspan" runat="server"></span></div>
                    <div class="Flexrow dth DocDtlbl">LIKELY DOC DATE</div>
                    <div class="Flexrow dthh DocDtdata"><span id="DocDtspan" runat="server"></span></div>
                    <div class="Flexrow dth Phonelbl">PHONE NO</div>
                    <div class="Flexrow dthh Phonedata"><span id="Phonespan" runat="server"></span></div>

                    <!--Show div (for display purpose in mask)-->
                    <div class="Flexrow dth Addr1lbl showdiv"></div>
                    <div class="Flexrow dthh Addr1data showdiv"><span id="Addrspan1" runat="server"></span></div>
                    <div class="Flexrow dth Mobilelbl showdiv">MOBILE NO</div>
                    <div class="Flexrow dthh Mobiledata showdiv"><span id="Mobilespan" runat="server"></span></div>
                    <div class="Flexrow dth Addr2lbl showdiv">ADDRESS</div>
                    <div class="Flexrow dthh Addr2data showdiv"><span id="Addrspan2" runat="server"></span></div>
                    <div class="Flexrow dth Emaillbl showdiv">EMAIL ID</div>
                    <div class="Flexrow dthh Emaildata showdiv"><span id="Emailspan" runat="server"></span></div>
                    <div class="Flexrow dth Addr3lbl showdiv"></div>
                    <div class="Flexrow dthh Addr3data showdiv"><span id="Addrspan3" runat="server"></span></div>
                    <div class="Flexrow dth Genderlbl showdiv">GENDER-AGE</div>
                    <div class="Flexrow dthh Genderdata showdiv"><span id="Genderspan" runat="server"></span>&nbsp;-&nbsp;<span id="Agespan" runat="server"></span></div>
                    <div class="Flexrow dth Addr4lbl showdiv"></div>
                    <div class="Flexrow dthh Addr4data showdiv"><span id="Addrspan4" runat="server"></span></div>
                    <div class="Flexrow dth Occulbl showdiv">OCCUPATION</div>
                    <div class="Flexrow dthh Occudata showdiv"><span id="Occuspan" runat="server"></span></div>
                
                    <!--Hidden div (for responsiveness)-->
                    <div class="Flexrow dth Addr1lbl hiddiv">ADDRESS 1</div>
                    <div class="Flexrow dthh Addr1data hiddiv"><span id="Addr_span1" runat="server"></span></div>
                    <div class="Flexrow dth Addr2lbl hiddiv">ADDRESS 2</div>
                    <div class="Flexrow dthh Addr2data hiddiv"><span id="Addr_span2" runat="server"></span></div>
                    <div class="Flexrow dth Addr3lbl hiddiv">ADDRESS 3</div>
                    <div class="Flexrow dthh Addr3data hiddiv"><span id="Addr_span3" runat="server"></span></div>
                    <div class="Flexrow dth Addr4lbl hiddiv">CITY</div>
                    <div class="Flexrow dthh Addr4data hiddiv"><span id="Addr_span4" runat="server"></span></div>
                    <div class="Flexrow dth Mobilelbl hiddiv">MOBILE NO</div>
                    <div class="Flexrow dthh Mobiledata hiddiv"><span id="Mobile_span" runat="server"></span></div>
                    <div class="Flexrow dth Emaillbl hiddiv">EMAIL ID</div>
                    <div class="Flexrow dthh Emaildata hiddiv"><span id="Email_span" runat="server"></span></div>
                    <div class="Flexrow dth Genderlbl hiddiv">GENDER-AGE</div>
                    <div class="Flexrow dthh Genderdata hiddiv"><span id="Gender_span" runat="server"></span>&nbsp;-&nbsp;<span id="AsAge_Span" runat="server"></span></div>
                    <div class="Flexrow dth Occulbl hiddiv">OCCUPATION</div>
                    <div class="Flexrow dthh Occudata hiddiv"><span id="Occu_span" runat="server"></span></div>
                    <!--Hidden div End-->

                    <div class="Flexrow dth Pinlbl">PIN</div>
                    <div class="Flexrow dthh Pindata"><span id="Pinspan" runat="server"></span></div>
                    <div class="Flexrow dth Stslbl">MARITAL STATUS</div>
                    <div class="Flexrow dthh Stsdata"><span id="Stsspan" runat="server"></span></div>
                    <div class="Flexrow dth Loginlbl">LOGIN PLACE</div>
                    <div class="Flexrow dthh Logindata"><span id="Loginspan" runat="server"></span></div>
                    <div class="Flexrow dth Edulbl">EDUCATION</div>
                    <div class="Flexrow dthh Edudata"><span id="Eduspan" runat="server"></span></div>
                    <div class="Flexrow dth Doblbl">DATE OF BIRTH</div>
                    <div class="Flexrow dthh Dobdata"><span id="Dobspan" runat="server"></span></div>
                    <div class="Flexrow dth DpIdlbl">DPID-CLIENT ID</div>
                    <div class="Flexrow dthh DpIddata"><span id="DpIdspan" runat="server"></span>&nbsp;-&nbsp;<span id="ClientIdspan" runat="server"></span></div>
                   
                    <div class="Flexrow dth CkycStslbl" id="CkycStslbl" runat="server">PROPOSER CKYC STATUS</div>
                    <div class="Flexrow dthh CkycStsdata" id="CkycStsdata" runat="server"><span id="CkycStsspan" runat="server"></span></div>
                    <div class="Flexrow dth CkycNolbl" id="CkycNolbl" runat="server">PROPOSER CKYC NO</div>
                    <div class="Flexrow dthh CkycNodata" id="CkycNodata" runat="server"><span id="CkycNospan" runat="server"></span></div>
                    <div class="Flexrow dth Nationlbl" id="Nationlbl" runat="server">PROPOSER NATIONALITY</div>
                    <div class="Flexrow dthh Nationdata" id="Nationdata" runat="server"><span id="Nationspan" runat="server"></span></div>
                    <div class="Flexrow dth AnnuInclbl" id="AnnuInclbl" runat="server">PROPOSER ANNUAL INCOME</div>
                    <div class="Flexrow dthh AnnuIncdata" id="AnnuIncdata" runat="server"><span id="AnnuIncspan" runat="server"></span></div>
                    <!--New-->
                    <div class="Flexrow dth Pcountrylbl" id="Pcountrylbl" runat="server">PROPOSER COUNTRY</div>
                    <div class="Flexrow dthh Pcountrydata" id="Pcountrydata" runat="server"><span id="Pcountryspan" runat="server"></span></div>
                    <!--New-->
                    <div class="Flexrow dth DpHoldVallbl" id="DpHoldVallbl" runat="server">DP HOLDING VALUE</div>
                    <div class="Flexrow dthh DpHoldValdata" id="DpHoldValdata" runat="server"><span id="DpHoldValspan" runat="server"></span></div>
                </div>
            </div>
        
            <div class="TitleMaskCls" style="margin-bottom:5px;">LIFE ASSURED DETAILS</div>
            <div class="ContentDiv" runat="server">
                <div class="DivFlex">
                    <div class="Flexrow dth AssNameCIdlbl">LIFE ASSURED NAME <span id="CustHolbl" runat="server"> & CUSTOMER ID </span></div>
                    <div class="Flexrow dthh AssNameCIddata"><span id="AssNamespan" runat="server"></span>&nbsp;<span id="CustHodata" runat="server">-&nbsp;[<span id="AssCIdspan" runat="server"></span>]</span></div>
                    <div class="Flexrow dth GenAgelbl">ASSURED GENDER-AGE</div>
                    <div class="Flexrow dthh GenAgedata"><span id="Genspan" runat="server"></span>&nbsp;-&nbsp;<span id="Age_span" runat="server"></span></div>
                    <div class="Flexrow dth AssDoblbl">ASSURED DOB</div>
                    <div class="Flexrow dthh AssDobdata" ><span id="AssDobspan" runat="server"></span></div>
                    <div class="Flexrow dth AssMarStslbl">ASSURED MARITAL STATUS</div>
                    <div class="Flexrow dthh AssMarStsdata"><span id="AssMarStsspan" runat="server"></span></div>
                    <div class="Flexrow dth AssEdulbl">ASSURED EDUCATION</div>
                    <div class="Flexrow dthh AssEdudata"><span id="AssEduspan" runat="server"></span></div>
                    <div class="Flexrow dth AssOcculbl">ASSURED OCCUPATION</div>
                    <div class="Flexrow dthh AssOccudata"><span id="AssOccuspan" runat="server"></span></div>
                    <div class="Flexrow dth AssCkycStslbl" id="AssCkycStslbl" runat="server">ASSURED CKYC STATUS</div>
                    <div class="Flexrow dthh AssCkycStsdata" id="AssCkycStsdata" runat="server"><span id="AssCkycStsspan" runat="server"></span></div>
                    <div class="Flexrow dth AssNatlbl" id="AssNatlbl" runat="server">ASSURED NATIONALITY</div>
                    <div class="Flexrow dthh AssNatdata" id="AssNatdata" runat="server"><span id="AssNatspan" runat="server"></span></div>	
                    <div class="Flexrow dth NomNamelbl">NOMINEE NAME</div>
                    <div class="Flexrow dthh NomNamedata"><span id="NomNamespan" runat="server"></span></div>
                    <!--New-->
                       <div class="Flexrow dth AssCountrylbl" id="AssCountrylbl" runat="server">ASSURED COUNTRY</div>
                       <div class="Flexrow dthh AssCountrydata" id="AssCountrydata" runat="server"><span id="AssCountryspan" runat="server"></span></div>	
                    <!--New-->
                    <div class="Flexrow dth AssCkycNolbl" id="AssCkycNolbl" runat="server">ASSURED CKYC NO</div>
                    <div class="Flexrow dthh AssCkycNodata" id="AssCkycNodata" runat="server"><span id="AssCkycNospan" runat="server"></span></div>
                    <div class="Flexrow dth NomRellbl">NOMINEE RELATION</div>
                    <div class="Flexrow dthh NomReldata"><span id="NomRelspan" runat="server"></span></div>
                    <div class="Flexrow dth NomAgelbl">NOMINEE AGE</div>
                    <div class="Flexrow dthh NomAgedata"><span id="NomAgespan" runat="server"></span></div>
                    <div class="Flexrow dth AppoAgelbl">APPOINTEE AGE</div>
                    <div class="Flexrow dthh AppoAgedata"><span id="AppoAgespan" runat="server"></span></div>
                    <div class="Flexrow dth AppoNamelbl">APPOINTEE NAME</div>
                    <div class="Flexrow dthh AppoNamedata"><span id="AppoNamespan" runat="server"></span></div>
                    <div class="Flexrow dth InvTypelbl">INVESTOR TYPE</div>
                    <div class="Flexrow dthh InvTypedata"><span id="InvTypespan" style="color:green;font-weight: bold;" runat="server"></span></div>	
                    <div class="Flexrow dth AppoRellbl">APPOINTEE RELATION</div>
                    <div class="Flexrow dthh AppoReldata"><span id="AppoRelspan" runat="server"></span></div>
                    <div class="Flexrow dth Remarkslbl">REMARKS</div>
                    <div class="Flexrow dthh Remarksdata"><span id="Remarksspan" runat="server"></span></div>	
                    <div class="Flexrow dth ProcUser1lbl" id="PUser1Lbl" runat="server" style="display:none;">PROCURRED BY USER1</div>
                    <div class="Flexrow dthh ProcUser1data" id="PUser1Div" runat="server" style="display:none;"><span id="ProcUser1span" style="color:green;font-weight: bold;" runat="server"></span></div>
                    <div class="Flexrow dth ProcUser2lbl" id="PUser2Lbl" runat="server" style="display:none;">PROCURRED BY USER2</div>
                    <div class="Flexrow dthh ProcUser2data" id="PUser2Div" runat="server" style="display:none;"><span id="ProcUser2span" runat="server"></span></div>	
                    <!--New start-->
                    <div class="Flexrow dth ProcUser1perclbl">PROCURRED BY USER1 (<span class="colorcls2"> % </span>)</div>
                    <div class="Flexrow dthh ProcUser1percdata"><span id="ProcUser1percspan" runat="server"></span></div>
                    <div class="Flexrow dth ProcUser2perclbl">PROCURRED BY USER2 (<span class="colorcls2"> % </span>)</div>
                    <div class="Flexrow dthh ProcUser2percdata"><span id="ProcUser2percspan" runat="server"></span></div>	
                    <!--New end-->
                </div>
            </div>

            <div class="ContentDiv" runat="server">
                <div class="DivFlex">
                    <div class="Flexrow dth InsColbl">INSURANCE COMPANY</div>
                    <div class="Flexrow dthh InsCodata"><span id="InsCospan" runat="server"></span></div>
                    <div class="Flexrow dth PlanNamelbl">PLAN NAME</div>
                    <div class="Flexrow dthh PlanNamedata"><span id="PlanNamespan" runat="server"></span></div>
                    <div class="Flexrow dth ApplNolbl">APPLICATION NO</div>
                    <div class="Flexrow dthh ApplNodata" ><span id="ApplNospan" runat="server"></span></div>
                    <div class="Flexrow dth Termlbl">TERM</div>
                    <div class="Flexrow dthh Termdata"><span id="Termspan" runat="server"></span></div>
                    <div class="Flexrow dth PPTlbl">PPT</div>
                    <div class="Flexrow dthh PPTdata"><span id="PPTspan" runat="server"></span></div>
                    <div class="Flexrow dth PremAmtlbl">PREMIUM AMOUNT</div>
                    <div class="Flexrow dthh PremAmtdata"><span id="PremAmtspan" runat="server"></span></div>
                    <div class="Flexrow dth Modelbl">MODE</div>
                    <div class="Flexrow dthh Modedata"><span id="Modespan" runat="server"></span></div>
                    <div class="Flexrow dth CollePremlbl">COLLECTED PREMIUM</div>
                    <div class="Flexrow dthh CollePremdata"><span id="CollePremspan" runat="server"></span></div>
                    <div class="Flexrow dth PolicyNolbl">POLICY NO</div>
                    <div class="Flexrow dthh PolicyNodata"><span id="PolicyNospan" runat="server"></span></div>
                    <div class="Flexrow dth SumAssulbl">SUM ASSURED</div>
                    <div class="Flexrow dthh SumAssudata"><span id="SumAssuspan" runat="server"></span></div>
                    <div class="Flexrow dth Doclbl" id="DOCLbl" runat="server" style="display:none;">DOC</div>
                    <div class="Flexrow dthh Docdata" id="DOCDiv" runat="server" style="display:none;"><span id="Docspan" runat="server"></span></div>
                    <div class="Flexrow dth EntryDtUserlbl" id="EDtLbl" runat="server" style="display:none;">ENTRY DATE & USER</div>
                    <div class="Flexrow dthh EntryDtUserdata" id="EDtDiv" runat="server" style="display:none;"><span id="EntryDtspan" style="color:green;font-weight: bold;" runat="server"></span>&nbsp;<span id="EntryUserspan" style="color:green;font-weight: bold;" runat="server"></span></div>	
                    <div class="Flexrow dth BrncStslbl">BRANCH STATUS</div>
                    <div class="Flexrow dthh BrncStsdata"><span id="BrncStsspan" style="color:red;font-weight: bold;" runat="server"></span></div>	
                    <div class="Flexrow dth HoStslbl">HO STATUS</div>
                    <div class="Flexrow dthh HoStsdata"><span id="HoStsspan" style="color:red;font-weight: bold;" runat="server"></span></div>		
                </div>
            </div>

            <div class="TitleMaskCls" style="margin-bottom:5px;">CHEQUE DETAILS</div>
            <div class="ContentDiv" runat="server">
                <div class="DivFlex">
                    <div class="Flexrow dth PayModelbl" id="PayModelbl" runat="server">PAYMENT MODE</div>
                    <div class="Flexrow dthh PayModedata" id="PayModedata" runat="server"><span id="PayModespan" runat="server"></span></div>
                    <div class="Flexrow dth CheqNolbl" id="CheqNolbl" runat="server">CHEQUE/DD NO</div>
                    <div class="Flexrow dthh CheqNodata" id="CheqNodata" runat="server"><span id="CheqNospan" runat="server"></span></div>
                    <div class="Flexrow dth CheqDtlbl" id="CheqDtlbl" runat="server">CHEQUE DATE</div>
                    <div class="Flexrow dthh CheqDtdata" id="CheqDtdata" runat="server"><span id="CheqDtspan" runat="server"></span></div>
                    <div class="Flexrow dth CheqAmtlbl" id="CheqAmtlbl" runat="server">CHEQUE AMOUNT</div>
                    <div class="Flexrow dthh CheqAmtdata" id="CheqAmtdata" runat="server"><span id="CheqAmtspan" runat="server"></span></div>
                    <div class="Flexrow dth Banklbl" id="Banklbl" runat="server">BANK NAME</div>
                    <div class="Flexrow dthh Bankdata" id="Bankdata" runat="server"><span id="Bankspan" runat="server"></span></div>
                    <div class="Flexrow dth BPlacelbl" id="BPlacelbl" runat="server">BANK PLACE</div>
                    <div class="Flexrow dthh BPlacedata" id="BPlacedata" runat="server"><span id="BPlacespan" runat="server"></span></div>
                    <div class="Flexrow dth NOIlbl" id="NOIlbl" runat="server">NOI</div>
                    <div class="Flexrow dthh NOIdata" id="NOIdata" runat="server"><span id="NOIspan" runat="server"></span></div>
                </div>
            </div>
        
            <div class="TitleMaskCls" id="TempAcknoDivHead" style="margin-bottom:5px;display:none;" runat="server">TEMPORARY ACK.NO DETAILS</div>
            <div class="ContentDiv" id="TempAcknoDiv" style="display:none;" runat="server">
                <div class="DivFlex">
                    <div class="Flexrow dth TemRecNolbl">TEMP RECEIPT NO</div>
                    <div class="Flexrow dthh TemRecNodata"><span id="TemRecNospan" runat="server"></span></div>
                    <div class="Flexrow dth TemPolNolbl">TEMP POLICY/CONTRACT NO</div>
                    <div class="Flexrow dthh TemPolNodata"><span id="TemPolNospan" runat="server"></span></div>
                    <div class="Flexrow dth PlaceLoglbl">PLACE OF LOGIN</div>
                    <div class="Flexrow dthh PlaceLogdata"><span id="PlaceLogspan" runat="server"></span></div>
                    <div class="Flexrow dth RecpDtlbl">RECEIPT DATE</div>
                    <div class="Flexrow dthh RecpDtdata"><span id="RecpDtspan" runat="server"></span></div>
                </div>
            </div>

            <div class="TitleMaskCls" style="margin-bottom:5px;">SCAN DETAILS</div>
            <div class="ContentDiv" runat="server">
                <div class="DivFlex">
                    <div class="Flexrow dth TemRecScanStslbl">TEMP RECEIPT SCAN STATUS</div>
                    <div class="Flexrow dthh TemRecScanStsdata"><span id="TemRecScanStsspan" runat="server"></span><span id="TempRejReasonspan" runat="server"></span></div>
                    <div class="Flexrow dth AppScanStslbl">APPLICATION SCAN STATUS</div>
                    <div class="Flexrow dthh AppScanStsdata"><span id="AppScanStsspan" runat="server"></span><span id="ApplRejReasonspan" runat="server"></span></div>
                </div>
            </div>

            <div class="TitleMaskCls" id="GpDiv" runat="server" style="margin-bottom:5px;">JOINT HOLDER DETAILS</div>
            <div class="ContentDiv" id="GP_Div" runat="server">
                <div class="DivFlex">
                    <div class="Flexrow dth JoinHolNamelbl">JOINT HOLDER NAME</div>
                    <div class="Flexrow dthh JoinHolNamedata"><span id="JoinHolNamespan" runat="server"></span></div>
                    <div class="Flexrow dth Dtoblbl">DATE OF BIRTH</div>
                    <div class="Flexrow dthh Dtobdata"><span id="TDtobspan" runat="server"></span></div>
                    <div class="Flexrow dth SumAslbl">SUM ASSURED</div>
                    <div class="Flexrow dthh SumAsdata"><span id="SumAsspan" runat="server"></span></div>
                </div>
            </div>
            <div id="RepeaterTable" runat="server"></div>
        </div>  
    </form>
    </body>
</html>
