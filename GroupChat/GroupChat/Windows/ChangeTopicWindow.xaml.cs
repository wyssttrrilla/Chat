using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace GroupChat.Windows
{
    /// <summary>
    /// Логика взаимодействия для ChangeTopicWindow.xaml
    /// </summary>
    public partial class ChangeTopicWindow : Window
    {
        Model.Chatroom _chatroom;
        public ChangeTopicWindow(Model.Chatroom chatroom)
        {
            InitializeComponent();
            _chatroom = chatroom;
            this.DataContext = _chatroom;
        }
        private void BtnSAve_Click(object sender, RoutedEventArgs e)
        {
           MainWindow.db.SaveChanges();
            MessageBox.Show("SAve", "Information", MessageBoxButton.OK, MessageBoxImage.Information);
            this.Close();
        }
    }
}
