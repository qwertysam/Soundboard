#ifndef DIALOGSOUND_H
#define DIALOGSOUND_H

#include <QDialog>

#include "listitemsound.h"

class MainWindow;

namespace Ui {
class DialogSound;
}

class DialogSound : public QDialog
{
    Q_OBJECT

public:
    explicit DialogSound(MainWindow *main, ListItemSound *sound, bool creatingNew = false);
    ~DialogSound();

private slots:
    void on_buttonBox_accepted();
    void on_buttonBox_rejected();
    void on_sliderVolume_valueChanged(int value);
    void on_spinBoxVolume_valueChanged(int arg1);
    void on_pushButtonFile_clicked();
    void onClose();

private:
    Ui::DialogSound *ui;
    MainWindow *main;
    ListItemSound *sound;
    bool creatingNew;
    bool soundUpdated;
};

#endif // DIALOGSOUND_H