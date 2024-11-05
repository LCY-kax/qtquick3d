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
import QtQuick.Window 2.14
//! [extra import]
import QtGraphicalEffects 1.14
//! [extra import]
import QtQuick.Layouts 1.14
import QtQuick.Controls 1.0

Window {
    id:w
    visible: true
    width: 1920
    height: 720-20
    title: qsTr("HUD DEMO")
    //    color: "#6b7080"
    color: "transparent"


    Text {
        x:20
        y:5
        z:5
        id: log
        color:"red"
        font.pixelSize: 25
        text: qsTr("W,A,S,D控制方向/Q,E控制旋转；空格复位箭头,滑块控制道路曲度")
        visible: true
    }

    //    Item {
    //        id: viewArea
    //        anchors.top: parent.topcontrolArea
    //        anchors.bottom: parent.bottom
    //        anchors.right: parent.right
    //        anchors.left: parent.right
    //        //! [blending]
    //        BackgroundView {
    //            id: background
    //            anchors.fill: parent
    //        }
    //        //! [blending]
    //    }



    HUD_3D {
        id: hud_3D
        anchors.fill: parent
    }

    RowLayout {
        anchors.fill: parent

        Navi {
            id: navi
            // 设置 Navi 的对齐方式为右对齐
            //            anchors.right: parent.right
            //            anchors.rightMargin: 150
            //            // 设置 Navi 的垂直对齐方式为居中
            //            anchors.verticalCenter: parent.verticalCenter
            // 使用 Layout.alignment 进行对齐
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            // 你可以使用 Layout.margins 设置边距
            Layout.rightMargin: 150
        }
    }

    Row {
        x:1130
        z:7
        anchors.top: parent.top
        spacing: 5
        TextField{
            width: 178
            placeholderText:"ID高德1-49，腾讯1-72"
            onEditingFinished: {
                navi.turnsituation =text;
                 console.log("ID"+text)
            }
        }
//        TextField{
//            width: 20
//            placeholderText:"输入1：'高德' 2：'腾讯'"
//            onEditingFinished: {
//                if(text === 1){
//                    navi.navigationoptions = 1;
//                    console.log("index change1")
//                }else{
//                    navi.navigationoptions = 2;
//                    console.log("index change2")
//                }
//            }
//        }
        ComboBox {
            id:comboBox
            model: ["高德", "腾讯"]
            onCurrentIndexChanged: {
                if(currentIndex === 1){
                    navi.navigationoptions = 1;
//                    console.log("index change1")
                }else{
                    navi.navigationoptions = 2;
//                    console.log("index change2")
                }
            }
        }
        Button {
            text: "显示"
            onClicked: {
                if(navi.displaycontent===1)  {  navi.displaycontent=0;}else{ navi.displaycontent=1;}

            }
        }

    }



}
