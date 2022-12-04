namespace EanPictures
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.label1 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.txDados = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.label11 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txEmail = new System.Windows.Forms.TextBox();
            this.txCep = new System.Windows.Forms.TextBox();
            this.txUF = new System.Windows.Forms.TextBox();
            this.txCidade = new System.Windows.Forms.TextBox();
            this.txBaixxo = new System.Windows.Forms.TextBox();
            this.txEndereco = new System.Windows.Forms.TextBox();
            this.txFantasia = new System.Windows.Forms.TextBox();
            this.txRazao = new System.Windows.Forms.TextBox();
            this.txIE = new System.Windows.Forms.TextBox();
            this.txCnpj = new System.Windows.Forms.TextBox();
            this.logCnpj = new System.Windows.Forms.RichTextBox();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.imgProduto = new System.Windows.Forms.PictureBox();
            this.label17 = new System.Windows.Forms.Label();
            this.txPeso = new System.Windows.Forms.TextBox();
            this.label16 = new System.Windows.Forms.Label();
            this.txCest = new System.Windows.Forms.TextBox();
            this.label15 = new System.Windows.Forms.Label();
            this.txMarca = new System.Windows.Forms.TextBox();
            this.label14 = new System.Windows.Forms.Label();
            this.txNcm = new System.Windows.Forms.TextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.txProduto = new System.Windows.Forms.TextBox();
            this.logGtin = new System.Windows.Forms.RichTextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.linkLabel1 = new System.Windows.Forms.LinkLabel();
            this.label18 = new System.Windows.Forms.Label();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgProduto)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(59, 15);
            this.label1.TabIndex = 0;
            this.label1.Text = "Filter data";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "Consulta CNPJ",
            "Consulta GTIN"});
            this.comboBox1.Location = new System.Drawing.Point(12, 33);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(189, 23);
            this.comboBox1.TabIndex = 1;
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // txDados
            // 
            this.txDados.Location = new System.Drawing.Point(233, 33);
            this.txDados.Name = "txDados";
            this.txDados.Size = new System.Drawing.Size(191, 23);
            this.txDados.TabIndex = 3;
            // 
            // button1
            // 
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button1.Image = ((System.Drawing.Image)(resources.GetObject("button1.Image")));
            this.button1.Location = new System.Drawing.Point(430, 33);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(32, 23);
            this.button1.TabIndex = 4;
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_ClickAsync);
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Location = new System.Drawing.Point(12, 90);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(803, 391);
            this.tabControl1.TabIndex = 5;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.label11);
            this.tabPage1.Controls.Add(this.label10);
            this.tabPage1.Controls.Add(this.label9);
            this.tabPage1.Controls.Add(this.label8);
            this.tabPage1.Controls.Add(this.label7);
            this.tabPage1.Controls.Add(this.label6);
            this.tabPage1.Controls.Add(this.label5);
            this.tabPage1.Controls.Add(this.label4);
            this.tabPage1.Controls.Add(this.label3);
            this.tabPage1.Controls.Add(this.label2);
            this.tabPage1.Controls.Add(this.txEmail);
            this.tabPage1.Controls.Add(this.txCep);
            this.tabPage1.Controls.Add(this.txUF);
            this.tabPage1.Controls.Add(this.txCidade);
            this.tabPage1.Controls.Add(this.txBaixxo);
            this.tabPage1.Controls.Add(this.txEndereco);
            this.tabPage1.Controls.Add(this.txFantasia);
            this.tabPage1.Controls.Add(this.txRazao);
            this.tabPage1.Controls.Add(this.txIE);
            this.tabPage1.Controls.Add(this.txCnpj);
            this.tabPage1.Controls.Add(this.logCnpj);
            this.tabPage1.Location = new System.Drawing.Point(4, 24);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(795, 363);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Consulta CNPJ";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(6, 316);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(41, 15);
            this.label11.TabIndex = 20;
            this.label11.Text = "E-mail";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(6, 264);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(28, 15);
            this.label10.TabIndex = 19;
            this.label10.Text = "CEP";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(292, 213);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(21, 15);
            this.label9.TabIndex = 18;
            this.label9.Text = "UF";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(154, 213);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(44, 15);
            this.label8.TabIndex = 17;
            this.label8.Text = "Cidade";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(6, 213);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(38, 15);
            this.label7.TabIndex = 16;
            this.label7.Text = "Bairro";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(6, 159);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(56, 15);
            this.label6.TabIndex = 15;
            this.label6.Text = "Endereço";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(6, 108);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(86, 15);
            this.label5.TabIndex = 14;
            this.label5.Text = "Nome Fantasia";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(6, 58);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(72, 15);
            this.label4.TabIndex = 13;
            this.label4.Text = "Razão Social";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(180, 10);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(16, 15);
            this.label3.TabIndex = 12;
            this.label3.Text = "IE";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 10);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(34, 15);
            this.label2.TabIndex = 11;
            this.label2.Text = "CNPJ";
            // 
            // txEmail
            // 
            this.txEmail.Location = new System.Drawing.Point(6, 334);
            this.txEmail.Name = "txEmail";
            this.txEmail.Size = new System.Drawing.Size(321, 23);
            this.txEmail.TabIndex = 10;
            // 
            // txCep
            // 
            this.txCep.Location = new System.Drawing.Point(6, 282);
            this.txCep.Name = "txCep";
            this.txCep.Size = new System.Drawing.Size(168, 23);
            this.txCep.TabIndex = 9;
            // 
            // txUF
            // 
            this.txUF.Location = new System.Drawing.Point(292, 231);
            this.txUF.Name = "txUF";
            this.txUF.Size = new System.Drawing.Size(35, 23);
            this.txUF.TabIndex = 8;
            // 
            // txCidade
            // 
            this.txCidade.Location = new System.Drawing.Point(154, 231);
            this.txCidade.Name = "txCidade";
            this.txCidade.Size = new System.Drawing.Size(132, 23);
            this.txCidade.TabIndex = 7;
            // 
            // txBaixxo
            // 
            this.txBaixxo.Location = new System.Drawing.Point(6, 231);
            this.txBaixxo.Name = "txBaixxo";
            this.txBaixxo.Size = new System.Drawing.Size(142, 23);
            this.txBaixxo.TabIndex = 6;
            // 
            // txEndereco
            // 
            this.txEndereco.Location = new System.Drawing.Point(6, 177);
            this.txEndereco.Name = "txEndereco";
            this.txEndereco.Size = new System.Drawing.Size(321, 23);
            this.txEndereco.TabIndex = 5;
            // 
            // txFantasia
            // 
            this.txFantasia.Location = new System.Drawing.Point(6, 126);
            this.txFantasia.Name = "txFantasia";
            this.txFantasia.Size = new System.Drawing.Size(321, 23);
            this.txFantasia.TabIndex = 4;
            // 
            // txRazao
            // 
            this.txRazao.Location = new System.Drawing.Point(6, 76);
            this.txRazao.Name = "txRazao";
            this.txRazao.Size = new System.Drawing.Size(321, 23);
            this.txRazao.TabIndex = 3;
            // 
            // txIE
            // 
            this.txIE.Location = new System.Drawing.Point(180, 28);
            this.txIE.Name = "txIE";
            this.txIE.Size = new System.Drawing.Size(147, 23);
            this.txIE.TabIndex = 2;
            // 
            // txCnpj
            // 
            this.txCnpj.Location = new System.Drawing.Point(6, 28);
            this.txCnpj.Name = "txCnpj";
            this.txCnpj.Size = new System.Drawing.Size(168, 23);
            this.txCnpj.TabIndex = 1;
            // 
            // logCnpj
            // 
            this.logCnpj.BackColor = System.Drawing.SystemColors.Info;
            this.logCnpj.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.logCnpj.Location = new System.Drawing.Point(333, 3);
            this.logCnpj.Name = "logCnpj";
            this.logCnpj.Size = new System.Drawing.Size(458, 302);
            this.logCnpj.TabIndex = 0;
            this.logCnpj.Text = "";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.imgProduto);
            this.tabPage2.Controls.Add(this.label17);
            this.tabPage2.Controls.Add(this.txPeso);
            this.tabPage2.Controls.Add(this.label16);
            this.tabPage2.Controls.Add(this.txCest);
            this.tabPage2.Controls.Add(this.label15);
            this.tabPage2.Controls.Add(this.txMarca);
            this.tabPage2.Controls.Add(this.label14);
            this.tabPage2.Controls.Add(this.txNcm);
            this.tabPage2.Controls.Add(this.label13);
            this.tabPage2.Controls.Add(this.txProduto);
            this.tabPage2.Controls.Add(this.logGtin);
            this.tabPage2.Location = new System.Drawing.Point(4, 24);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(795, 363);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Consulta GTIN";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // imgProduto
            // 
            this.imgProduto.Location = new System.Drawing.Point(168, 87);
            this.imgProduto.Name = "imgProduto";
            this.imgProduto.Size = new System.Drawing.Size(167, 161);
            this.imgProduto.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.imgProduto.TabIndex = 24;
            this.imgProduto.TabStop = false;
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Location = new System.Drawing.Point(6, 224);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(32, 15);
            this.label17.TabIndex = 23;
            this.label17.Text = "Peso";
            // 
            // txPeso
            // 
            this.txPeso.Location = new System.Drawing.Point(6, 242);
            this.txPeso.Name = "txPeso";
            this.txPeso.Size = new System.Drawing.Size(114, 23);
            this.txPeso.TabIndex = 22;
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(6, 171);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(33, 15);
            this.label16.TabIndex = 21;
            this.label16.Text = "CEST";
            // 
            // txCest
            // 
            this.txCest.Location = new System.Drawing.Point(6, 189);
            this.txCest.Name = "txCest";
            this.txCest.Size = new System.Drawing.Size(114, 23);
            this.txCest.TabIndex = 20;
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(6, 120);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(40, 15);
            this.label15.TabIndex = 19;
            this.label15.Text = "Marca";
            // 
            // txMarca
            // 
            this.txMarca.Location = new System.Drawing.Point(6, 138);
            this.txMarca.Name = "txMarca";
            this.txMarca.Size = new System.Drawing.Size(114, 23);
            this.txMarca.TabIndex = 18;
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(6, 69);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(35, 15);
            this.label14.TabIndex = 17;
            this.label14.Text = "NCM";
            // 
            // txNcm
            // 
            this.txNcm.Location = new System.Drawing.Point(6, 87);
            this.txNcm.Name = "txNcm";
            this.txNcm.Size = new System.Drawing.Size(114, 23);
            this.txNcm.TabIndex = 16;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(6, 13);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(50, 15);
            this.label13.TabIndex = 15;
            this.label13.Text = "Produto";
            // 
            // txProduto
            // 
            this.txProduto.Location = new System.Drawing.Point(6, 31);
            this.txProduto.Name = "txProduto";
            this.txProduto.Size = new System.Drawing.Size(321, 23);
            this.txProduto.TabIndex = 14;
            // 
            // logGtin
            // 
            this.logGtin.BackColor = System.Drawing.SystemColors.Info;
            this.logGtin.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.logGtin.Location = new System.Drawing.Point(334, 3);
            this.logGtin.Name = "logGtin";
            this.logGtin.Size = new System.Drawing.Size(458, 302);
            this.logGtin.TabIndex = 1;
            this.logGtin.Text = "";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label12.Location = new System.Drawing.Point(691, 9);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(120, 21);
            this.label12.TabIndex = 6;
            this.label12.Text = "API 1.0 | .Net 6";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(723, 34);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(84, 74);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 7;
            this.pictureBox1.TabStop = false;
            // 
            // linkLabel1
            // 
            this.linkLabel1.AutoSize = true;
            this.linkLabel1.Location = new System.Drawing.Point(349, 484);
            this.linkLabel1.Name = "linkLabel1";
            this.linkLabel1.Size = new System.Drawing.Size(126, 15);
            this.linkLabel1.TabIndex = 22;
            this.linkLabel1.TabStop = true;
            this.linkLabel1.Text = "EanPictures / Dataload";
            this.linkLabel1.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabel1_LinkClicked_1);
            this.linkLabel1.Click += new System.EventHandler(this.linkLabel1_Click);
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label18.Location = new System.Drawing.Point(544, 66);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(173, 21);
            this.label18.TabIndex = 23;
            this.label18.Text = "www.sacfiscal.com.br";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(819, 508);
            this.Controls.Add(this.label18);
            this.Controls.Add(this.linkLabel1);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.txDados);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "EanPictures Demo";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.imgProduto)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Label label1;
        private ComboBox comboBox1;
        private TextBox txDados;
        private Button button1;
        private TabControl tabControl1;
        private TabPage tabPage1;
        private Label label11;
        private Label label10;
        private Label label9;
        private Label label8;
        private Label label7;
        private Label label6;
        private Label label5;
        private Label label4;
        private Label label3;
        private Label label2;
        private TextBox txEmail;
        private TextBox txCep;
        private TextBox txUF;
        private TextBox txCidade;
        private TextBox txBaixxo;
        private TextBox txEndereco;
        private TextBox txFantasia;
        private TextBox txRazao;
        private TextBox txIE;
        private TextBox txCnpj;
        private RichTextBox logCnpj;
        private TabPage tabPage2;
        private Label label12;
        private PictureBox pictureBox1;
        private PictureBox imgProduto;
        private Label label17;
        private TextBox txPeso;
        private Label label16;
        private TextBox txCest;
        private Label label15;
        private TextBox txMarca;
        private Label label14;
        private TextBox txNcm;
        private Label label13;
        private TextBox txProduto;
        private RichTextBox logGtin;
        private LinkLabel linkLabel1;
        private Label label18;
    }
}