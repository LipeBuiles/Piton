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
using System.Diagnostics;

namespace WindowsFormsApp1
{
    public partial class Principal : Form
    {
        public Principal()
        {
            InitializeComponent();
        }

        private void salirToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void entregasToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }

        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void análisisLéxicoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Lexico objLex = new Lexico();
            objLex.Show();
        }

        private void faseAnálisisToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void lenguajeLCFToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string pdfPath = Path.Combine(Application.StartupPath, "archivo.pdf");

            Process.Start(pdfPath);
        }

        private void acercaDelProgramaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string pdfPath = Path.Combine(Application.StartupPath, "archivo1.pdf");

            Process.Start(pdfPath);
        }
    }
}
