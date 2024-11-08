/****************************************************************************
**
** Copyright (C) 2019 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

out vec4 fragColor;

in vec3 pos;

//void main() {
//    fragColor = vec4(abs(pos.x) * 0.005, abs(pos.y) * 0.005, pos.z * 0.002, 0.01);
////    fragColor = vec4(pos.x * 0.8, pos.y * 0.8, pos.z * 0.8, 1);
//}

void dot_lane_line(float start, float end)
{
    if (pos.x > start && pos.x < end) {
        fragColor = vec4(0.0, 0.0, 0.0, 0.0);
    }
    else {
        if (start >= 5000.0) {
            start = start - 5000.0;
            end = start + 50.0;
            if (pos.x > start && pos.x < end) {
                fragColor = vec4(0.0, 0.0, 0.0, 0.0);
            }
        }
    }
}

void main()
{
    //    fragColor = vec4(pos.x * 0.005, pos.y * 0.005, pos.z * 0.002, 1);

    if(nodot!=1)
    {
        fragColor = vec4(0.4, 0.4, 0.5, 1);
        float offset = 0.0;
        for (int i = 0; i < 20; i++) {
            offset = i*5000.0;
            dot_lane_line(0.0+dot_step*50.0+offset, 1500.0+dot_step*50.0+offset);
        }
    }else{
        fragColor = vec4(abs(pos.x) * 0.005, abs(pos.y) * 0.005, pos.z * 0.002, 1);
    }
}
