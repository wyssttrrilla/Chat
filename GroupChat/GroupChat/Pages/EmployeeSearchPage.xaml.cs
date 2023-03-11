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
    /// Логика взаимодействия для EmployeeSearchPage.xaml
    /// </summary>
    public partial class EmployeeSearchPage : Page
    {
        int CurrentChatroom;
        public EmployeeSearchPage(int currentChatroom)
        {
            InitializeComponent();
            LvEmployee.ItemsSource = MainWindow.db.Employee.ToList();
            CurrentChatroom = currentChatroom;
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void TxtSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            LvEmployee.ItemsSource = MainWindow.db.Employee.Where(z => z.Name.Contains(TxtSearch.Text)).ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Model.EmployeeChat addemployee = new Model.EmployeeChat();
            addemployee.Chatroom_Id = CurrentChatroom;
            var a = LvEmployee.SelectedItem as Model.Employee;
            var b = MainWindow.db.Employee.Where(z => z.Id_Employee == a.Id_Employee).FirstOrDefault();
            addemployee.Employee_Id = b.Id_Employee;
            MainWindow.db.EmployeeChat.Add(addemployee);
            MainWindow.db.SaveChanges();
            MessageBox.Show("Saved!");
        }
    }
}
