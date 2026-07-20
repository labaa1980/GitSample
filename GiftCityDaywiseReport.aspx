<%@ Page Language="C#" Culture="en-IN" UICulture="en-IN" Inherits="IEILShell.GiftCityDaywiseReport" Debug="true" CodeFile="BusinessLogic/GiftCityDaywiseReport.aspx.cs" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7;chrome=1;IE=EDGE">
    <meta name="HandheldFriendly" content="true">
    <script src="/Integrated/Scripts/jquery-3.5.1.js"></script>
    <script src="/Integrated/Scripts/AjaxLoaderV2.js"></script>
    <script src="/Integrated/Scripts/hex.js"></script>
    <script src="/Integrated/Scripts/CommonKeypress.js"></script>
    <script type="text/javascript" src="/Integrated/Scripts/DatePickerV2/Zebra/public/javascript/zebra_datepicker.src.js"></script>
    <link rel="stylesheet" href="/Integrated/Scripts/DatePickerV2/Zebra/public/css/default.css" type="text/css" />
    <script src="/Integrated/Scripts/DateValidator.js"></script>
    <script src="Scripts/GiftCityDaywiseReport.js"></script>
    <script src="Scripts/Insurance_ReportAllAjax.js"></script>
    <link rel="stylesheet" href="Styles/GiftCityDaywiseReport.css">
    <title>Gift City Daywise Report</title>
</head>
<body onload="initDoc();"> 
    <!--Loader div-->
    <div class="LoadingMask">
        <div class='Loadingring'>
            <img src='Images/NewLogo.png' class="LoadingImg">
        </div>
    </div>

    <!--Alert Mask Message Div-->
    <div class="MaskAlert" id="MaskAlert" runat="server">
        <div class="MaskAlertcon">
            <div class="MaskAlertTitle"><img src="Images/NewLogo.png" width="80%" height="5%"></div>
            <div class="MaskAlertMsg"><span id="MsgAlert" runat="server"></span></div>
            <div class="MaskButton">
                <input type="button" id="BtnClose" value="Close" onclick="return CloseMask();" class="ButtonClass">
                <input type="button" id="Reloadbtn" value="Close" onclick="return ReloadMask();" class="ButtonClass">
            </div>
        </div>
    </div>

    <!--Confirmation Alert Mask Message Div-->
    <div class="ConfMaskAlert" id="ConfMaskAlert" runat="server">
        <div class="ConfMaskAlertcon">
            <div class="ConfMaskAlertTitle"><img src="Images/NewLogo.png" width="80%" height="5%"></div>
            <div class="ConfMaskAlertMsg"><span id="ConfMsgAlert" runat="server"></span></div>
            <div class="ConfMaskButton">
                <input type="button" id="BtnYes" value="Yes" onclick="return SaveYesClick();" class="ButtonClass">
                <input type="button" id="BtnBrnYes" value="Yes" onclick="return SaveBrnYes_Click();" class="ButtonClass">
                <input type="button" id="BtnNo" value="No" onclick="return ConfCloseMask();" class="ButtonClass">
            </div>
        </div>
    </div>

    <!--Cancel Confirmation Alert Mask Message Div-->
    <div class="CanConfMaskAlert" id="CanConfMaskAlert" runat="server">
        <div class="CanConfMaskAlertcon">
            <div class="CanConfMaskAlertTitle"><img src="Images/NewLogo.png" width="80%" height="5%"></div>
            <div class="CanConfMaskAlertMsg"><span id="CanConfMsgAlert" runat="server"></span></div>
            <div class="CanConfMaskButton">
                <input type="button" id="CancBtnYes" value="Yes" onclick="return CanSaveYesClick();" class="ButtonClass" style="display:none;">
                <input type="button" id="AppCancBtnYes" value="Yes" onclick="return AppCanSaveYesClick();" class="ButtonClass" style="display:none;">
                <input type="button" id="CancBtnNo" value="No" onclick="return CanConfCloseMask();" class="ButtonClass">
            </div>
        </div>
    </div>

    <form runat="server" autocomplete="off" onsubmit="if(validateMode()){this.myDoc.value=oDoc.innerHTML;return true;}return false;">
        <input type="hidden" id="EbiRefNoValHidn" runat="server">
        <asp:Button ID="EmpUploadDownldBtn" runat="server" Text="Name of web location" onclick=EBIDownloadStsClick style="display:none;"/>
        <input type="hidden" id="Userhid" runat="server">
        <input type="hidden" id="RegionHidden" runat="server">
        <input type="hidden" id="BranchHidden" runat="server">
        <input type="hidden" id="RBDHidden" runat="server">
        <input type="hidden" id="Prodhid" runat="server">
        <input type="hidden" id="SelTypehid" runat="server">
        <input type="hidden" id="Fdthid" runat="server">
        <input type="hidden" id="Tdthid" runat="server">
        <input type="hidden" id="companyHidden" value="100" runat="server">
        <input type="hidden" id="AppliHiddentext" runat="server">
        <input type="hidden" id="CheckBoxHidden" runat="server">
        <input type="hidden" id="RefnoHidden" runat="server">
        <input type="hidden" id="HRefNo" runat="server">
        <input type="hidden" id="Hiddentext" runat="server">

        <a href="/include/emphead1.asp" style="float:left" class="Backbtnmenu">Back to Menu</a>

        <!--Main Div-->
        <div class="TitleCls">Gift City Daywise Report</div>
        <div class="DivContainer">
            <div class="Container1"> 
                <div class="CompLbl Lblcls">Company</div>
                <div class="CompDiv">
                    <select class="DdlClsF CompDDl" id="CompDDl" onchange="Compchange();" runat="server"></select>
                </div>

                <div class="RegLbl Lblcls">Region</div>
                <div class="RegDiv">
                    <select id="RegionDDL" class="DdlClsF RegionDDL" runat="server"></select>
                </div>
              
                <div class="BrnLbl Lblcls">Branch</div>
                <div class="BrnDiv">
                    <select id="BranchDDL" class="DdlClsF BranchDDL" runat="server">
                        <option value="100000000">ALL</option>
                    </select>
                </div>

                <div class="FdateLbl Lblcls">From Date</div>
                <div class="FdateDiv">
                    <input type="text" class="TxtClsF Fromdatedt datecls" id="Fromdatedt" oninput="this.value=this.value.replace(/[^0-9/]/g, '');" placeholder="DD/MM/YYYY" maxlength="10" runat="server">
                </div>

                <div class="TdateLbl Lblcls">To Date</div>
                <div class="TdateDiv">
                    <input type="text" class="TxtClsF Todatedt datecls" id="Todatedt" oninput="this.value=this.value.replace(/[^0-9/]/g, '');" placeholder="DD/MM/YYYY" maxlength="10" runat="server">
                </div>  

                <div class="SubmitbtnDiv">
                    <input type="submit" value="Submit" class="Submitbtn" id="Submitbtn" onserverclick="Submit_Click" onclick="return Submit_Validation();" runat="server">
                </div>
            </div>
        </div><br>

        <!--Table Div-->
        <div class="TableDiv" id="TableDiv" runat="server" style="max-height:430px;font-size:13px;overflow-y:auto;width:100%;margin:auto;border:none;display:none;">
            <asp:Repeater ID="Appl_Repeater" runat="server">
               <HeaderTemplate>
                   <div class="TableDivFlex TableDivHeader" style="top:0; position: sticky;font-weight:bolder;">
                        <div class="TableDivFlexrow Appl_Sno">#</div>
                        <div class="TableDivFlexrow Appl_Ack">ACK No</div>
                        <div class="TableDivFlexrow Appl_Name">Insured Name</div>
                        <div class="TableDivFlexrow Appl_CoPlan">INS CO <br> Plan-[Mode]</div>
                        <div class="TableDivFlexrow Appl_ColPre">Collected Premium</div>
                        <div class="TableDivFlexrow Appl_AnuPre">Annual Premium</div>
                        <div class="TableDivFlexrow Appl_ProcBy">Procurred By</div>
                        <div class="TableDivFlexrow Appl_BrHosts">BR Status <br> HO Status</div>
                        <div class="TableDivFlexrow Appl_Temp">Temp Ack. Scan Status</div>
                        <div class="TableDivFlexrow Appl_ApScan">Appli. Scan Status</div>
                        <div class="TableDivFlexrow Appl_EDtUser">Entry Date/User</div>
                        <div class="TableDivFlexrow Appl_AVUsts">Audio/Video Upload Status</div>
                        <div class="TableDivFlexrow Appl_AVCsts">Audio/Video Confirm Status</div>
                        <div class="TableDivFlexrow Appl_Canc">Cancellation Request</div>
                        <div class="TableDivFlexrow Appl_Brn">Branch Request</div>
                   </div>
               </HeaderTemplate>
               <ItemTemplate>
                    <div class="RegionAndBranch ApplCont" id="ApplCont_<%#Container.ItemIndex+1%>" data-ackno="<%# Eval("Online_Ack_No").ToString().Trim() %>">
                        <div class="Regbranheader" visible='<%# RegionBranch_Name(Eval("branch_name").ToString().Trim()) %>' runat="server">
                            <%#Eval("branch_name").ToString().Trim()%>
                        </div>
                    </div>
                    <div class="Regbranheader">
                        <%# ApplAckNoHeader(Eval("Region_Code").ToString().Trim(),Eval("Branch_Code").ToString().Trim(),Eval("Ref_No").ToString().Trim(),Eval("branch_name").ToString().Trim(),Eval("Online_Ack_No").ToString().Trim(),FormatAmount(Eval("Premium_Amount")),FormatAmount(Eval("Annualised_Premium")),Eval("Remarks").ToString().Trim()) %>
                    </div>
                    <div class="TableDivFlex TableDivContent Contswap ApplCont" id="TableDivContent_<%#Container.ItemIndex+1%>"  data-ackno="<%# Eval("Online_Ack_No").ToString().Trim() %>">
                        <div class="TableDivFlexrow Appl_Sno ReAckSno">
                            <%#Container.ItemIndex+1%>
                        </div>
                        <div class="TableDivFlexrow Appl_Ack">
                            <div id="ackno_id" class="colorcls" onclick="javascript:return ACKNO_Click('<%# Eval("Ref_No").ToString().Trim() %>')"><%# Eval("Online_Ack_No").ToString().Trim() %></div>
                        </div>
                        <div class="TableDivFlexrow Appl_Name">
                            <%# Eval("client_name").ToString().Trim() %> - <span style="text-decoration: underline;color: blue;cursor:pointer;" onclick="javascript:return CustId_FullView('<%# Eval("Iep_Cust_id").ToString().Trim() %>')" ><%# Eval("Iep_Cust_id").ToString().Trim() %></span>
                        </div>
                        <div class="TableDivFlexrow Appl_CoPlan">
                            <%# Eval("Ins_company_name").ToString().Trim() %><br>
                            <%# Eval("Ins_plan_name").ToString().Trim() %>-<span class="colorcls2">[<%# Eval("Mode_Premium_Name").ToString().Trim() %>]</span>
                        </div>
                        <div class="TableDivFlexrow aligncls Appl_ColPre">
                            <!-- <%# Convert.ToDouble(Eval("Premium_Amount").ToString().Trim()) %> -->
                            <%# FormatAmount(Eval("Premium_Amount")) %>
                        </div>
                        <div class="TableDivFlexrow aligncls Appl_AnuPre">
                            <%# FormatAmount(Eval("Annualised_Premium")) %>
                        </div>
                        <div class="TableDivFlexrow Appl_ProcBy">
                            <%# Eval("Business_procurred_by").ToString().Trim() %><br>
                            <%# Eval("Business_Procurred_by_2").ToString().Trim() %>
                        </div>
                        <div class="TableDivFlexrow Appl_BrHosts">
                            <%# Eval("br_status").ToString().Trim() %><br>
                            <%# Eval("Ho_status").ToString().Trim() %>
                        </div>
                        <div class="TableDivFlexrow Appl_Temp">
                            <%# Repeater_Temp_Status(Eval("temp_ack_scan_status").ToString().Trim(),Eval("temp_scan_conf_date").ToString().Trim(),Eval("Temp_scan_Conf_user").ToString().Trim(),Eval("Temp_scan_user").ToString().Trim(),Eval("temp_scan_date").ToString().Trim(),Eval("Online_ack_no").ToString().Trim(),Eval("Region_Code").ToString().Trim(),Eval("Branch_Code").ToString().Trim(),Eval("Ref_No").ToString().Trim()) %>
                            <%# Repeater_Reason_Temp(Eval("Temp_Ack_Reject_reason").ToString().Trim()) %>
                        </div>
                        <div class="TableDivFlexrow Appl_ApScan">
                            <%# Repeater_Appli_Status(Eval("full_application_scan_status").ToString().Trim(),Eval("Appli_scan_conf_date").ToString().Trim(),Eval("Appli_Scan_conf_user").ToString().Trim(),Eval("Online_ack_no").ToString().Trim(),Eval("Region_Code").ToString().Trim(),Eval("Branch_Code").ToString().Trim(),Eval("Ref_No").ToString().Trim()) %>
                            <%# Repeater_Reason_Appli(Eval("Appl_Reject_reason").ToString().Trim()) %>
                        </div>
                        <div class="TableDivFlexrow Appl_EDtUser">
                            <%# Eval("crt_dtm").ToString().Trim() %> <br> 
                            <span class="spancls2"><%# Eval("Entered_user").ToString().Trim() %></span>
                            <%# Repeater_EBI(Eval("EBI_upload_Status").ToString().Trim(),Eval("Ref_No").ToString().Trim()) %>
                        </div>
                        <div class="TableDivFlexrow Appl_AVUsts">
                            <%# VideoStatus(Eval("Video_Status").ToString().Trim(),Eval("VideoUpld_user").ToString().Trim(),Eval("Video_Upl_Date").ToString().Trim()) %>
                        </div>
                        <div class="TableDivFlexrow Appl_AVCsts">
                            <%# VideoConfStatus(Eval("Video_Confirm_Status").ToString().Trim(),Eval("Video_Confirm_User").ToString().Trim(),Eval("Video_Confirm_Date").ToString().Trim(),Eval("Remarks").ToString().Trim()) %>
                        </div>
                        <div class="TableDivFlexrow Appl_Canc">
                            <%# AppliCancelReq(Eval("CancelLink").ToString().Trim(),Container.ItemIndex+1,Eval("Ref_No").ToString().Trim(),Eval("Region_Code").ToString().Trim(),Eval("Branch_Code").ToString().Trim()) %>
                        </div>
                        <div class="TableDivFlexrow Appl_Brn">
                            <%# BrnReq(Container.ItemIndex+1,Eval("BranchRequest").ToString().Trim(),Eval("Online_Ack_No").ToString().Trim()) %>
                        </div>
                    </div>
               </ItemTemplate>
               <FooterTemplate>
               </FooterTemplate>
            </asp:Repeater>
        </div><br>

        <div id="Nodatadiv" class="Nodatadiv" runat="server">No Data Found..!</div>

        <!--Full View Mask Window Div-->
        <div class="FullViewMask">
            <div class="FullViewAlertcon">
                <div id="DetailLoad" runat="server"></div>
            </div>
        </div>

        <!--CustId Full View-->
        <div class="CustIdMaskWindow">
            <div class="CustIdAlertcon">
                <div class="CustTitle">Integrated Customer Details Report<span class="SpanCloseId" onclick="return CustIdMaskClose();" runat="server">X</span></div>
                <div id="CustIdLoad" runat="server"></div>
            </div>
        </div>

        <!--Radio Btn Click Mask (View Column)-->
        <div class="PendAnalMaskWindow" runat="server">
            <div class="PendAnalAlertcon">
                <div class="PendAnalTitle">Need Analyser Status Updation Ack.No :<span class="spancls1" id="Ack_Num" runat="server"></span><span class="SpanCloseId" onclick="return PendAnalMaskClose();" runat="server">X</span></div>
                <div class="NeedPendContainer">
                    <div class="StsTypeLbl">Status Type</div>
                    <div class="StsTypeDiv">
                        <select id="LeadStatus" class="LeadStatus DdlClsF" runat="server">
                            <option value="0">--Select--</option>
                            <option value="C">Confirm</option>
                            <option value="R">Reject</option>
                            <option value="P">Pending</option>
                        </select>
                    </div>
                    <div class="ReasDtlLbl">Reason Detail</div>
                    <div class="ReasDtlDiv">
                        <textarea id="LeadReason" maxlength="500" class="TxtClsF LeadReason" placeholder="Enter the Reason"></textarea>&nbsp;<span class="colorcls2">Max Length 500 Character</span>
                    </div>
                    <div class="SaveBtnDiv">
                        <input type="button" id="SaveBtn" class="SaveBtn" value="Save" runat="server" onclick="return Save();">
                        <input type="button" id="CancelBtn" class="CancelBtn" value="Cancel" onclick="return PendAnalMaskClose();">
                    </div>
                    <div class="NoteDiv">
                        <div class="NoteHead">&nbsp;Note:-</div>
                        <ul>
                            <li><span style="color:blue;font-weight: bold;">CONFIRM:</span>When you select this option you will be closing the lead with its detail,like, you give the details of business done when the lead results in business and close it or give your narration for no business and close the lead.</li>
                            <li><span style="color:blue;font-weight: bold;">PENDING:</span>When you select this option, it indicates that you are likely to get business but, may be, it requires few more attempt, hence you have to meet the customer again at a later date/time. Your remarks will be according to it and do the update. Moreover, you can continue to give many more update for the same lead. Therefore, to sum up, all the pending cases will continue to reflect in your screen until the are closed with the above option.</li>
                            <li><span style="color:blue;font-weight: bold;">REJECT:</span>You use this option and give your remarks when the leads don't fall under either of the above category, if it is a duplicate entry or the customer is no longer interested etc.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!--Brn Req Radio Btn Click Mask-->
        <div class="BrnReqMaskWindow" runat="server">
            <div class="BrnReqAlertcon">
                <div class="BrnReqTitle">Branch Request  Inward/Ack. No :<span class="spancls1" id="InwNo" runat="server"></span><span class="SpanCloseId" onclick="return BrnReqMaskClose();" runat="server">X</span></div>
                <div class="BrnReqContainer">
                    <div class="SubjLbl">Subject</div>
                    <div class="SubjDiv">
                        <textarea id="ReqSubject" maxlength="500" class="TxtClsF ReqSubject" oninput="this.value=this.value.replace(/[^a-zA-Z0-9,. ]/g, '');" placeholder="Enter the Subject" ></textarea>
                    </div>
                    <input type="hidden" name="myDoc">
                    <div id="toolBar1" class="toolBar1">
                        <select  class="DdlClsF" onchange="formatDoc('formatblock',this[this.selectedIndex].value);this.selectedIndex=0;">
                            <option selected>- formatting -</option>
                            <option value="h1">Title 1 &lt;h1&gt;</option>
                            <option value="h2">Title 2 &lt;h2&gt;</option>
                            <option value="h3">Title 3 &lt;h3&gt;</option>
                            <option value="h4">Title 4 &lt;h4&gt;</option>
                            <option value="h5">Title 5 &lt;h5&gt;</option>
                            <option value="h6">Subtitle &lt;h6&gt;</option>
                            <option value="p">Paragraph &lt;p&gt;</option>
                            <option value="pre">Preformatted &lt;pre&gt;</option>
                        </select>
                        <select class="DdlClsF" onchange="formatDoc('fontname',this[this.selectedIndex].value);this.selectedIndex=0;">
                            <option class="heading" selected>- font -</option>
                            <option>Arial</option>
                            <option>Arial Black</option>
                            <option>Courier New</option>
                            <option>Times New Roman</option>
                        </select>
                        <select class="DdlClsF" onchange="formatDoc('fontsize',this[this.selectedIndex].value);this.selectedIndex=0;">
                            <option class="heading" selected>- size -</option>
                            <option value="1">Very small</option>
                            <option value="2">A bit small</option>
                            <option value="3">Normal</option>
                            <option value="4">Medium-large</option>
                            <option value="5">Big</option>
                            <option value="6">Very big</option>
                            <option value="7">Maximum</option>
                        </select>
                        <select class="DdlClsF" onchange="formatDoc('forecolor',this[this.selectedIndex].value);this.selectedIndex=0;">
                            <option class="heading" selected>- color -</option>
                            <option value="red">Red</option>
                            <option value="blue">Blue</option>
                            <option value="green">Green</option>
                            <option value="black">Black</option>
                        </select>
                        <select class="DdlClsF" onchange="formatDoc('backcolor',this[this.selectedIndex].value);this.selectedIndex=0;">
                            <option class="heading" selected>- background -</option>
                            <option value="red">Red</option>
                            <option value="green">Green</option>
                            <option value="black">Black</option>
                        </select>
                    </div>
                    <div id="toolBar2" class="toolBar2">
                        <img class="intLink" title="Undo" onclick="formatDoc('undo');" src="data:image/gif;base64,R0lGODlhFgAWAOMKADljwliE33mOrpGjuYKl8aezxqPD+7/I19DV3NHa7P///////////////////////yH5BAEKAA8ALAAAAAAWABYAAARR8MlJq7046807TkaYeJJBnES4EeUJvIGapWYAC0CsocQ7SDlWJkAkCA6ToMYWIARGQF3mRQVIEjkkSVLIbSfEwhdRIH4fh/DZMICe3/C4nBQBADs=" />
                        <img class="intLink" title="Redo" onclick="formatDoc('redo');" src="data:image/gif;base64,R0lGODlhFgAWAMIHAB1ChDljwl9vj1iE34Kl8aPD+7/I1////yH5BAEKAAcALAAAAAAWABYAAANKeLrc/jDKSesyphi7SiEgsVXZEATDICqBVJjpqWZt9NaEDNbQK1wCQsxlYnxMAImhyDoFAElJasRRvAZVRqqQXUy7Cgx4TC6bswkAOw==" />
                        <img class="intLink" title="Remove formatting" onclick="formatDoc('removeFormat')" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAADEtGw7AAAABGdBTUEAALGPC/xhBQAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAAd0SU1FB9oECQMCKPI8CIIAAAAIdEVYdENvbW1lbnQA9syWvwAAAuhJREFUOMtjYBgFxAB501ZWBvVaL2nHnlmk6mXCJbF69zU+Hz/9fB5O1lx+bg45qhl8/fYr5it3XrP/YWTUvvvk3VeqGXz70TvbJy8+Wv39+2/Hz19/mGwjZzuTYjALuoBv9jImaXHeyD3H7kU8fPj2ICML8z92dlbtMzdeiG3fco7J08foH1kurkm3E9iw54YvKwuTuom+LPt/BgbWf3//sf37/1/c02cCG1lB8f//f95DZx74MTMzshhoSm6szrQ/a6Ir/Z2RkfEjBxuLYFpDiDi6Af///2ckaHBp7+7wmavP5n76+P2ClrLIYl8H9W36auJCbCxM4szMTJac7Kza////R3H1w2cfWAgafPbqs5g7D95++/P1B4+ECK8tAwMDw/1H7159+/7r7ZcvPz4fOHbzEwMDwx8GBgaGnNatfHZx8zqrJ+4VJBh5CQEGOySEua/v3n7hXmqI8WUGBgYGL3vVG7fuPK3i5GD9/fja7ZsMDAzMG/Ze52mZeSj4yu1XEq/ff7W5dvfVAS1lsXc4Db7z8C3r8p7Qjf///2dnZGxlqJuyr3rPqQd/Hhyu7oSpYWScylDQsd3kzvnH738wMDzj5GBN1VIWW4c3KDon7VOvm7S3paB9u5qsU5/x5KUnlY+eexQbkLNsErK61+++VnAJcfkyMTIwffj0QwZbJDKjcETs1Y8evyd48toz8y/ffzv//vPP4veffxpX77z6l5JewHPu8MqTDAwMDLzyrjb/mZm0JcT5Lj+89+Ybm6zz95oMh7s4XbygN3Sluq4Mj5K8iKMgP4f0////fv77//8nLy+7MCcXmyYDAwODS9jM9tcvPypd35pne3ljdjvj26+H2dhYpuENikgfvQeXNmSl3tqepxXsqhXPyc666s+fv1fMdKR3TK72zpix8nTc7bdfhfkEeVbC9KhbK/9iYWHiErbu6MWbY/7//8/4//9/pgOnH6jGVazvFDRtq2VgiBIZrUTIBgCk+ivHvuEKwAAAAABJRU5ErkJggg==">
                        <img class="intLink" title="Bold" onclick="formatDoc('bold');" src="Images/bold.gif"/>
                        <img class="intLink" title="Italic" onclick="formatDoc('italic');" src="Images/italic.gif"  />
                        <img class="intLink" title="Underline" onclick="formatDoc('underline');"  src="Images/Underline.gif" />
                        <img class="intLink" title="Left align" onclick="formatDoc('justifyleft');" src="Images/justifyleft.gif" />
                        <img class="intLink" title="Center align" onclick="formatDoc('justifycenter');" src="Images/justifycenter.gif"  />
                        <img class="intLink" title="Right align" onclick="formatDoc('justifyright');"  src="Images/justifyright.gif"  />
                        <img class="intLink" title="Numbered list" onclick="formatDoc('insertorderedlist');" src="Images/numberedlist.gif"  />
                        <img class="intLink" title="Dotted list" onclick="formatDoc('insertunorderedlist');" src="data:image/gif;base64,R0lGODlhFgAWAMIGAAAAAB1ChF9vj1iE33mOrqezxv///////yH5BAEAAAcALAAAAAAWABYAAAMyeLrc/jDKSesppNhGRlBAKIZRERBbqm6YtnbfMY7lud64UwiuKnigGQliQuWOyKQykgAAOw==" />
                        <img class="intLink" title="Quote" onclick="formatDoc('formatblock','blockquote');" src="data:image/gif;base64,R0lGODlhFgAWAIQXAC1NqjFRjkBgmT9nqUJnsk9xrFJ7u2R9qmKBt1iGzHmOrm6Sz4OXw3Odz4Cl2ZSnw6KxyqO306K63bG70bTB0rDI3bvI4P///////////////////////////////////yH5BAEKAB8ALAAAAAAWABYAAAVP4CeOZGmeaKqubEs2CekkErvEI1zZuOgYFlakECEZFi0GgTGKEBATFmJAVXweVOoKEQgABB9IQDCmrLpjETrQQlhHjINrTq/b7/i8fp8PAQA7" />
                        <img class="intLink" title="Delete indentation" onclick="formatDoc('outdent');" src="Images/Outdent.gif" />
                        <img class="intLink" title="Add indentation" onclick="formatDoc('indent');" src="Images/indent.gif"  />
                        <img class="intLink" title="Hyperlink" onclick="var sLnk=prompt('Write the URL here','http:\/\/');if(sLnk&&sLnk!=''&&sLnk!='http://'){formatDoc('createlink',sLnk)}" src="data:image/gif;base64,R0lGODlhFgAWAOMKAB1ChDRLY19vj3mOrpGjuaezxrCztb/I19Ha7Pv8/f///////////////////////yH5BAEKAA8ALAAAAAAWABYAAARY8MlJq7046827/2BYIQVhHg9pEgVGIklyDEUBy/RlE4FQF4dCj2AQXAiJQDCWQCAEBwIioEMQBgSAFhDAGghGi9XgHAhMNoSZgJkJei33UESv2+/4vD4TAQA7" />
                        <img class="intLink" title="Cut" onclick="formatDoc('cut');" src="data:image/gif;base64,R0lGODlhFgAWAIQSAB1ChBFNsRJTySJYwjljwkxwl19vj1dusYODhl6MnHmOrpqbmpGjuaezxrCztcDCxL/I18rL1P///////////////////////////////////////////////////////yH5BAEAAB8ALAAAAAAWABYAAAVu4CeOZGmeaKqubDs6TNnEbGNApNG0kbGMi5trwcA9GArXh+FAfBAw5UexUDAQESkRsfhJPwaH4YsEGAAJGisRGAQY7UCC9ZAXBB+74LGCRxIEHwAHdWooDgGJcwpxDisQBQRjIgkDCVlfmZqbmiEAOw==" />
                        <img class="intLink" title="Copy" onclick="formatDoc('copy');" src="data:image/gif;base64,R0lGODlhFgAWAIQcAB1ChBFNsTRLYyJYwjljwl9vj1iE31iGzF6MnHWX9HOdz5GjuYCl2YKl8ZOt4qezxqK63aK/9KPD+7DI3b/I17LM/MrL1MLY9NHa7OPs++bx/Pv8/f///////////////yH5BAEAAB8ALAAAAAAWABYAAAWG4CeOZGmeaKqubOum1SQ/kPVOW749BeVSus2CgrCxHptLBbOQxCSNCCaF1GUqwQbBd0JGJAyGJJiobE+LnCaDcXAaEoxhQACgNw0FQx9kP+wmaRgYFBQNeAoGihCAJQsCkJAKOhgXEw8BLQYciooHf5o7EA+kC40qBKkAAAGrpy+wsbKzIiEAOw==" />
                        <img class="intLink" title="Paste" onclick="formatDoc('paste');" src="data:image/gif;base64,R0lGODlhFgAWAIQUAD04KTRLY2tXQF9vj414WZWIbXmOrpqbmpGjudClFaezxsa0cb/I1+3YitHa7PrkIPHvbuPs+/fvrvv8/f///////////////////////////////////////////////yH5BAEAAB8ALAAAAAAWABYAAAWN4CeOZGmeaKqubGsusPvBSyFJjVDs6nJLB0khR4AkBCmfsCGBQAoCwjF5gwquVykSFbwZE+AwIBV0GhFog2EwIDchjwRiQo9E2Fx4XD5R+B0DDAEnBXBhBhN2DgwDAQFjJYVhCQYRfgoIDGiQJAWTCQMRiwwMfgicnVcAAAMOaK+bLAOrtLUyt7i5uiUhADs=" />
                    </div>
                    <div style="display:flex;flex-wrap:wrap;width:100%;">
                        <div class="ReqDtlLbl">Request Detail</div>
                        <div class="ReqDtlDiv">  
                            <div id="textBox" contenteditable="true" class="TxtClsF textBox" oninput="this.value=this.value.replace(/[^a-zA-Z0-9,. ]/g, '');" spellcheck="false"></div>
                        </div>
                        <input type="hidden" id="Bodyhidden2" name="Bodyhidden2" runat="server">
                    </div>
                    <div class="BrnReqBtnDiv">
                        <input type="button" id="BrnSaveBtn" class="BrnSaveBtn" value="Save" runat="server" onclick="return BrnReqSave();">
                        <input type="button" id="BrnCancelBtn" class="BrnCancelBtn" value="Cancel" onclick="return BrnReqMaskClose();">
                    </div>
                    <div class="NoteDiv">
                        <div class="NoteHead">&nbsp;Note:-</div>
                        <ul>
                            <li>It has been noticed that branches are sending a lot of requests for <span class="colorcls2"> correction, addition and deletion of records</span> for entries made in www.iepindia.net. Branches have been sending emails for this purpose to <span class="colorcls2">goldsiva@integratedindia.in</span>. With a view to streamline the above requests, we have developed this screen for the use of the branches.</li>
                            <li>Branches are requested to fill the following entries while sending requests pertaining to Systems Division only. Branches need not send emails seperately to<span class="colorcls2"> goldsiva@integratedindia.in</span>.</li>
                            <li>The replies can be tracked at <span class="colorcls2"> Branch Request Status Report</span> in top of the page.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
<script>
const textInputs = document.querySelectorAll('input[type="text"]');
    textInputs.forEach(function(input){
    input.addEventListener('keydown',function(event){
        if(event.key === 'Enter'){
            event.preventDefault();
        }
    });
});
</script>
</html>