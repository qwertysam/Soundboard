#include "dialogkeybind.h"
#include "ui_dialogkeybind.h"

#include "keybindwidget.h"
#include <QKeyEvent>

DialogKeybind::DialogKeybind(QWidget *parent, KeybindWidget *text) :
    QDialog(parent),
    ui(new Ui::DialogKeybind),
    text(text)
{
    ui->setupUi(this);
}

DialogKeybind::~DialogKeybind()
{
    delete ui;
}

void DialogKeybind::keyPressEvent(QKeyEvent *e) {
    this->text->updateKey(e->key()==Qt::Key_Escape ? -1 : e->key());
    this->close();
}
