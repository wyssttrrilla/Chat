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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace GroupChat.Pages
{
    /// <summary>
    /// Логика взаимодействия для ChatRoompage.xaml
    /// </summary>
    public partial class ChatRoompage : Page
    {
        public Model.Chatroom _chatroom;
        public Model.ChatMessage message;
        public Model.Employee employee;
        public Model.EmployeeChat roomChat;
        public ChatRoompage(Model.Chatroom chatroom)
        {
            InitializeComponent();
            var chat = chatroom.Id_Chatroom;
            LvUser.ItemsSource = MainWindow.db.EmployeeChat.Where(z => z.Chatroom_Id == chat).ToList();
            _chatroom = chatroom;
            this.DataContext = _chatroom;
            LvMessages.ItemsSource = MainWindow.db.ChatMessage.Where(z => z.Chatroom_Id == chatroom.Id_Chatroom).ToList();
        }

        private void Refreshmessage()
        {
            LvMessages.ItemsSource = MainWindow.db.ChatMessage.Where(z => z.Chatroom_Id == _chatroom.Id_Chatroom).ToList();
        }
        private void BtnAddUser_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new EmployeeSearchPage(_chatroom.Id_Chatroom));
        }

        private void BtnChangeTopic_Click(object sender, RoutedEventArgs e)
        {
            Windows.ChangeTopicWindow changeTopic = new Windows.ChangeTopicWindow(_chatroom);
            changeTopic.Show();
        }

        private void LeaveChatroom_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void BtnSend_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(TxtMessage.Text))
            {
                MessageBox.Show("You can't send an empty message!!!", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                var message = new Model.ChatMessage()
                {
                    Sender_Id = MainWindow.emp.Id_Employee,
                    Chatroom_Id = _chatroom.Id_Chatroom,
                    Date = DateTime.Now,
                    Message = TxtMessage.Text,
                };
                MainWindow.db.ChatMessage.Add(message);
                MainWindow.db.SaveChanges();
                Refreshmessage();
                TxtMessage.Text = "";
            }

        }
    }
}
