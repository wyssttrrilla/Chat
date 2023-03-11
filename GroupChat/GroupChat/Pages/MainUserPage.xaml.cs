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
    /// Логика взаимодействия для MainUserPage.xaml
    /// </summary>
    public partial class MainUserPage : Page
    {
        public static Model.Employee _employee;
        public MainUserPage(Model.Employee employee)
        {
            InitializeComponent();
            _employee = employee;
            this.DataContext = _employee;
            LvChats.ItemsSource = MainWindow.db.Chatroom.ToList();
        }

        private void BtnSearch_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.EmployeeSearchPage(0));
        }

        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            App.Current.Shutdown();
        }

        private void LvChats_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var b = MainWindow.db.EmployeeChat.Where(z => z.Employee_Id == _employee.Id_Employee).FirstOrDefault();
            if (b != null)
            {
                var a = ((sender as ListView).SelectedItem as Model.Chatroom);
                NavigationService.Navigate(new Pages.ChatRoompage(a));
            }
            else
            {
                MessageBox.Show("You are not a member of this chat", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
