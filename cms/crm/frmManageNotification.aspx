<%@ Page Title="" Language="C#" MasterPageFile="~/crm/main.master" AutoEventWireup="true" CodeFile="frmManageNotification.aspx.cs" Inherits="crm_frmManageNotification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="content-wrapper" style="min-height: 946px;">
        <section class="content-header">
            <h1>Alert & Notification Configuration
                <small>Add/Edit</small>
            </h1>
            <ol class="breadcrumb">
        </section>
        <section class="content">


 <div id="Toptabs">
  <ul>
    <li><a href="#tabs-1">Alert Management</a></li>
    <li><a href="#tabs-2">Applicable of Compliances</a></li>
    
  </ul>
  <div id="tabs-1">
       
   <table style="width:100%">
        <tbody>
            <tr>
                <td>
                    <table style="width:100%">
                        <tr>
                            <td>Alert Name:</td>
                            <td >&nbsp;
                                <asp:TextBox runat="server" ID="txtAlertName" CssClass="name" style="width:250px;" MaxLength="100" /></td> 
                            

                             <td>Alert Type:</td>
                            <td>&nbsp;<label class="radio-inline" style="font-weight:normal">
                                <asp:RadioButton Text="Email" GroupName="typeRdo" ID="rdoEmail" runat="server" Checked="true"  style="font-weight:normal"/>
                             
                            </label>
                            <label class="radio-inline">
                             <asp:RadioButton Text="SMS" GroupName="typeRdo" ID="rdoSMS" runat="server" Checked="false" />
                            </label>
                            <label class="radio-inline">
                              <asp:RadioButton Text="Both" GroupName="typeRdo" ID="rdoBoth" runat="server" Checked="false" />
                            </label></td>

                        </tr>

                    </table> 

                </td>                 
            </tr>

             <tr>
                <td>&nbsp;</td>                 
            </tr>
            <tr>
                <td><label>Applicability Rule</label></td>                 
            </tr>
            <tr>
                <td><strong>Due </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="radio-inline">
                                 <asp:RadioButton Text="Before" GroupName="ruleRdo" ID="rdoBefore" runat="server" Checked="true" style="font-weight: 700" />
                               
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton Text="After" GroupName="ruleRdo" ID="rdoAfter" runat="server" Checked="false" />
                              
                            </label></td>                 
            </tr>

            
              <tr>
                <td>Days:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox runat="server" ID="txtDays" CssClass="name" MaxLength="100"  Width="116px" /></td>                 
            </tr>
            <tr>
                <td>&nbsp;</td>                 
            </tr>
             <tr>
                <td><label>Alert Validity</label></td>                 
            </tr>
            <tr>
                <td>
                    <div class="input-append" style="float:left;">
                        From <input data-format="dd/MM/yyyy" class="input-date" id="txtFromDate" type="text" runat="server" ClientIDMode="Static" placeholder="" />
                        
                    </div>


                    <div class="input-append" style="margin-left:50px;">&nbsp;&nbsp;
                        To <input data-format="dd/MM/yyyy" class="input-date" id="txtToDate" type="text" runat="server" ClientIDMode="Static"  placeholder="" />                        
                    </div> 
                </td>                 
            </tr>
            
            <tr>
                <td>&nbsp;</td>                 
            </tr>
             <tr>
                <td><label>Audience</label></td>                 
            </tr>

            <tr>
                <td>
                    <table><tr>

                        <td><asp:CheckBox Text="Responsible User" ID="chkBoxResponsibleUser" runat="server" />&nbsp;&nbsp;</td>

                        <td>&nbsp;&nbsp;<asp:CheckBox Text="Manager" ID="chkBoxManager" runat="server" />&nbsp;&nbsp;</td>

                        <td>&nbsp;<asp:CheckBox Text="Approving Authority" ID="chkBoxApprovingAuthority" runat="server" />&nbsp;&nbsp;</td>

                        <td>&nbsp;<asp:CheckBox Text="Other" ID="chkBoxOther" runat="server" /></td>

                           </tr></table>
                    
                       </td>                 
            </tr>

            <tr>
                <td>&nbsp;</td>                 
            </tr>
             <tr>
                <td><label>Schedule</label></td>                 
            </tr>

            <tr>
                <td><div class="row">
                            <div class="col-md-12 col-xs-12">
                                <label class="radio-inline">
                                     <asp:RadioButton Text="Daily" GroupName="scheduleRdo" ID="rdoDaily" runat="server" Checked="true" />

                                 
                                </label>
                                <label class="radio-inline">
                                   
                                    <asp:RadioButton Text="Weekly" GroupName="scheduleRdo" ID="rdoWeekly" runat="server" Checked="false" />
                                </label>
                                <label class="radio-inline">
                                  
                                    <asp:RadioButton Text="Monthly" GroupName="scheduleRdo" ID="rdoMonthly" runat="server" Checked="false" />
                                </label>
                                <label class="radio-inline">
                                  
                                    <asp:RadioButton Text="Yearly" GroupName="scheduleRdo" ID="rdoYearly" runat="server" Checked="false" />
                                </label>
                            </div>
                        </div></td>                 
            </tr>

            <tr>
                <td>&nbsp;</td>                 
            </tr>
            <tr>
                <td>
                    <asp:HiddenField runat="server" ID="hdnAlertId" Value="" />
                    <asp:Button Text="Update" ID="btnUpdate" runat="server" OnClick="btnSave_Click"  Visible="false" />&nbsp;&nbsp;
                    <asp:Button Text="Save" ID="btnSave" runat="server" OnClick="btnSave_Click" />&nbsp;&nbsp;
                    <input type="button" value="Cancel" /></td>                 
            </tr>

             <tr>
                <td>&nbsp;</td>                 
            </tr>
             <tr>
                <td>
                    <asp:DataGrid ID="Grid" runat="server" PageSize="20" DataKeyField="AlterId" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" Width="100%" OnDeleteCommand="Grid_DeleteCommand" OnEditCommand="Grid_EditCommand">  
                    <Columns>  
                        <asp:BoundColumn HeaderText="Alert Name" DataField="AlertName"> </asp:BoundColumn>  
                        <asp:BoundColumn HeaderText="Type" DataField="AlertType"> </asp:BoundColumn>  
                        <asp:BoundColumn HeaderText="Rule" DataField="ApplicabilityRule"> </asp:BoundColumn>  
                         <asp:BoundColumn HeaderText="Days" DataField="DueDays"> </asp:BoundColumn>  
                        <asp:BoundColumn DataField="AlertValidityFrom" HeaderText="Validity From"> </asp:BoundColumn>  
                        <asp:BoundColumn DataField="AlertValidityTo" HeaderText="Validity To"> </asp:BoundColumn>  
                        <asp:BoundColumn DataField="Schedule" HeaderText="Schedule"> </asp:BoundColumn>                          
                        <asp:ButtonColumn CommandName="Delete" HeaderText="Delete" Text="Delete"> </asp:ButtonColumn>  
                        <asp:ButtonColumn CommandName="Edit" HeaderText="Edit" Text="Edit"> </asp:ButtonColumn>  
                    </Columns>  

                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />  
                    <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" Height="25"/>  
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" Mode="NumericPages"/>  
                    <AlternatingItemStyle BackColor="White" Height="25" />  
                    <ItemStyle BackColor="#ECF0F5" ForeColor="#333333" Height="30" />  
                    <HeaderStyle BackColor="#3C8DBC" Font-Bold="True" ForeColor="White" Height="30" /> 

                    </asp:DataGrid> <br /> <br />  
               
                
           
               

                </td>                 
            </tr>


        </tbody>



    </table>
         


  </div>
  <div id="tabs-2">
    xxxxxxx
  </div>
  
</div>

            <!--
            <div class="form_box">
    

	<div class="container-fluid">
    	<div class="row">
        	 <label>Alert & Notification Configuration</label> 
            <div class="form-ANC">
                <div class="col-md-6">
                    <form>
                        <label>Name:</label>
                        <input type="text" name="name" class="name" >
                        <label>Applicability Rule</label>
                        <label class="wt100 control-label">General Alert When:</label>
                            <label class="radio-inline">
                              <input type="radio" name="optradio">Target Date
                            </label>
                            <label class="radio-inline">
                              <input type="radio" name="optradio">Due Date
                            </label>
                            <label class="radio-inline">
                              <input type="radio" name="optradio">Ack. Date
                            </label>
                        
                       	<label class="wt100">When Due in</label>
                       
                        	<label class="radio-inline">
                              <input type="radio" name="optradio">After
                            </label>
                            <label class="radio-inline">
                              <input type="radio" name="optradio">Before
                            </label>
                        	<input type="text">Days
                            
                        <label class="wt100">Validity</label>
                        <div class="form-group">
                        	<div class="date">
                                <div id="datetimepicker1" class="input-append">
                                	<label>from</label>
                                    <input data-format="dd/MM/yyyy" class="input-date" type="text" placeholder="" />
                                    <span class="add-on">
                                      <i class="fa fa-calendar" data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                    </span>
                                </div>
                        	</div>
                        </div>
                        <div class="form-group">
                        	<div class="date">
                                <div id="datetimepicker2" class="input-append">
                                	<label>Until</label>
                                    <input data-format="dd/MM/yyyy" class="input-date" type="text" placeholder="" />
                                    <span class="add-on">
                                      <i class="fa fa-calendar" data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                    </span>
                                </div>
                        	</div>
                        </div>
                        <label class="wt100">Alert Audience</label>
                        <div class="checkbox">
                          <label><input type="checkbox" value="">Responsible User</label>
                        </div>
                        <div class="checkbox">
                          <label><input type="checkbox" value="">Manager</label>
                        </div>
                        <div class="checkbox">
                          <label><input type="checkbox" value="" >Approving Authority</label>
                        </div>
                        <div class="checkbox">
                          <label><input type="checkbox" value="" >Other</label>
                        </div>    
                    </form>
                </div>
                <div class="col-md-6">
                	<form>
                    	<label class="control-label">Alert Type:</label>
                            <label class="radio-inline">
                              <input type="radio" name="optradio">Email
                            </label>
                            <label class="radio-inline">
                              <input type="radio" name="optradio">SMS
                            </label>
                            <label class="radio-inline">
                              <input type="radio" name="optradio">Both
                            </label>
                        <label class="wt100">FILTERS</label>
                        <div class="form-ANC">
                        	<label class="wt100 control-label">Responsibility Center</label>
                                <label class="radio-inline">
                                  <input type="radio" name="optradio">National Office
                                </label>
                                <label class="radio-inline">
                                  <input type="radio" name="optradio">Village
                                </label>
                                <label class="radio-inline">
                                  <input type="radio" name="optradio">Zonal Office
                                </label>
                            <label class="wt100 control-label">Compliance Type</label>
                                <label class="radio-inline">
                                  <input type="radio" name="optradio">Legal
                                </label>
                                <label class="radio-inline">
                                  <input type="radio" name="optradio">Financial
                                </label>
                                <label class="radio-inline">
                                  <input type="radio" name="optradio">Taxation
                                </label>
                            <div class="form-group">
                            	<div class="container-fluid">
                            	<div class="row">
                                <label for="sel1" class="col-md-6 col-sm-6 col-xs-12">Department</label>
                                    <select class="col-md-6 col-sm-6 col-xs-12" id="sel1">
                                      <option>Options</option>
                                      <option>2</option>
                                      <option>3</option>
                                      <option>4</option>
                                    </select>
                            	</div>
                                <div class="row">
                            	<label for="sel1" class="col-md-6 col-sm-6 col-xs-12">Govt. Agency</label>
                                    <select class="col-md-6 col-sm-6 col-xs-12" id="sel1">
                                      <option>Options</option>
                                      <option>2</option>
                                      <option>3</option>
                                      <option>4</option>
                                    </select>
                                </div>
                           		<div class="row">
                               	<label for="sel1" class="col-md-6 col-sm-6 col-xs-12">Act</label>
                                    <select class="col-md-6 col-sm-6 col-xs-12" id="sel1">
                                      <option>Options</option>
                                      <option>2</option>
                                      <option>3</option>
                                      <option>4</option>
                                    </select>
                                </div>
                           		<div class="row">
                               	<label for="sel1" class="col-md-6 col-sm-6 col-xs-12">Responsibility</label>
                                    <select class="col-md-6 col-sm-6 col-xs-12" id="sel1">
                                      <option>Options</option>
                                      <option>2</option>
                                      <option>3</option>
                                      <option>4</option>
                                    </select>
                               	</div>
                            </div>
                            </div>   
                       	</div>
                        <label class="wt100 control-label">Schedule</label>
                        <div class="row">
                            <div class="col-md-12 col-xs-12">
                                <label class="radio-inline">
                                  <input type="radio" name="optradio">Daily
                                </label>
                                <label class="radio-inline">
                                  <input type="radio" name="optradio">Weekly
                                </label>
                                <label class="radio-inline">
                                  <input type="radio" name="optradio">Monthly
                                </label>
                                <label class="radio-inline">
                                  <input type="radio" name="optradio">Yearly
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-xs-6">    
                                <label class="checkbox-inline"><input type="checkbox" value="">Sunday</label>
                                <label class="checkbox-inline"><input type="checkbox" value="">Monday</label>
                                <label class="checkbox-inline"><input type="checkbox" value="">Tuesday</label>
                                <label class="checkbox-inline"><input type="checkbox" value="">Wednesday</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-xs-6">    
                                <label class="checkbox-inline"><input type="checkbox" value="">Thursday</label>
                                <label class="checkbox-inline"><input type="checkbox" value="">Friday</label>
                                <label class="checkbox-inline"><input type="checkbox" value="">Saturday</label>
                            </div>
                        </div>
                    </form>
            	</div>
            </div>
        </div>
	</div>
</div>

    -->

            </section>


            </div>
    
        
   

</asp:Content>

