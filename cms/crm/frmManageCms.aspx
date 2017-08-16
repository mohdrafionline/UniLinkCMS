<%@ Page Title="" Language="C#" MasterPageFile="~/crm/main.master" AutoEventWireup="true" CodeFile="frmManageCms.aspx.cs" Inherits="crm_frmManageCms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        label {
    
    font-weight: 600 !important;
     
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="content-wrapper" style="min-height: 946px;">
        <section class="content-header">
            <h1>COMPLIANCE MANAGEMENT
                <small>Add/Edit</small>
            </h1>
            <ol class="breadcrumb">
        </section>
        <section class="content">

            <div class="row">
                <div class="col-sm-4">

                    <div class="box box-info">
                        <div class="box-header">
                            <h3 class="box-title">Resposiblity Center</h3>
                        </div>
                        <div class="box-body">
                            <asp:CheckBox ID="txtRespCenterNO" runat="server" CellPadding="5" CellSpacing="5" Text="&nbsp;National Office&nbsp;" Value="NO"/>
                            <asp:CheckBox ID="txtRespCenterVillage" runat="server" CellPadding="5" CellSpacing="5" Text="&nbsp;Village&nbsp;" Value="Village"/>
                            <asp:CheckBox ID="txtRespCenterZO" runat="server" CellPadding="5" CellSpacing="5" Text="&nbsp;Zonal Office&nbsp;" Value="ZO"/>
                            
                            <%-- <input type="checkbox" name="chkrc" value="NO" />&nbsp;National Office
                            <input type="checkbox" name="chkrc" value="Village" />&nbsp;Village
                            <input type="checkbox" name="chkrc" value="ZO" />&nbsp;Zonal Office--%>
                        </div>
                    </div>




                </div>
                <div class="col-sm-4">
                    <div class="box box-info">
                        <div class="box-header">
                            <h3 class="box-title">Compliance Type</h3>
                        </div>
                        <div class="box-body">

                            <asp:RadioButtonList runat="server" ID="chkct" RepeatDirection="Horizontal">
                                <asp:ListItem Text="&nbsp;Legal&nbsp;" Value="Legal" />
                                 <asp:ListItem Text="&nbsp;Financial&nbsp;" Value="Financial"/>
                                 <asp:ListItem Text="&nbsp;Taxation&nbsp;" Value="Taxation"/>
                            </asp:RadioButtonList>
                            
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="box box-info">
                        <%-- <div class="box-header">
                            <h3 class="box-title">Resposiblity Center</h3>
                        </div>--%>
                        <div class="box-body">
                            <div class="form-group">
                                <label>Department</label>
                                
                                <asp:DropDownList ID="drpDept" runat="server" DataSourceID="SqlDataSource1" DataTextField="Department" DataValueField="Department" CssClass="form-control">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbString %>" SelectCommand="SELECT [Department] FROM [Department_Master]"></asp:SqlDataSource>
&nbsp;<%--<select class="form-control">
                                    <option>Options</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                </select>--%>
                            </div>
                            <div class="form-group">
                                <label>User</label>
                                <select class="form-control">
                                    <option>Options</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                </select>
                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <div class="row">
                <div class="col-sm-3">
                    <div class="box box-info">

                        <div class="box-body">
                            <label>Compliance Act</label>
                            <select class="form-control" id="sel1">
                                <option>Options</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                            </select>

                            <label>Compliance Catg.</label>
                            <select class="form-control">
                                <option>Options</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                            </select>

                        </div>
                    </div>
                </div>
                <div class="col-sm-9">

                    <div class="col-sm-6">

                        <div class="box box-info">

                            <div class="box-body">
                                <label>Periodicaly</label>
                                <br />
                                <asp:RadioButtonList runat="server" ID="chkperiodicaly" RepeatDirection="Horizontal">
                                <asp:ListItem Text="&nbsp;NA&nbsp;" Value="NA" />
                                 <asp:ListItem Text="&nbsp;Daily&nbsp;" Value="Daily"/>
                                 <asp:ListItem Text="&nbsp;Monthly&nbsp;" Value="Monthly"/>
                                    <asp:ListItem Text="&nbsp;Quarterly&nbsp;" Value="Quarterly"/>
                                    <asp:ListItem Text="&nbsp;Half Yearly&nbsp;" Value="Half Yearly"/>
                                    <asp:ListItem Text="&nbsp;Yearly&nbsp;" Value="Taxation"/>
                                    <asp:ListItem Text="&nbsp;As and when&nbsp;" Value="As and when"/>
                            </asp:RadioButtonList>                               
                                <br />
                                <label>Athority </label>
                                <asp:TextBox ID="txtAthority" runat="server" Cssclass="form-control"></asp:TextBox>

                               <%-- <input type="text" class="form-control" />--%>
                            </div>

                        </div>
                    </div>
                    <div class="col-sm-6">

                        <div class="box box-info">

                            <div class="box-body">
                                <label>Applicable</label>

                                <asp:RadioButtonList runat="server" ID="chkApplicable" RepeatDirection="Horizontal">
                                <asp:ListItem Text="&nbsp;Yes&nbsp;" Value="Yes" />
                                 <asp:ListItem Text="&nbsp;No&nbsp;" Value="No"/>
 
                            </asp:RadioButtonList>             
                              

                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-sm-7">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="box box-info">

                                <div class="box-body">

                                    <label>Compliance Description</label>

                                   <asp:TextBox ID="txtComplianceDesc" runat="server" TextMode="MultiLine" Width="99%" Rows="3" CssClass="form-control"></asp:TextBox>
                                     

                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-sm-12">

                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Task(s)</h3>
                                </div>
                                <div class="box-body table-responsive no-padding">
                                    <table class="table table-hover">
                                        <tbody>
                                            <tr>
                                                <th style="font-weight: 600 !important;">Tasks Involved</th>
                                                <th style="font-weight: 600 !important;">Due Date</th>
                                                <th style="font-weight: 600 !important;">Target Date</th>
                                                <th style="font-weight: 600 !important;">Penelty Amount</th>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <select id="sel1" class="form-control">
                                                        <option>Options</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                    </select>
                                                </td>
                                                <td>

                                                    <div class="input-group date">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-calendar"></i>
                                                        </div>
                                                         <asp:TextBox ID="txtTaskDueDate" runat="server" Cssclass="form-control pull-right datepicker"></asp:TextBox>
                                                       <%-- <input class="form-control pull-right datepicker" type="text">--%>
                                                    </div>
                                                </td>
                                                <td>

                                                    <div class="input-group date">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-calendar"></i>
                                                        </div>
                                                        <asp:TextBox ID="txtTaskTargetDate" runat="server" Cssclass="form-control pull-right datepicker"></asp:TextBox>
                                                        <%--<input class="form-control pull-right datepicker" type="text">--%>
                                                    </div>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtTaskPanelty" runat="server" Cssclass="form-control"></asp:TextBox>

                                                    <%--<input type="text" class="form-control" />--%>

                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>


                                <div class="box-footer">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-info" Text="Save" OnClick="btnsave_Click" />&nbsp;&nbsp;
                                            <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-primary" Text="SUBMIT" />&nbsp;&nbsp;
                                            <asp:Button ID="btncancel" runat="server" CssClass="btn btn-warning" Text="CANCEL" OnClick="btncancel_Click" />&nbsp;&nbsp;                                           
                                              <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning" Text="Add New" OnClick="Button1_Click" />&nbsp;&nbsp;                                           

                                          
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>

                        </div>


                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="box box-info">

                                <div class="box-header">
                                    <h3 class="box-title">Approved By:</h3>
                                </div>

                                <div class="box-body">

                                    <div class="row">

                                        <div class="col-sm-2">
                                            <asp:TextBox ID="txtApprovedby" runat="server" Cssclass="form-control"></asp:TextBox>
                                            <%--<input type="text" class="form-control">--%>
                                        </div>

                                        <div class="col-sm-4">

                                            <div class="input-group date">

                                                <div class="input-group-addon">
                                                    On&nbsp;<i class="fa fa-calendar"></i>
                                                </div>
                                                 <asp:TextBox ID="txtApprovedON" runat="server" Cssclass="form-control pull-right datepicker"></asp:TextBox>

                                               <%-- <input class="form-control pull-right datepicker" type="text">--%>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">

                                             <asp:TextBox ID="txtApprovedDesc" runat="server" Cssclass="form-control" TextMode="MultiLine"></asp:TextBox>

                                            <%--<textarea class="form-control"></textarea>--%>
                                        </div>


                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                    <%--<div class="col-sm-4">
                            <div class="box box-info">
                                <div class="box-body">
                                     
                                


                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            
                        </div>--%>
                </div>
                <div class="col-sm-5">

                    <div class="row">
                        <div class="col-sm-12">

                            <div class="box box-info">

                                <div class="box-body">

                                    <label>Time Line</label>

                                      <asp:TextBox ID="txtTimeline" runat="server" TextMode="MultiLine" Width="99%" Rows="3" CssClass="form-control"></asp:TextBox>

                                     

                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">

                            <div class="box box-info">

                                <div class="box-body">
                                    <label>Attechment</label>

                                    <textarea class="form-control"></textarea>
                                    <input type="file" />
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">

                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Documents(s)</h3>
                                </div>
                                <div class="box-body table-responsive no-padding">
                                    <table class="table table-hover">
                                        <tbody>
                                            <tr>
                                                <th style="font-weight: 600 !important;">Doc Type1</t>
                                                <th style="font-weight: 600 !important;">Doc Name</th>
                                                <th style="font-weight: 600 !important;">Form</th>
                                            </tr>
                                            <tr>
                                                <td>Default</td>
                                                <td>Defaultson</td>
                                                <td>def@somemail.com</td>
                                            </tr>
                                            <tr class="active">
                                                <td>Success</td>
                                                <td>Doe</td>
                                                <td>john@example.com</td>
                                            </tr>
                                            <tr>
                                                <td>Danger</td>
                                                <td>Moe</td>
                                                <td>mary@example.com</td>
                                            </tr>
                                            <tr class="active">
                                                <td>Info</td>
                                                <td>Dooley</td>
                                                <td>july@example.com</td>
                                            </tr>

                                        </tbody>
                                    </table>


                                </div>
                            </div>



                        </div>
                    </div>

                </div>

            </div>

            <div class="pd10">
                <div class="row">
                    <div class="col-md-12 col-sm-12">

                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title"></h3>
                            </div>
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover" style="table-layout:fixed;width:100%">
                                    <tbody>
                                        <tr>

                                            <th style="font-weight: 600 !important;; width:75px">Comp. No.</th>
                                            <th style="font-weight: 600 !important;">Description</th>
                                            <th style="font-weight: 600 !important;">Timeline</th>
                                            <th style="font-weight: 600 !important;">Periodicity</th>
                                            <th style="font-weight: 600 !important;">Due Date</th>
                                            <th style="font-weight: 600 !important;">Target Date</th>
                                            <th style="font-weight: 600 !important;">Resposible Person</th>
                                        </tr>

                                        <% System.Data.DataTable dt = getCompliance(); %>
                                        <% for (int i = 0; i < dt.Rows.Count; i++)
                                            { %>
                                        <tr>
                                            <td  style="width:10px"> <a href="frmManageCms.aspx?cid=<%= dt.Rows[i]["compliance_id"].ToString() %>"><%= dt.Rows[i]["compliance_id"].ToString() %></a></td>
                                            <td><span style="word-wrap: break-word;"><%= dt.Rows[i]["comp_desc"].ToString() %></span></td>
                                            <td style="word-wrap: break-word;"><%= dt.Rows[i]["timeline"].ToString() %></td>
                                            <td><%= dt.Rows[i]["periodicity"].ToString() %></td>
                                            <td><%= dt.Rows[i]["due_dt"] %></td>
                                            <td><%= dt.Rows[i]["target_dt"] %></td>
                                            <td><%= dt.Rows[i]["responsible_person"].ToString() %></td>
                                           <%-- <td>
                                                <input type="checkbox" /></td>--%>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </section>
    </div>
</asp:Content>

