<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpForm.aspx.cs" Inherits="MCA_3T.SignUpForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Registration | HR Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
        rel="stylesheet" />

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            min-height: 100%;
        }

        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            background: radial-gradient(circle at top left, #dce8ff 0, transparent 35%), linear-gradient(135deg, #f4f7ff 0%, #f8faff 55%, #edf2ff 100%);
            color: #1e293b;
            padding: 40px 20px;
        }

        #form1 {
            width: 100%;
            min-height: calc(100vh - 80px);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .main-container {
            width: 100%;
            max-width: 790px;
            margin: 0 auto;
        }

        .brand {
            text-align: center;
            margin-bottom: 30px;
        }

            .brand h1 {
                font-size: clamp(25px, 4vw, 32px);
                font-weight: 800;
                letter-spacing: -1px;
                line-height: 1.3;
                color: #172554;
                margin-bottom: 10px;
            }

            .brand p {
                font-size: 14px;
                line-height: 1.7;
                color: #64748b;
            }

        .form-card {
            width: 100%;
            background: rgba(255, 255, 255, 0.98);
            border: 1px solid #e2e8f0;
            border-radius: 20px;
            padding: 36px 40px;
            box-shadow: 0 4px 10px rgba(15, 23, 42, 0.02), 0 18px 50px rgba(37, 99, 235, 0.08);
        }

        .card-heading {
            padding-bottom: 22px;
            margin-bottom: 28px;
            border-bottom: 1px solid #edf0f6;
        }

            .card-heading h2 {
                font-size: 19px;
                line-height: 1.4;
                font-weight: 700;
                color: #172554;
                margin-bottom: 7px;
            }

            .card-heading p {
                font-size: 13px;
                line-height: 1.6;
                color: #8490a4;
            }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            column-gap: 24px;
            row-gap: 24px;
            align-items: start;
        }

        .form-group {
            min-width: 0;
            width: 100%;
        }

            .form-group.full-width {
                grid-column: 1 / -1;
            }

        .field-label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            line-height: 1.5;
            color: #334155;
            margin-bottom: 9px;
        }

        .required {
            color: #ef4444;
            margin-left: 2px;
        }

        .input-field,
        .select-field {
            display: block;
            width: 100%;
            height: 48px;
            padding: 0 14px;
            border: 1px solid #dbe3ef;
            border-radius: 9px;
            background-color: #fbfcff;
            color: #1e293b;
            font-family: inherit;
            font-size: 13px;
            outline: none;
            transition: border-color 0.2s ease, box-shadow 0.2s ease, background-color 0.2s ease;
        }

            .input-field::placeholder {
                color: #a0aabd;
                opacity: 1;
            }

        .select-field {
            cursor: pointer;
        }

            .input-field:hover,
            .select-field:hover {
                border-color: #b8c6df;
            }

            .input-field:focus,
            .select-field:focus {
                border-color: #4f75f2;
                background-color: #ffffff;
                box-shadow: 0 0 0 3px rgba(79, 117, 242, 0.12);
            }

        .gender-options {
            min-height: 48px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 12px 26px;
        }

            .gender-options label {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                font-size: 13px;
                line-height: 1.5;
                color: #475569;
                cursor: pointer;
                margin: 0;
            }

            .gender-options input[type="radio"] {
                width: 16px;
                height: 16px;
                margin: 0;
                accent-color: #3b5eea;
                cursor: pointer;
                flex-shrink: 0;
            }

        .upload-box {
            width: 100%;
            padding: 18px;
            border: 1px dashed #bdcbe0;
            border-radius: 11px;
            background: #f8faff;
            transition: border-color 0.2s ease, background-color 0.2s ease;
        }

            .upload-box:hover {
                border-color: #7895ec;
                background: #f5f8ff;
            }

            .upload-box input[type="file"] {
                display: block;
                width: 100%;
                max-width: 100%;
                font-family: inherit;
                font-size: 12px;
                color: #64748b;
            }

                .upload-box input[type="file"]::file-selector-button {
                    margin-right: 12px;
                    padding: 9px 12px;
                    border: 1px solid #d7e0f0;
                    border-radius: 7px;
                    background: #ffffff;
                    color: #334155;
                    font-family: inherit;
                    font-size: 12px;
                    font-weight: 600;
                    cursor: pointer;
                }

        .upload-hint {
            margin-top: 10px;
            font-size: 11px;
            line-height: 1.6;
            color: #94a3b8;
        }

        .form-footer {
            margin-top: 30px;
            padding-top: 24px;
            border-top: 1px solid #edf0f6;
        }

        .save-button {
            display: block;
            width: 100%;
            min-height: 49px;
            padding: 12px 18px;
            border: none;
            border-radius: 9px;
            background: linear-gradient(135deg, #2563eb, #4f46e5);
            color: #ffffff;
            font-family: inherit;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 0.15px;
            cursor: pointer;
            box-shadow: 0 6px 16px rgba(59, 91, 219, 0.20);
            transition: transform 0.2s ease, box-shadow 0.2s ease, filter 0.2s ease;
        }

            .save-button:hover {
                filter: brightness(1.05);
                transform: translateY(-1px);
                box-shadow: 0 10px 22px rgba(59, 91, 219, 0.25);
            }

            .save-button:active {
                transform: translateY(0);
                box-shadow: 0 4px 10px rgba(59, 91, 219, 0.16);
            }

            .save-button:focus-visible {
                outline: 3px solid rgba(79, 117, 242, 0.35);
                outline-offset: 3px;
            }

        .footer-text {
            margin-top: 24px;
            text-align: center;
            font-size: 11px;
            line-height: 1.7;
            color: #94a3b8;
        }

        @media (max-width: 768px) {
            body {
                padding: 30px 18px;
            }

            #form1 {
                min-height: calc(100vh - 60px);
            }

            .main-container {
                max-width: 620px;
            }

            .form-card {
                padding: 30px;
            }

            .form-grid {
                column-gap: 18px;
                row-gap: 22px;
            }
        }

        @media (max-width: 600px) {
            body {
                padding: 24px 14px;
            }

            #form1 {
                min-height: auto;
                align-items: flex-start;
            }

            .main-container {
                max-width: 100%;
            }

            .brand {
                margin-bottom: 24px;
            }

                .brand h1 {
                    font-size: 25px;
                    letter-spacing: -0.6px;
                }

                .brand p {
                    max-width: 320px;
                    margin: 0 auto;
                    font-size: 13px;
                }

            .form-card {
                padding: 24px 20px;
                border-radius: 15px;
            }

            .card-heading {
                padding-bottom: 18px;
                margin-bottom: 23px;
            }

                .card-heading h2 {
                    font-size: 18px;
                }

            .form-grid {
                grid-template-columns: minmax(0, 1fr);
                gap: 21px;
            }

            .form-group.full-width {
                grid-column: auto;
            }

            .input-field,
            .select-field {
                height: 47px;
            }

            .gender-options {
                min-height: 42px;
                gap: 12px 22px;
            }

            .upload-box {
                padding: 14px;
            }

            .form-footer {
                margin-top: 25px;
                padding-top: 20px;
            }

            .footer-text {
                margin-top: 20px;
            }
        }

        @media (max-width: 360px) {
            body {
                padding: 18px 10px;
            }

            .form-card {
                padding: 20px 15px;
            }

            .brand h1 {
                font-size: 23px;
            }

            .gender-options {
                gap: 12px;
            }
        }


        /* ==============================
   EMPLOYEE DATA GRID
============================== */
        #GridView1 {
            width: 100%;
            margin-top: 35px;
            border: 1px solid #e2e8f0;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 12px;
            overflow: hidden;
            background: #ffffff;
            font-family: 'Inter', sans-serif;
            font-size: 13px;
            color: #334155;
            box-shadow: 0 8px 25px rgba(37, 99, 235, 0.07);
        }

            /* Table header */
            #GridView1 th {
                padding: 15px 16px;
                background: linear-gradient(135deg, #2563eb, #4f46e5);
                color: #ffffff;
                font-size: 12px;
                font-weight: 700;
                text-align: left;
                white-space: nowrap;
                border: none;
            }

            /* Table cells */
            #GridView1 td {
                padding: 14px 16px;
                border-bottom: 1px solid #edf0f6;
                text-align: left;
                vertical-align: middle;
                line-height: 1.6;
            }

            /* Alternating row background */
            #GridView1 tr:nth-child(even) td {
                background-color: #f8faff;
            }

            #GridView1 tr:nth-child(odd) td {
                background-color: #ffffff;
            }

            /* Row hover effect */
            #GridView1 tr:hover td {
                background-color: #eef4ff;
                transition: background-color 0.2s ease;
            }

            /* Remove bottom border from final row */
            #GridView1 tr:last-child td {
                border-bottom: none;
            }

            /* Profile image */
            #GridView1 img {
                display: block;
                width: 50px;
                height: 50px;
                object-fit: cover;
                border-radius: 8px;
                border: 1px solid #e2e8f0;
                background: #f1f5f9;
            }

            /* Edit and Delete links */
            #GridView1 a {
                display: inline-block;
                padding: 7px 11px;
                border-radius: 6px;
                font-size: 12px;
                font-weight: 600;
                text-decoration: none;
                white-space: nowrap;
                transition: background-color 0.2s ease, color 0.2s ease;
            }

                /* Edit link */
                #GridView1 a[ id*="LinkButton1" ] {
                    color: #2563eb;
                    background-color: #eff6ff;
                }

                    #GridView1 a[ id*="LinkButton1" ]:hover {
                        color: #ffffff;
                        background-color: #2563eb;
                    }

                /* Delete link */
                #GridView1 a[ id*="LinkButton2" ] {
                    color: #dc2626;
                    background-color: #fef2f2;
                }

                    #GridView1 a[ id*="LinkButton2" ]:hover {
                        color: #ffffff;
                        background-color: #dc2626;
                    }

                /* Keyboard focus */
                #GridView1 a:focus-visible {
                    outline: 2px solid #4f75f2;
                    outline-offset: 3px;
                }

        /* ==============================
   RESPONSIVE DATA GRID
============================== */
        @media (max-width: 768px) {
            #GridView1 {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
                border-radius: 9px;
                font-size: 12px;
            }

                #GridView1 th,
                #GridView1 td {
                    padding: 12px;
                }

                #GridView1 img {
                    width: 38px;
                    height: 38px;
                }
        }

        @media (max-width: 480px) {
            #GridView1 {
                margin-top: 25px;
                font-size: 11px;
            }

                #GridView1 th,
                #GridView1 td {
                    padding: 10px;
                }

                #GridView1 a {
                    padding: 6px 8px;
                    font-size: 11px;
                }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-container">

            <div class="brand">
                <h1>Employee Registration</h1>
                <p>Create a new employee profile in your organization.</p>
            </div>

            <div class="form-card">

                <div class="card-heading">
                    <h2>Personal Information</h2>
                    <p>Enter the employee details in the fields below.</p>
                </div>

                <div class="form-grid">

                    <div class="form-group">
                        <label class="field-label" for="txtnm">
                            Full Name <span class="required">*</span>
                        </label>
                        <asp:TextBox ID="txtnm" runat="server"
                            CssClass="input-field"
                            placeholder="Enter full name"
                            MaxLength="100"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="field-label" for="txteml">
                            Email Address <span class="required">*</span>
                        </label>
                        <asp:TextBox ID="txteml" runat="server"
                            CssClass="input-field"
                            TextMode="Email"
                            placeholder="name@example.com"
                            MaxLength="150"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <span class="field-label">Gender</span>
                        <div class="gender-options">
                            <asp:RadioButton ID="rdgen" runat="server"
                                GroupName="Gender"
                                Text="Male" />

                            <asp:RadioButton ID="rdFemale" runat="server"
                                GroupName="Gender"
                                Text="Female" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="field-label" for="drpct">
                            City <span class="required">*</span>
                        </label>
                        <asp:DropDownList ID="drpct" runat="server"
                            CssClass="select-field">
                            <asp:ListItem Value="">-- Select City --</asp:ListItem>
                            <asp:ListItem>Mumbai</asp:ListItem>
                            <asp:ListItem>Pune</asp:ListItem>
                            <asp:ListItem>Chennai</asp:ListItem>
                            <asp:ListItem>Bengaluru</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group full-width">
                        <label class="field-label" for="txtmbl">
                            Mobile Number <span class="required">*</span>
                        </label>
                        <asp:TextBox ID="txtmbl" runat="server"
                            CssClass="input-field"
                            TextMode="Phone"
                            placeholder="Enter mobile number"
                            MaxLength="15"></asp:TextBox>
                    </div>

                    <div class="form-group full-width">
                        <span class="field-label">Profile Image</span>
                        <div class="upload-box">
                            <asp:FileUpload ID="flpimg" runat="server" />
                            <p class="upload-hint">
                                Choose an employee profile image from your device.
                            </p>
                        </div>
                    </div>

                </div>

                <div class="form-footer">
                    <asp:Button ID="Button1" runat="server"
                        Text="Save Employee Details"
                        CssClass="save-button" OnClick="Button1_Click" />
                </div>

            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_delete">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


            <div class="footer-text">
                Employee Management Portal &bull; Registration
            </div>

        </div>

    </form>
</body>
</html>
