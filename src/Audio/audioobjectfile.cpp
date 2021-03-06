#include "audioobjectfile.h"

#include <QString>
#include <QFile>
#include <portaudio.h>
#include "audioengine.h"
#include "iomultifile.h"

bool AudioObjectFile::isPlaying() { return !isPaused() && !isStopped(); }
bool AudioObjectFile::isPaused() { return paused; }

void AudioObjectFile::stop() {
    AudioObject::stop();
    paused = false;
    _file.clear();
}

void AudioObjectFile::pause() {
    if (!stopped) {
        emit update(0);
        paused = true;
        stopped = false;
    }
}

void AudioObjectFile::play() {
    if (!_hasFile) return;
    if (paused) {
        // Resume
        paused = false;
    } else {
        stopped = false;
        _file.startRead();
    }
}

void AudioObjectFile::write(const float* /*buffer*/, size_t /*n*/) {
    // Leave empty
}
size_t AudioObjectFile::read(float* buffer, size_t n) {
    return _file.read(buffer, n);
}

bool AudioObjectFile::doMix() {
    return !stopped && !paused && _hasFile;
}

void AudioObjectFile::setFile(const QString &filename) {
    stop();

    _filename = filename.toStdString();

    if (filename.isNull() || filename.isEmpty()) {
        _hasFile = false;
        return;
    }

    // Check to see if the file is readable
    QFile file(filename);
    if (!file.open(QIODevice::ReadOnly)) {
        qWarning("Couldn't open audio file.");
        _hasFile = false;
    } else {
        _hasFile = true;
    }
    file.close();

    // If there's a new file being opened
    if (_hasFile) _file.setFile(_filename);
}

bool AudioObjectFile::hasFile() {
    return _hasFile;
}
