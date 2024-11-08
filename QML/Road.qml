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

import QtQuick 2.12
import QtQuick.Window 2.11
import QtQuick3D 1.0
import QtQuick.Controls 2.4

Item {
    id: road_load
    MaterialControl {
        id: control
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    View3D {
        anchors.fill: parent
        camera: camera

        PerspectiveCamera {
            id: camera
            position: Qt.vector3d(0, 80, -400)
            rotation: Qt.vector3d(15, 0, 0)
        }

        //! [use]
//        Model {
//            position: Qt.vector3d(0, 0, 0)
//            scale: Qt.vector3d(2, 30, 2)
//            rotation: Qt.vector3d(90, 0, 0)
//            source: "#Rectangle"
//            materials: [
//                ExampleMaterial {
//                    id: exampleMaterial
//                    time: control.time
//                    amplitude: control.amplitude
//                }
//            ]
//        }
        Model {
            id: tunnel_2
             source: "meshes/laneline.mesh"
               scale: Qt.vector3d(0.03,0.1,0.03)
               rotation: Qt.vector3d(45, 0, 90)
               position.y:-300
               position.x:-120
             materials: [
                 ExampleMaterial {
                     id: exampleMaterial
                     time: control.time
                     amplitude: control.amplitude
                 }
             ]
        }
        Model {
            id: tunnel_21
             source: "meshes/laneline.mesh"
               scale: Qt.vector3d(0.03,0.1,0.03)
               rotation: Qt.vector3d(45, 0, 90)
               position.y:-300
               position.x:120
             materials: [
                 ExampleMaterial {
                     id: exampleMaterial2
                     time: control.time
                     amplitude: control.amplitude
                 }
             ]
        }
        //! [use]
    }
}
