#ifndef AUDIOOBJECT_H
#define AUDIOOBJECT_H

#include <QString>

#include <portaudio.h>
#include <sndfile.hh>

class AudioObject
{
public:
    AudioObject();
    ~AudioObject();
    void setFile(const QString &filePath);
    void setVolume(const float volume);

    void play();
    void stop();
    void pause();

    void mix(float* buffer, size_t framesPerBuffer, int deviceListIndex);

    bool isPlaying();
    bool isPaused();
    bool isStopped();

private:
    SndfileHandle *file0 = nullptr;
    SndfileHandle *file1 = nullptr;
    bool paused = false;
    bool stopped = true;
    float _volume = 1; // 0.0 - 1.0
    float *sideBuffer = nullptr;
    sf_count_t bufferRead;
    const size_t SIDE_BUFFER_MULTIPLIER = 2;
    size_t sideBufferScan = 0;
};

#endif // AUDIOOBJECT_H
