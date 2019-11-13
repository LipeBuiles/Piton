using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace WindowsFormsApp1
{
    public partial class Lexico : Form
    {
        string nombreArchivo;
        public Lexico()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void lblTitulo_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnAnalisis_Click(object sender, EventArgs e)
        {


            try
            {
                string cadenaAejecutar = "Piton.exe";
                if (nombreArchivo == "")
                {
                    System.Diagnostics.Process.Start(cadenaAejecutar);
                }
                else
                {
                    
                    System.Diagnostics.Process.Start(cadenaAejecutar, nombreArchivo);
                }
                try

                {

                    FileStream objleer = new FileStream("temp.txt", FileMode.Open, FileAccess.Read);
                    StreamReader sr = new StreamReader(objleer);
                    string linea;
                    txtAnalisis.Text = "Compilando....\r\n";
                    linea = sr.ReadLine();
                    while (linea != null)
                    { // Lee líneas mientras haya (mientras sean !=null)

                        txtAnalisis.AppendText(linea + "\r\n");

                        linea = sr.ReadLine();
                    }

                    sr.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error en la apertura de archivo" + nombreArchivo + "  " + ex.ToString());
                }
            }
            catch (Exception ea)
            {
                MessageBox.Show("Error.. en la compilacion" + ea);
            }
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {

            string fileName = "prog.pas";
            nombreArchivo = "prog.pas";
            FileStream stream = new FileStream(fileName, FileMode.Create, FileAccess.Write);
            StreamWriter writer = new StreamWriter(stream);
            writer.Write(txtPrograma.Text);
            writer.Close();
            txtAnalisis.Text = "Archivo guardado....\n";
            File.Delete("temp.txt");
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            txtPrograma.Clear();
            txtAnalisis.Clear();
        }
    }
}
