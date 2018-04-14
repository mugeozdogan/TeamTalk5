/*
 * Copyright (c) 2005-2018, BearWare.dk
 * 
 * Contact Information:
 *
 * Bjoern D. Rasmussen
 * Kirketoften 5
 * DK-8260 Viby J
 * Denmark
 * Email: contact@bearware.dk
 * Phone: +45 20 20 54 59
 * Web: http://www.bearware.dk
 *
 * This source code is part of the TeamTalk SDK owned by
 * BearWare.dk. Use of this file, or its compiled unit, requires a
 * TeamTalk SDK License Key issued by BearWare.dk.
 *
 * The TeamTalk SDK License Agreement along with its Terms and
 * Conditions are outlined in the file License.txt included with the
 * TeamTalk SDK distribution.
 *
 */

package dk.bearware;

public class SpeexVBRCodec
{
    public int nBandmode;
    public int nQuality;
    public int nBitRate;
    public int nMaxBitRate;
    public boolean bDTX;
    public int nTxIntervalMSec;
    public boolean bStereoPlayback;
    
    public SpeexVBRCodec() {}
    
    public SpeexVBRCodec(boolean set_defaults) {
        if(!set_defaults)
            return;
        
        nBandmode = SpeexConstants.DEFAULT_SPEEX_BANDMODE;
        nQuality = SpeexConstants.DEFAULT_SPEEX_QUALITY;
        nBitRate = SpeexConstants.DEFAULT_SPEEX_BITRATE;
        nMaxBitRate = SpeexConstants.DEFAULT_SPEEX_MAXBITRATE;
        bDTX = SpeexConstants.DEFAULT_SPEEX_DTX;
        nTxIntervalMSec = SpeexConstants.DEFAULT_SPEEX_DELAY;
        bStereoPlayback = SpeexConstants.DEFAULT_SPEEX_SIMSTEREO;
    }
}
