<%@ Page Title="" Language="C#" MasterPageFile="~/crm/main.master" AutoEventWireup="true" CodeFile="frmImportData.aspx.cs" Inherits="crm_frmImportData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content-wrapper" style="min-height: 946px;">
        <section class="content-header">
            <h1>Import Data
                <small>CMS</small>
            </h1>
            <ol class="breadcrumb">
        </section>
        <section class="content">

            <div class="row">
                <div class="col-sm-4">
                    Select File
                </div>
                <div class="col-sm-8">
                 
                    <ajaxToolkit:AsyncFileUpload ID="AsyncFileUpload1" runat="server" OnUploadedComplete="AsyncFileUpload1_UploadedComplete" />
                </div>
            </div>
        </section>
    </div>
</asp:Content>

