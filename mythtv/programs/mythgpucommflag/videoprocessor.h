#ifndef _VIDEOPROCESSOR_H
#define _VIDEOPROCESSOR_H

#include <QList>
#include <QString>

#include "openclinterface.h"
#include "resultslist.h"
#include "videopacket.h"

extern "C" {
#include "libavcodec/avcodec.h"
}

typedef FlagResults *(*VideoProcessorFunc)(OpenCLDevice *, AVFrame *frame,
                                           AVFrame *wavelet);

typedef struct {
    QString name;
    VideoProcessorFunc func;
} VideoProcessorInit;

class VideoProcessor
{
  public:
    VideoProcessor(QString name, VideoProcessorFunc func) :
        m_name(name), m_func(func)  {};
    ~VideoProcessor();

    QString m_name;
    VideoProcessorFunc m_func;
};

class VideoProcessorList : public QList<VideoProcessor *>
{
  public:
    VideoProcessorList(VideoProcessorInit initList[]);
    ~VideoProcessorList();
};

extern VideoProcessorList *openCLVideoProcessorList;
extern VideoProcessorList *softwareVideoProcessorList;

void InitVideoProcessors(void);
void InitOpenCLVideoProcessors(void);
void InitSoftwareVideoProcessors(void);

void SoftwareWavelet(AVFrame *frame, AVFrame *wavelet);
void OpenCLWavelet(OpenCLDevice *dev, VideoPacket *frame, VideoPacket *wavelet);

#endif

/*
 * vim:ts=4:sw=4:ai:et:si:sts=4
 */