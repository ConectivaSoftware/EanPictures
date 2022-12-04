using Newtonsoft.Json;
using System.IO;


namespace EanPictures
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            try
            {
                linkLabel1.LinkVisited = true;
                System.Diagnostics.Process.Start("http://www.eanpictures.com.br");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Não foi possível abrir o link.");
            }
        }

        private void linkLabel1_LinkClicked_1(object sender, LinkLabelLinkClickedEventArgs e)
        {
            try
            {
                linkLabel1.LinkVisited = true;
                System.Diagnostics.Process.Start("http://www.eanpictures.com.br");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Não foi possíveçl abrir o link.");
            }
        }

        private void linkLabel1_Click(object sender, EventArgs e)
        {
            try
            {
                linkLabel1.LinkVisited = true;
                System.Diagnostics.Process.Start("http://www.eanpictures.com.br");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Não foi possível abrir o link.");
            }
            
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1.SelectedIndex == 0)
            {
                txDados.Text = "33000167000101";
                tabControl1.SelectedIndex = 0;
            } else
            {
                txDados.Text = "7894900011715";
                tabControl1.SelectedIndex = 1;
            }
        }

        private async void button1_ClickAsync(object sender, EventArgs e)
        {
            LimparCampos();            
            if (comboBox1.SelectedIndex == 1)
            {
                logGtin.AppendText(DateTime.Now.ToString() + "| Requisitando informações:\n\r");
                string url = $"http://www.dataload.com.br:9000/api/desc/{txDados.Text}";
                string urlPng = $"http://www.dataload.com.br:9000/api/gtin/{txDados.Text}.png";
                bool possuiImagem = false;
                Produto produto = new Produto();
                using (var client = new HttpClient())
                {
                    using (var response = await client.GetAsync(url))
                    {
                        if (response.IsSuccessStatusCode)
                        {                            
                            logGtin.AppendText(DateTime.Now.ToString() + "| Dados encontrados com sucesso\n\r");
                            var ProdutoJsonString = await response.Content.ReadAsStringAsync();
                            produto = JsonConvert.DeserializeObject<Produto>(ProdutoJsonString);
                            txProduto.Text = produto.Nome;
                            txNcm.Text = produto.Ncm;
                            txMarca.Text = produto.Marca;
                            txCest.Text = produto.Cest_Codigo;
                            txPeso.Text = produto.Peso;

                            logGtin.AppendText(DateTime.Now.ToString() + "| Verificando imagem\n\r");
                            var imagem = await client.GetStreamAsync(urlPng);

                            if (imagem != null)
                            {
                                possuiImagem = true;
                                logGtin.AppendText(DateTime.Now.ToString() + "| Obtendo e salvando imagem\n\r");
                                await using var fileStream = new FileStream($"gtin\\{txDados.Text}.png", FileMode.OpenOrCreate, FileAccess.Write);
                                imagem.CopyTo(fileStream);
                            }
                            else
                                logGtin.AppendText(DateTime.Now.ToString() + "| Imagem não encontrada\n\r");
                        }
                        else
                        {
                            logGtin.AppendText(DateTime.Now.ToString() + "| Não foi possível obter o produto: " + response.StatusCode);
                        }
                    }

                    if (possuiImagem)
                    {
                        logGtin.AppendText(DateTime.Now.ToString() + "| Exibindo imagem\n\r");
                        imgProduto.Load($"gtin\\{txDados.Text}.png");
                    }
                }
            }
            else
            {
                logCnpj.AppendText(DateTime.Now.ToString() + "| Requisitando informações:\n\r");
                string url = $"http://www.dataload.com.br:8000/api/cnpj/{txDados.Text}";
                Cnpj empresa = new Cnpj();
                using (var client = new HttpClient())
                {
                    using (var response = await client.GetAsync(url))
                    {
                        if (response.IsSuccessStatusCode)
                        {                            
                            var EmpresaJsonString = await response.Content.ReadAsStringAsync();
                            empresa = JsonConvert.DeserializeObject<Cnpj>(EmpresaJsonString);
                            if (empresa.cnpj != null)
                            {
                                logCnpj.AppendText(DateTime.Now.ToString() + "| Dados encontrados com sucesso\n\r");
                                txCnpj.Text = empresa.cnpj;
                                txIE.Text = empresa.ie;
                                txRazao.Text = empresa.razao_social;
                                txFantasia.Text = empresa.nome_fantasia;
                                txEndereco.Text = $"{empresa.logradouro}, {empresa.numero} - {empresa.complemento}";
                                txBaixxo.Text = empresa.bairro;
                                txCidade.Text = empresa.municipio;
                                txUF.Text = empresa.uf;
                                txCep.Text = empresa.cep;
                                txEmail.Text = empresa.correio_eletronico;
                                logCnpj.AppendText(DateTime.Now.ToString() + "| Dados carregados\n\r");
                            }                            
                        }
                    }
                }
            }
        }

        private void LimparCampos()
        {
            if (comboBox1.SelectedIndex == 0)
            {
                logCnpj.Clear();
                txCnpj.Clear();
                txFantasia.Clear();
                txEndereco.Clear();
                txBaixxo.Clear();
                txCidade.Clear(); 
                txUF.Clear();
                txCep.Clear();
                txEmail.Clear();
            } else
            {
                logGtin.Clear();
                txProduto.Clear();
                txNcm.Clear();
                txMarca.Clear();
                txPeso.Clear();                
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            if (!Directory.Exists(@"\\gtin"))
                Directory.CreateDirectory("gtin");
        }        

        private void linkLabel2_Click(object sender, EventArgs e)
        {
            try
            {
                linkLabel1.LinkVisited = true;
                System.Diagnostics.Process.Start("http://www.pdvfiscal.com.br");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Não foi possíveçl abrir o link.");
            }
        }

        private void linkLabel2_DoubleClick(object sender, EventArgs e)
        {
            try
            {
                linkLabel1.LinkVisited = true;
                System.Diagnostics.Process.Start("http://www.pdvfiscal.com.br");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Não foi possíveçl abrir o link.");
            }
        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            try
            {
                linkLabel1.LinkVisited = true;
                System.Diagnostics.Process.Start("http://www.pdvfiscal.com.br");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Não foi possíveçl abrir o link.");
            }
        }
    }
}