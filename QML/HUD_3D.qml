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

import QtQuick 2.5
import QtQuick3D 1.14
import QtQuick3D.Materials 1.14


View3D {
    id :view3d
    property real moveStep: 10
    property int dx:0
    property int dz:0
    property bool wKeyPressed: false
    property bool aKeyPressed: false
    property bool sKeyPressed: false
    property bool dKeyPressed: false
    property bool rightPressed: false
    property bool leftPressed: false
    property bool spacePressed: false

    //! [background]
    environment: SceneEnvironment {
        //        clearColor: "#848895"
//        backgroundMode: SceneEnvironment.SkyBox
        clearColor: "transparent"
//        backgroundMode: SceneEnvironment.Skybox
        //        clearColor: Qt.rgba(0, 0, 0, 0)
//        backgroundMode: SceneEnvironment.Color
      backgroundMode: SceneEnvironment.Transparent
    }
    //! [background]

    DirectionalLight {
        id:light
        x: 0
        y: 300
        brightness: 250+100
        color: "white"
        z: -200
        rotation:Qt.vector3d(0, 45, 0)
        castsShadow: true
        //         shadowFactor:5
        //         shadowMapQuality : Light.shadowMapQualityHigh

    }

    PointLight{
        y:200
        constantFade:1
        linearFade: 0.01
        quadraticFade: 0.0001
        castsShadow: true
    }
    Node{
        id:perCamera
        z:-400
        x:0
        y:0
        PerspectiveCamera {
            id:perCamera_C
            //        z:-500
            //        x:0
            //        y:0
            y:80
            rotation:Qt.vector3d(15, 0, 0)
        }
    }
//道路
    MaterialControl {
        id: control
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Model {
        id: tunnel_l
         source: "meshes/laneline.mesh"
           scale: Qt.vector3d(0.03,0.1,0.03)
           rotation: Qt.vector3d(75, 0, 90)
           position.y:-300
           position.x:-220
         materials: [
             ExampleMaterial {
                 id: exampleMaterial
                 amplitude: control.amplitude
                 nodot:0
             }
         ]
    }
    Model {
        id: tunnel_r
         source: "meshes/laneline.mesh"
           scale: Qt.vector3d(0.03,0.1,0.03)
           rotation: Qt.vector3d(75, 0, 90)
           position.y:-300
           position.x:220
         materials: [
             ExampleMaterial {
                 id: exampleMaterial2
                 amplitude: control.amplitude
                 nodot:0
             }
         ]
    }

    Model {
        id: tunnel_m
         source: "meshes/laneline.mesh"
           scale: Qt.vector3d(0.03,1.1,0.03)
           rotation: Qt.vector3d(75, 0, 90)
           position.y:-300
           position.x:155
         materials: [
             ExampleMaterial {
                 id: exampleMaterial3
                 amplitude: control.amplitude*0.1
                 nodot:1
             }
         ]
    }
//道路



//3d箭头
    property vector3d initPosition:Qt.vector3d(-22, -90,-130)
    property int initRotationx:60
    property int initRotationy:0
    property int initRotationz:42
    Node {
        id: arrow
        //    z:initPosition.z
        //    y:initPosition.y
        //    x:initPosition.x
        z:-130
        y:-90
        x:-22
        //    pivot: Qt.vector3d(22, 60, 0)
        //    rotationOrder: Node.XYZr
        //    orientation: Node.RightHanded
        rotation: Qt.vector3d(60, 0, 42)
        //    eulerRotation:Qt.vector3d(60, 0, 42)

        Model {
            id: ___2
            rotationOrder: Node.XYZr
            orientation: Node.RightHanded
            castsShadows:true
            source: "qrc:/meshes/___2.mesh"

            PrincipledMaterial {
                id: default_material
                //            diffuseColor: "#ffbebebe"
                //            baseColor: "#ffbebebe"
                baseColorMap: Texture {
                    source:"qrc:/meshes/webp.jpg"
                }
                //            emissiveColor: "#ff00ff00"
                //            emissiveColor: Qt.vector3d(0.1, 0.0, 0.0)// 自发光颜色
                //            alphaCutoff: 0.5  // 不透明度
                alphaMode:PrincipledMaterial.Blend//Opaque//PrincipledMaterial.Blend
                metalness: 1
                roughness: 1
                opacity: 0.7
            }
            materials: [
                default_material
            ]
        }

        Model {
            id: ___1
            castsShadows:true
            rotationOrder: Node.XYZr
            orientation: Node.RightHanded
            source: "qrc:/meshes/___1.mesh"
            materials: [
                default_material
            ]
        }

        Model {
            id: ___1_1
            castsShadows:true
            rotationOrder: Node.XYZr
            orientation: Node.RightHanded
            source: "qrc:/meshes/___1_1.mesh"
            materials: [
                default_material
            ]
        }

        Model {
            id: ___2_1
            castsShadows:true
            rotationOrder: Node.XYZr
            orientation: Node.RightHanded
            source: "qrc:/meshes/___2_1.mesh"
            materials: [
                default_material
            ]
        }

        Model {
            id: ___2_2
            castsShadows:true
            rotationOrder: Node.XYZr
            orientation: Node.RightHanded
            source: "qrc:/meshes/___2_2.mesh"
            materials: [
                default_material
            ]
        }

    }


    focus: true

    Keys.onPressed: {
        if (event.key === Qt.Key_A) {
            aKeyPressed = true
            //            moveCamera()//a
        }else if (event.key === Qt.Key_D) {
            dKeyPressed = true
            //            moveCamera()//d
        } else if (event.key === Qt.Key_W) {
            wKeyPressed = true
            //            moveCamera()//w
        } else if (event.key === Qt.Key_S) {
            sKeyPressed = true
            //            moveCamera()//s
        }
        if(event.key === Qt.Key_Space){
            spacePressed = true
        }
        if(event.key === Qt.Key_E){
            rightPressed = true
        }
        if(event.key === Qt.Key_Q){
            leftPressed = true
        }
    }
    Keys.onReleased: {
        if (event.key === Qt.Key_A) {
            aKeyPressed = false
        } else if (event.key === Qt.Key_D) {
            dKeyPressed = false
        } else if (event.key === Qt.Key_W) {
            wKeyPressed = false
        } else if (event.key === Qt.Key_S) {
            sKeyPressed = false
        }
        if(event.key === Qt.Key_Space){
            //            spacePressed = false
        }
        if(event.key === Qt.Key_E){
            rightPressed = false
        }
        if(event.key === Qt.Key_Q){
            leftPressed = false
        }
    }
    Timer {
        id: frameTimer
        interval: 16 // 设置每帧的间隔时间，16ms 对应大约 60fps
        repeat: true
        running: (aKeyPressed || dKeyPressed || wKeyPressed || sKeyPressed || rightPressed || leftPressed)?true:false
        onTriggered: {
            moveArrow()
            rotateArrow()
        }
    }
    function  rotateArrow(){
        if(rightPressed){
            //            arrow.rotation.y=(arrow.rotation.y+3)% 360
            //            arrow.rotation.z=(arrow.rotation.z-3)% 360
            rotateAnimationr.start()
        }
        if(leftPressed){
            //            arrow.rotation.y=(arrow.rotation.y-3)% -360
            //            arrow.rotation.z=(arrow.rotation.z+3)% 360
            rotateAnimationl.start()
        }

    }
    ParallelAnimation {
        id:rotateAnimationr
        running: false
        NumberAnimation { target: arrow; property: "rotation.x"; to: 22; duration:1000 ; easing.type:Easing.OutQuad}
        NumberAnimation { target: arrow; property: "rotation.y"; to: -45; duration:1000 ; easing.type:Easing.OutQuad}
        NumberAnimation { target: arrow; property: "rotation.z"; to: -45; duration:1000 ; easing.type:Easing.OutQuad}
        NumberAnimation { target: arrow; property: "y"; to: initPosition.y+20; duration:1200 ; easing.type:Easing.OutQuad}
    }
    ParallelAnimation {
        id:rotateAnimationl
        running: false
        NumberAnimation { target: arrow; property: "rotation.x"; to: -22; duration:1000 ; easing.type:Easing.OutQuad}
        NumberAnimation { target: arrow; property: "rotation.y"; to: -145; duration:1000 ; easing.type:Easing.OutQuad}
        NumberAnimation { target: arrow; property: "rotation.z"; to: -45; duration:1000 ; easing.type:Easing.OutQuad}
        NumberAnimation { target: arrow; property: "y"; to: initPosition.y+20; duration:1200 ; easing.type:Easing.OutQuad}
    }
    function  moveArrow(){
        dx=0
        dz=0
        if (sKeyPressed)
            dz-=moveStep
        if (wKeyPressed)
            dz+=moveStep
        if (dKeyPressed)
            dx+=moveStep
        if (aKeyPressed)
            dx-=moveStep
        //            console.log("=====wKeyPressed====="+wKeyPressed+"=====sKeyPressed====="+sKeyPressed+"=====aKeyPressed====="+aKeyPressed+"=====dKeyPressed====="+dKeyPressed+"/n")
        //             console.log("=====dz====="+dz+"=====dx====="+dx+"/n")
        //            animation.start();
        //        var world_dx = dx *Math.cos(arrow.rotation.y* Math.PI / 180) + dz *Math.sin(arrow.rotation.y* Math.PI / 180);
        //        var world_dz = -dx *Math.sin(arrow.rotation.y* Math.PI / 180) + dz *Math.cos(arrow.rotation.y* Math.PI / 180);
        //         arrow.position = Qt.vector3d(arrow.position.x + world_dx, arrow.position.y, arrow.position.z + world_dz);
        arrow.position = Qt.vector3d(arrow.position.x +  dx, arrow.position.y, arrow.position.z + dz);
        //        console.log("====== arrow.position===="+ arrow.position)
    }

    SequentialAnimation {
        id:returnArrow
        running: spacePressed
        ParallelAnimation {
            NumberAnimation { target: arrow; property: "y"; to: initPosition.y; duration:1200 ; easing.type:Easing.OutQuad}
            NumberAnimation { target: arrow; property: "x"; to: initPosition.x; duration:1200 ; easing.type:Easing.OutQuad}
            NumberAnimation { target: arrow; property: "z"; to: initPosition.z; duration: 1200 ;easing.type:Easing.InQuad}
            NumberAnimation { target: arrow; property: "rotation.y"; to:initRotationy; duration: 1000 ;easing.type:Easing.InQuad}
            NumberAnimation { target: arrow; property: "rotation.z"; to:initRotationz; duration: 1000 ;easing.type:Easing.InQuad}
            NumberAnimation { target: arrow; property: "rotation.x"; to:initRotationx; duration: 1000 ;easing.type:Easing.InQuad}
        }
        //        ParallelAnimation {

        //        }
        onStopped: { spacePressed = false }
        //        onFinished:{ spacePressed = false }
    }
 //3d箭头


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
