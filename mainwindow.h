#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    int selectedBoard;

private slots:

    void on_actionSave_triggered();

    void on_actionSave_As_triggered();

    void on_actionGitHub_Page_triggered();

    void on_actionCheck_For_Updates_triggered();

    void on_actionWiki_triggered();

    void on_actionExit_triggered();

    void on_actionSettings_triggered();

private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H
