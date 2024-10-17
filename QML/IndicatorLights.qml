import QtQuick 2.0

Item {
    id: root
//    width: 1920
//    height: 720
    visible:true

    property int imageOpacity0: 0
    property int imageOpacity: 0
    property int imageOpacity1: 0

    property int accActivationIndicatornum: 0
    property int change: 0
    property int changeint: 0
    property int big: 1
    property int checkid: 1
    property int checkidid: 0
    property int recordkm: 0

    property int qmlid: dataSource.qmlid
    property int check: dataSource.check
    property int check2f: dataSource.check2f

    onCheckChanged: {
        console.log("check:",check)
        if (check === 1 && qmlid !== 3) {
            dataSource.qmlid=2
        }
    }

    onCheck2fChanged: {
        //console.log("check2:",check,check2f,dataSource.firstqmlcheck,dataSource.qmlid)//0 1 false 3
        if (!dataSource.firstqmlcheck) {//0 1 false 0
            return
        }
        if (check2f === 0) {
            dataSource.qmlid=0
        } else {
            dataSource.qmlid=2
        }
         console.log("check22:",check,check2f,dataSource.firstqmlcheck,dataSource.qmlid)
    }

    onQmlidChanged: {
        // 自检
        if (qmlid == 3) {
            checktimer.stop()
            dataSource.qmlcheck=0
            return
        }
        else if(qmlid == 0){
            checkid=1;
            checktimer.restart()
        }
        else if (qmlid >= 2) {
            checktimer.stop()
            dataSource.qmlcheck=0
            dataSource.firstqmlcheck = true
        }
    }

    //自检
    Timer{
        id:checktimer
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            checkid++
            if(checkid>6){
                dataSource.qmlid=2
            }else if(checkid>3){
                dataSource.qmlid=1
            }
        }
    }

    Item {
        id: wantCheck //需要自检的灯
        Image {
            id: abmAirbag
            visible: dataSource.abmAirbag >0&&dataSource.abmAirbag <3 || qmlid <= 1
            opacity: dataSource.abmAirbag === 1 && qmlid >= 2 ? root.imageOpacity : 1
            x:1753
            y:50
            source:"qrc:/public/Lights/Theme1/Alone/abmAirbag.png"
        }
//        Image {
//            id: lowOilPressure
//            visible: dataSource.lowOilPressure >0&&dataSource.lowOilPressure <3 || qmlid === 0
//            opacity: dataSource.lowOilPressure === 1 && qmlid >= 2 ? root.imageOpacity : 1
//            x:56
//            y:266
//            source:"qrc:/public/Lights/Theme1/Alone/lowOilPressure.png"
//        }
        Image{
            id:ebdFault
            x:545
            y:104
            visible: dataSource.ebdFault>0 || qmlid === 0
            source:"qrc:/public/Lights/Theme1/Alone/ebdFault.png"
        }
        Image{
            id:absInstructions
            x:1163
            y:104
            visible: dataSource.absInstructions>0 || qmlid === 0
            source:"qrc:/public/Lights/Theme1/Alone/absInstructions.png"
        }
        Image {
            id: espInstructions
            visible: dataSource.espInstructions >0&&dataSource.espInstructions <3 || qmlid === 0
            opacity: dataSource.espInstructions === 1 && qmlid >= 2 ? root.imageOpacity : 1
            x:1271
            y:104
            source: "qrc:/public/Lights/Theme1/Alone/espInstructions.png"
        }
        Image{
            id:espOff
            x:1325
            y:104
            visible: dataSource.espOff>0 || qmlid === 0
            source:"qrc:/public/Lights/Theme1/Alone/espOff.png"
        }
        Image{
            id:lowFuel
            x:383
            y:586
            visible: dataSource.lowFuel>0 || qmlid === 0
            source:"qrc:/public/Lights/Theme1/Alone/lowFuel.png"
        }
        //水温
        Image {
            id: waterTemperature
            visible: dataSource.waterTemperature > 0&&dataSource.waterTemperature <4 || qmlid === 0
            x:1478
            y:586
            opacity: dataSource.waterTemperature === 1 && qmlid >= 2 ? root.imageOpacity : 1
            source: {
                if (qmlid === 0) {
                    return "qrc:/public/Lights/Theme1/Common/waterTemperatureRed.png"
                }
                else {
                    switch(dataSource.waterTemperature) {
                    case 1:
                        return "qrc:/public/Lights/Theme1/Common/waterTemperatureRed.png"
                    case 2:
                        return "qrc:/public/Lights/Theme1/Common/waterTemperatureBlue.png"
                    default:
                        return ""
                    }
                }
            }
        }
        Image {
            id: tirePressureSystemFailure
            visible: dataSource.tirePressureSystemFailure >0&&dataSource.tirePressureSystemFailure <3 || qmlid === 0
            opacity: dataSource.tirePressureSystemFailure === 1 && qmlid >= 2 ? root.imageOpacity : 1
            x:545
            y:586
            source:"qrc:/public/Lights/Theme1/Alone/tirePressureSystemFailure.png"
        }
        Image {
            id: epsPrompt
            visible: dataSource.epsPrompt >0&&dataSource.epsPrompt <3 || qmlid === 0
            opacity: dataSource.epsPrompt === 1 && qmlid >= 2 ? root.imageOpacity : 1
            x:545
            y:158
            source:"qrc:/public/Lights/Theme1/Alone/epsPrompt.png"
        }
        Image {
            id: epbParking
            visible: dataSource.epbParking > 0 || qmlid === 0
            opacity: dataSource.epbParking === 1 && qmlid >= 2 ? root.imageOpacity : 1
            x:599
            y:104
            source:"qrc:/public/Lights/Theme1/Alone/epbParking.png"
        }
        Image {
            id: epbfault
            visible: dataSource.epbfault >0&&dataSource.epbfault <3 || qmlid === 0
            opacity: dataSource.epbfault === 1 && qmlid >= 2 ? root.imageOpacity : 1
            x:599
            y:158
            source:"qrc:/public/Lights/Theme1/Alone/epbfault.png"
        }
        //变速箱故障（作废）
//        Image{
//            id:gearboxFailure
//            x:1830
//            y:320
//            visible: dataSource.gearboxFailure>0 || qmlid === 0
//            source:"qrc:/public/Lights/Theme1/Alone/gearboxFailure.png"
//            source:""
//        }
    }


    Item {
        id: noCheck

        //仪表指示灯
        Image{
            id:fatigueDrivingWarning
            x:653
            y:586
            visible: dataSource.fatigueDrivingWarning>0
            source:"qrc:/public/Lights/Theme1/Alone/fatigueDrivingWarning.png"
        }
        Image{
            id:beanLight
            x:387
            y:50
            visible: dataSource.beanLight>0
            source:"qrc:/public/Lights/Theme1/Alone/beanLight.png"
        }
        Image{
            id:frontFogLamp
            x:225
            y:50
            visible: dataSource.frontFogLamp>0
            source:"qrc:/public/Lights/Theme1/Alone/frontFogLamp.png"
        }
        Image{
            id:rearFogLamp
            x:279
            y:50
            visible: dataSource.rearFogLamp>0
            source:"qrc:/public/Lights/Theme1/Alone/rearFogLamp.png"
        }
        Image{
            id:mainLight
            x:441
            y:50
            visible: dataSource.mainLight>0
            source:"qrc:/public/Lights/Theme1/Alone/mainLight.png"
        }

        Image {
            id: driverSeatbeltWarning
            visible: dataSource.driverSeatbeltWarning === 1
            x:1375
            y:50
            opacity: dataSource.driverSeatbeltWarning === 1 ? root.imageOpacity : 1
            source:"qrc:/public/Lights/Theme1/Alone/driverSeatbeltWarning.png"
        }


        Image {
            id: passengerSeatbeltWarning
            visible: dataSource.passengerSeatbeltWarning > 0
            x:1429
            y:50
            opacity: dataSource.passengerSeatbeltWarning === 1 ? root.imageOpacity : 1
            source:"qrc:/public/Lights/Theme1/Alone/passengerSeatbeltWarning.png"
        }

        //第二排安全带未系

        Image {
            id: safetyBelt3
            visible: dataSource.safetyBelt3 > 0
            opacity: dataSource.safetyBelt3 === 1 ? root.imageOpacity : 1
            x:1483
            y:50
            source:"qrc:/public/Lights/Theme1/Alone/safetyBelt3.png"
        }
        Image {
            id: safetyBelt4
            visible: dataSource.safetyBelt4 > 0
            opacity: dataSource.safetyBelt4 === 1 ? root.imageOpacity : 1
            x:1537
            y:50
            source:"qrc:/public/Lights/Theme1/Alone/safetyBelt4.png"

        }
        Image {
            id: safetyBelt5
            visible: dataSource.safetyBelt5 > 0
            opacity: dataSource.safetyBelt5 === 1 ? root.imageOpacity : 1
            x:1591
            y:50
            source:"qrc:/public/Lights/Theme1/Alone/safetyBelt5.png"
        }
        //第三排安全带
//        Image {
//            id: safetyBelt6
//            visible: dataSource.safetyBelt6 > 0
//            opacity: dataSource.safetyBelt6 === 1 ? root.imageOpacity : 1
//            x:1645
//            y:50
//            source:"qrc:/public/Lights/Theme1/Alone/safetyBelt6.png"

//        }
//        Image {
//            id: safetyBelt7
//            visible: dataSource.safetyBelt7 > 0
//            opacity: dataSource.safetyBelt7 === 1 ? root.imageOpacity : 1
//            x:1699
//            y:50
//            source:"qrc:/public/Lights/Theme1/Alone/safetyBelt7.png"
//        }

        Image{
            id:intelligentGenerator
            x:491
            y:586
            visible: dataSource.intelligentGenerator>0
            source:"qrc:/public/Lights/Theme1/Alone/intelligentGenerator.png"
        }
        Image{
            id:milEngineFailure
            x:1271
            y:586
            visible: dataSource.milEngineFailure>0
            source:"qrc:/public/Lights/Theme1/Alone/milEngineFailure.png"
        }
        //EPC 指示灯(作废)
//        Image{
//            id:epc
//            x:1830
//            y:320
//            visible: dataSource.epc>0
//            source:"qrc:/public/Lights/Theme1/Alone/epc.png"
//        }

        Image {
            id: leftTurn
            visible: dataSource.leftTurn ===1?true:false
            x:594
            y:30
            source:"qrc:/public/Lights/Theme1/Alone/leftTurn.png"
        }
        Image {
            id: rightTurn
            visible: dataSource.rightTurn ===1?true:false
            x:1276
            y:30
            source:"qrc:/public/Lights/Theme1/Alone/rightTurn.png"
        }

//        Image{
//            id:rearendCollisionWarning
//            x:480
//            y:244
//            visible: dataSource.rearendCollisionWarning>0
//            source:"qrc:/public/Lights/Theme1/Alone/rearendCollisionWarning.png"
//        }
//        Image{
//            id:reverseSideAssist
//            x:1390
//            y:244
//            visible: dataSource.reverseSideAssist>0
//            source:"qrc:/public/Lights/Theme1/Alone/reverseSideAssist.png"
//        }

        Image {
            id: engineTheft
            visible: dataSource.engineTheft >0&&dataSource.engineTheft <3
            opacity: dataSource.engineTheft === 1 ? root.imageOpacity : 1
            x:171
            y:50
            source:"qrc:/public/Lights/Theme1/Alone/engineTheft.png"
        }



        Image{
            id:maintenanceIndicatorLight
            x:599
            y:586
            visible: dataSource.maintenanceIndicatorLight>0
            source:"qrc:/public/Lights/Theme1/Alone/maintenanceIndicatorLight.png"
        }

        //预留位置-16
        Image{
            id:powerBatteryFailure
            x:599
            y:288
            visible: dataSource.powerBatteryFailure>0
            source:"qrc:/public/Lights/Theme1/Reserve/powerBatteryFailure.png"
        }
        Image{
            id:vehicleSystemFailure
            x:1271
            y:288
            visible: dataSource.vehicleSystemFailure>0
            source:"qrc:/public/Lights/Theme1/Reserve/vehicleSystemFailure.png"
        }
        Image{
            id:cableConnection
            x:1163
            y:158
            visible: dataSource.cableConnection >0&&dataSource.cableConnection <3
            opacity: dataSource.cableConnection === 2 ? root.imageOpacity : 1
            source:"qrc:/public/Lights/Theme1/Reserve/cableConnection.png"
        }
        Image{
            id:lowChargeStateAlarm
            x:653
            y:158
            visible: dataSource.lowChargeStateAlarm>0
            source:"qrc:/public/Lights/Theme1/Reserve/lowChargeStateAlarm.png"
        }
        Image{
            id:readyPrompt
            x:921
            y:133+10
            visible: dataSource.readyPrompt>0
            source:"qrc:/public/Lights/Theme1/Reserve/readyPrompt.png"
        }



        Image{
            id:batterTemperatureHigh
            x:545
            y:288
            visible: dataSource.batterTemperatureHigh>0
            source:"qrc:/public/Lights/Theme1/Reserve/batterTemperatureHigh.png"
        }
        Image{
            id:batteryDisconnection
            x:437
            y:586
            visible: dataSource.batteryDisconnection>0
            source:"qrc:/public/Lights/Theme1/Reserve/batteryDisconnection.png"
        }
        Image{
            id:motorControllerOverheating
            x:1433
            y:586
            visible: dataSource.motorControllerOverheating>0
            source:"qrc:/public/Lights/Theme1/Reserve/motorControllerOverheating.png"
        }
        Image{
            id:driverPowerLimit
            x:707
            y:158
            visible: dataSource.driverPowerLimit>0
            source:"qrc:/public/Lights/Theme1/Reserve/driverPowerLimit.png"
        }
        Image{
            id:electricDriveSystemFaulty
            x:1379
            y:586
            visible: dataSource.electricDriveSystemFaulty>0
            source:"qrc:/public/Lights/Theme1/Reserve/electricDriveSystemFaulty.png"
        }
        Image{
            id:insulationFault
            x:1325
            y:288
            visible: dataSource.insulationFault>0
            source:"qrc:/public/Lights/Theme1/Reserve/insulationFault.png"
        }
        //RVM 指示灯（作废）
//        Image{
//            id:rvmIndicatorLight
//            x:715
//            y:100
//            visible: dataSource.rvmIndicatorLight>0
//            source:"qrc:/public/Lights/Theme1/Reserve/rvmIndicatorLight.png"
//        }
        Image{
            id:lowSpeedWarning
            x:117
            y:50
            visible: dataSource.lowSpeedWarning>0
            source:"qrc:/public/Lights/Theme1/Reserve/lowSpeedWarning.png"
        }
        Image{
            id:timingCharging
            x:1217
            y:158
            visible: dataSource.timingCharging>0
            source:"qrc:/public/Lights/Theme1/Reserve/timingCharging.png"
        }

        Image{
            id:coolantWarning
            x:1325
            y:586
            visible: dataSource.coolantWarning>0
            source:"qrc:/public/Lights/Theme1/Reserve/coolantWarning.png"
        }


        //预限速状态
        Image{
            id:prespeedLimiting0
            x:1144
            y:208
            visible: dataSource.prespeedLimiting ===5
            source:"qrc:/public/Lights/Theme1/Reserve/prespeedLimit3.png"
        }
        Image{
            id:prespeedLimiting1
            x:1144
            y:208
            visible: dataSource.prespeedLimiting ===6 || dataSource.prespeedLimiting ===9
            source:"qrc:/public/Lights/Theme1/Reserve/prespeedLimit4.png"
        }
        Image {
            id: prespeedLimiting
            visible: dataSource.prespeedLimiting > 0&&dataSource.prespeedLimiting <11
            x:1144
            y:208
            opacity:{
                switch(dataSource.prespeedLimiting) {
                case 2:
                    return dataSource.prespeedLimiting === 2 ? root.imageOpacity : 1
                case 3:
                    return dataSource.prespeedLimiting === 3 ? root.imageOpacity : 1
                case 4:
                    return dataSource.prespeedLimiting === 4 ? root.imageOpacity : 1
                case 5:
                    return dataSource.prespeedLimiting === 5 ? root.imageOpacity : 1
                case 6:
                    return dataSource.prespeedLimiting === 6 ? root.imageOpacity : 1
                case 9:
                    return dataSource.prespeedLimiting === 9 ? root.imageOpacity : 1
                default:
                    return 1
                }
            }
            source: {
                if(dataSource.prespeedLimiting === 1)
                {
                    return "qrc:/public/Lights/Theme1/Reserve/prespeedLimit1.png"
                }else if(dataSource.prespeedLimiting >= 2 && dataSource.prespeedLimiting <= 4)
                {
                    return "qrc:/public/Lights/Theme1/Reserve/prespeedLimit2.png"
                }else if(dataSource.prespeedLimiting === 8)
                {
                    return "qrc:/public/Lights/Theme1/Reserve/prespeedLimit3.png"
                }else if(dataSource.prespeedLimiting === 7)
                {
                    return "qrc:/public/Lights/Theme1/Reserve/prespeedLimit4.png"
                }else
                {
                    return ""
                }
            }
            Text {
                x:18
                y:(dataSource.prespeedLimiting >= 2 && dataSource.prespeedLimiting <= 4) ? 51:58
                width: 38
                height: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: {
                    if(dataSource.prespeedLimiting===2)
                    {
                        return "- -";
                    } else if(dataSource.prespeedLimitingValue === 255){
                        return "- -";
                    }else{
                        return dataSource.prespeedLimitingValue;
                    }
                }
                font.pixelSize: 22
                color: "#FFFFFF"
                font.family: fontname.fontSHEL
                font.styleName: "Bold"
            }
        }

//        //升档/降档
//        Image {
//            id: gears
//            visible: dataSource.gears > 0
//            x:480
//            y:352
//            source: {
//                switch(dataSource.gears) {
//                case 1:
//                    return "qrc:/public/Lights/Theme1/Reserve/gearsUp.png"
//                case 2:
//                    return "qrc:/public/Lights/Theme1/Reserve/gearsDown.png"
//                default:
//                    return ""
//                }
//            }

//        }





        //共用位置
        Image {
            id: daytimeLight
            visible: dataSource.daytimeLight > 0
            x:495
            y:50
            source: {
                switch(dataSource.daytimeLight) {
                case 1:
                    return "qrc:/public/Lights/Theme1/Common/daytimeLight1.png"
                case 2:
                    return "qrc:/public/Lights/Theme1/Common/daytimeLight2.png"
                default:
                    return ""
                }
            }

        }


        //GPF载碳量
        Image {
            id: carbonLoads
            visible: dataSource.carbonLoads > 0
            x:1217
            y:586
            source: {
                switch(dataSource.carbonLoads) {
                case 1:
                    return "qrc:/public/Lights/Theme1/Common/carbonLoadsGreen.png"
                case 2:
                    return "qrc:/public/Lights/Theme1/Common/carbonLoadsYellow.png"
                default:
                    return ""
                }
            }

        }


        //AUTO HOLD
        Image {
            id: autoHold
            visible: dataSource.autoHold > 0
            x:653
            y:104
            source: {
                switch(dataSource.autoHold) {
                case 1:
                    return "qrc:/public/Lights/Theme1/Common/autoHoldGreen.png"
                case 2:
                    return "qrc:/public/Lights/Theme1/Common/autoHoldYellow.png"
                default:
                    return ""
                }
            }
        }


        //陡坡缓降HDC
        Image {
            id: steepDescentHdc
            visible: dataSource.steepDescentHdc >0&&dataSource.steepDescentHdc <4
            opacity: dataSource.steepDescentHdc === 3 ? root.imageOpacity : 1
            x:1217
            y:104
            source: {
                switch(dataSource.steepDescentHdc) {
                case 1:
                    return "qrc:/public/Lights/Theme1/Common/steepDescentHdcYellow.png"
                case 2:
                    return "qrc:/public/Lights/Theme1/Common/steepDescentHdcGreen.png"
                case 3:
                    return "qrc:/public/Lights/Theme1/Common/steepDescentHdcGreen.png"
                default:
                    return ""
                }
            }
        }

        //_ACC激活指示灯
        //充电界面不显示：ACC、TJA、TSR指示灯
        Image {
            x:624
            y:212
            width: 72
            height: 72
            id: accActivationIndicator
            visible: dataSource.ChargeShow === 0 && dataSource.accActivationIndicator > 0
            source: {
                if(dataSource.accActivationIndicator===1||dataSource.accActivationIndicator===2||dataSource.accActivationIndicator===5){
                    return "qrc:/public/Lights/Theme1/Common/accActivationIndicatorGray.png"
                }else if(dataSource.accActivationIndicator===3||dataSource.accActivationIndicator===4){
                    if(big==1){
                        return "qrc:/public/Lights/Theme1/Common/accActivationIndicatorGreenBlowUp.png"
                    }else{
                        return "qrc:/public/Lights/Theme1/Common/accActivationIndicatorGreen.png"
                    }
                }else if(dataSource.accActivationIndicator===7){
                    return "qrc:/public/Lights/Theme1/Common/accActivationIndicatorRed.png"
                }else{
                    return ""
                }

            }
        }
        Rectangle{
            x:638//862
            y:236//245
            width: 43.2//44
            height: 24
            color:"#00000000"
            Text{
                anchors.centerIn: parent
                visible:  dataSource.ChargeShow === 0 && (dataSource.accActivationIndicator===1||dataSource.accActivationIndicator===2||dataSource.accActivationIndicator===3||dataSource.accActivationIndicator===4||dataSource.accActivationIndicator===5||dataSource.accActivationIndicator===7)?true:false
                text: {
                    if(dataSource.accActivationIndicator===1||dataSource.accActivationIndicator===2||dataSource.accActivationIndicator===5){
                        return dataSource.Cruisingspeed;
                    }else if(dataSource.accActivationIndicator===3||dataSource.accActivationIndicator===4){
                        if(dataSource.Cruisingspeed===255){
                            return "--"
                        }else if(dataSource.Cruisingspeed>130){
                            return "--"
                        }else if(dataSource.Cruisingspeed>=30){
                            return dataSource.Cruisingspeed
                        }else{
                            return "--"
                        }
                    }else if(dataSource.accActivationIndicator===7){
                        return "--"
                    }else{
                        return ""
                    }
                }
                color: {
                    if(dataSource.accActivationIndicator===1||dataSource.accActivationIndicator===2||dataSource.accActivationIndicator===5){
                        return "#666666"
                    }else if(dataSource.accActivationIndicator===3||dataSource.accActivationIndicator===4){
                        return "#2BE313"
                    }else if(dataSource.accActivationIndicator===7){
                        return "#DD0001"
                    }else{
                        return "#00000000"
                    }
                }
                font.pixelSize: {
                    if(big==1){
                        if(dataSource.accActivationIndicator===3||dataSource.accActivationIndicator===4){
                            return 24
                        }else{
                            return 20
                        }
                    }else{
                        return 20
                    }
                }
                font.family: fontname.fontRB
                font.styleName: "Medium"

            }
            Timer{
                interval: 100
                running:true
                repeat: true
                onTriggered: {

                    if(change===dataSource.Cruisingspeed){
                        changeint++
                        if(changeint==20){
                            big=0
                        }
                    }else{
                        big=1
                        changeint=0
                        change=dataSource.Cruisingspeed
                    }

                }

            }
        }

        //ECO/STP/NORMAL

        //_AEB功能指示灯
        Image {
            id: aebFunctionIndicator
            visible: dataSource.aebFunctionIndicator > 0&&dataSource.aebFunctionIndicator <6
            x:1271
            y:158
            opacity:{
                switch(dataSource.aebFunctionIndicator) {
                case 1:
                    return dataSource.aebFunctionIndicator === 1 ? root.imageOpacity1 : 1
                case 2:
                    return dataSource.aebFunctionIndicator === 3 ? root.imageOpacity : 1
                case 3:
                    return dataSource.aebFunctionIndicator === 3 ? root.imageOpacity : 1
                case 4:
                    return dataSource.aebFunctionIndicator === 3 ? root.imageOpacity : 1
                case 5:
                    return dataSource.aebFunctionIndicator === 3 ? root.imageOpacity : 1
                default:
                    return ""
                }
            }
            source: {
                switch(dataSource.aebFunctionIndicator) {
                case 1:
                    return "qrc:/public/Lights/Theme1/Common/aebFunctionIndicatorGreen.png"
                case 2:
                    return "qrc:/public/Lights/Theme1/Common/aebFunctionIndicatorGreen.png"
                case 3:
                    return "qrc:/public/Lights/Theme1/Common/aebFunctionIndicatorYellow.png"
                case 4:
                    return "qrc:/public/Lights/Theme1/Common/aebFunctionIndicatorYellow.png"
                case 5:
                    return "qrc:/public/Lights/Theme1/Common/aebFunctionIndicatorRed.png"
                default:
                    return ""
                }
            }
        }

        //FCW功能
        Image {
            id: fcwFunction
            visible: dataSource.fcwFunction > 0&&dataSource.fcwFunction <5
            x:1325
            y:158
            opacity:{
                switch(dataSource.fcwFunction) {

                case 1:
                    return dataSource.fcwFunction === 2 ? root.imageOpacity : 1
                case 2:
                    return dataSource.fcwFunction === 2 ? root.imageOpacity : 1
                case 3:
                    return dataSource.fcwFunction === 3 ? root.imageOpacity0 : 1
                case 4:
                    return dataSource.fcwFunction === 2 ? root.imageOpacity : 1

                default:
                    return ""
                }
            }
            source: {
                switch(dataSource.fcwFunction) {
                case 1:
                    return "qrc:/public/Lights/Theme1/Common/fcwFunctionGreen.png"
                case 2:
                    return "qrc:/public/Lights/Theme1/Common/fcwFunctionGreen.png"
                case 3:
                    return "qrc:/public/Lights/Theme1/Common/fcwFunctionGreen.png"
                case 4:
                    return "qrc:/public/Lights/Theme1/Common/fcwFunctionYellow.png"
                default:
                    return ""
                }
            }
        }


        //LAS指示灯
        Image {
            id: lasIndicatorLight
            visible: dataSource.lasIndicatorLight > 0&&dataSource.lasIndicatorLight <5
            x:1271
            y:223
            opacity: dataSource.lasIndicatorLight === 3 ? root.imageOpacity : 1
            source: {
                switch(dataSource.lasIndicatorLight) {
                case 1:
                    return "qrc:/public/Lights/Theme1/Common/lasIndicatorLightRed.png"
                case 2:
                    return "qrc:/public/Lights/Theme1/Common/lasIndicatorLightGray.png"
                case 3:
                    return "qrc:/public/Lights/Theme1/Common/lasIndicatorLightGreen.png"
                case 4:
                    return "qrc:/public/Lights/Theme1/Common/lasIndicatorLightGreen.png"
                default:
                    return ""
                }
            }
        }


        //智能远光灯
        Image {
            id: intelligentHighBeam
            visible: dataSource.intelligentHighBeam > 0
            x:333
            y:50
            source: {
                switch(dataSource.intelligentHighBeam) {
                case 1:
                    return "qrc:/public/Lights/Theme1/Common/intelligentHighBeamGreen.png"
                case 2:
                    return "qrc:/public/Lights/Theme1/Common/intelligentHighBeamWhite.png"
                case 3:
                    return "qrc:/public/Lights/Theme1/Common/intelligentHighBeamRed.png"
                default:
                    return ""
                }
            }
        }

        //盲区监测预警指示灯/侧后辅助系统指示灯
        Image {
            id: blindAreaWarning
            visible: dataSource.blindAreaWarning > 0
            x:1325
            y:223
            source: {
                switch(dataSource.blindAreaWarning) {
                case 1:
                    return "qrc:/public/Lights/Theme1/Common/blindAreaWarningGreen.png"
                case 2:
                    return "qrc:/public/Lights/Theme1/Common/blindAreaWarningYellow.png"
                case 3:
                    return "qrc:/public/Lights/Theme1/Common/blindAreaWarningRed.png"
                default:
                    return ""
                }
            }

        }

        //取消限速标识识别指示灯
        Image {
            id: tsrWarning
            visible: dataSource.ChargeShow === 0 && dataSource.tsrWarning > 0&&dataSource.tsrWarning <=9
            x:545
            y:212
            opacity: dataSource.tsrWarning === 3? root.imageOpacity : 1
            source: {
                switch(dataSource.tsrWarning) {
                case 1:
                    return "qrc:/public/Lights/Theme1/Common/tsrWarning1.png"
                case 2:
                    return "qrc:/public/Lights/Theme1/Common/tsrWarning2.png"
                case 3:
                    return "qrc:/public/Lights/Theme1/Common/tsrWarning2.png"
                case 4:
                    return "qrc:/public/Lights/Theme1/Common/tsrWarning4.png"
                case 5:
                    return $app.getCurrentLang==0?"qrc:/public/Lights/Theme1/Common/tsrWarning5.png":"qrc:/public/Lights/Theme1/Common/tsrWarning5_EN.png";
                    //"qrc:/public/Lights/Theme1/Common/tsrWarning5_EN.png"
                case 6:
                    return "qrc:/public/Lights/Theme1/Common/tsrWarning2.png"
                case 7:
                    return "qrc:/public/Lights/Theme1/Common/tsrWarning7.png"
                case 8:
                    return $app.getCurrentLang==0?"qrc:/public/Lights/Theme1/Common/tsrWarning8.png":"qrc:/public/Lights/Theme1/Common/tsrWarning8_EN.png";
//                    return "qrc:/public/Lights/Theme1/Common/tsrWarning8.png"
                default:
                    return ""
                }
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text:{if(dataSource.tsrSpeedValue===255){
                        return "---";
                    }else{
                        dataSource.tsrSpeedValue
                    }
                }
                visible: dataSource.tsrWarning===2||dataSource.tsrWarning===3?true:false
                font.pixelSize: 24
                font.family: fontname.fontRB
                font.styleName: "Medium"
                font.letterSpacing:0
                color:"#000000"
            }
        }
        Image {
            id: tJAICAIndicatorlight
            visible: dataSource.ChargeShow === 0 && dataSource.TJAICAIndicatorlight > 0
            x:703
            y:212
            source: {
                switch(dataSource.TJAICAIndicatorlight) {
                case 1:
                    return "qrc:/public/Lights/Theme1/Common/TJAICAIndicatorlightGray.png"
                case 2:
                    return "qrc:/public/Lights/Theme1/Common/TJAICAIndicatorlightGray.png"
                case 3:
                    return "qrc:/public/Lights/Theme1/Common/TJAICAIndicatorlightGreen.png"
                case 4:
                    return "qrc:/public/Lights/Theme1/Common/TJAICAIndicatorlightRed.png"
                case 5:
                    return "qrc:/public/Lights/Theme1/Common/TJAICAIndicatorlightRed.png"
                default:
                    return ""
                }
            }
        }

        //adas car far
        property int carDistanceid:0
        property int carDistanceop:0
        property int carDistancech:dataSource.carDistance
        onCarDistancechChanged: {
            carDistancetimer.running=true
            noCheck.carDistanceid=0
            noCheck.carDistanceop=0
        }

        Timer{
            id:carDistancetimer
            interval: 1000
            running:true
            repeat: true
            onTriggered:{
                noCheck.carDistanceid=noCheck.carDistanceid+1;

                if(noCheck.carDistancech>0){
                    if(dataSource.carDistance===noCheck.carDistancech){
                        if(noCheck.carDistanceid===5){
                            noCheck.carDistanceop=1;
                            carDistancetimer.running=false
                            noCheck.carDistanceid=0
                        }
                        else{
                            noCheck.carDistanceop=0;
                        }
                    }else{
                        noCheck.carDistanceid=0
                    }
                }
            }
        }

        Image {
            id:carDistance1
            x:911
            y:631
            visible: {if(dataSource.carDistance===0||noCheck.carDistanceop===1||dataSource.ChargeShow !== 0){
                    return false
                }else if(dataSource.carDistance===1||dataSource.carDistance===2||dataSource.carDistance===3){
                    return true
                }else{
                    return false
                }
            }
            source: "qrc:/images_1st/Adas/carSpacing.png"
        }
        Image {
            id:carDistance2
            x:dataSource.carDistance===1?985:dataSource.carDistance===2?945:dataSource.carDistance===3?945:0
            y:631
            visible: {if(dataSource.carDistance===0||noCheck.carDistanceop===1||dataSource.ChargeShow !== 0){
                    return false
                }else if(dataSource.carDistance===1||dataSource.carDistance===2||dataSource.carDistance===3){
                    return true
                }else{
                    return false
                }
            }
            source: "qrc:/images_1st/Adas/carSpacing.png"
        }
        Image {
            id:carDistance3
            x:dataSource.carDistance===1||dataSource.carDistance===2?1019:dataSource.carDistance===3?979:0
            y:631
            visible: {if(dataSource.carDistance===0||noCheck.carDistanceop===1||dataSource.ChargeShow !== 0){
                    return false
                }else if(dataSource.carDistance===1||dataSource.carDistance===2||dataSource.carDistance===3){
                    return true
                }else{
                    return false
                }
            }
            source: "qrc:/images_1st/Adas/carSpacing.png"
        }
        Image {
            id:carDistance4
            x:871
            y:622
            visible: {if(dataSource.carDistance===0||noCheck.carDistanceop===1||dataSource.ChargeShow !== 0){
                    return false
                }else if(dataSource.carDistance===1||dataSource.carDistance===2||dataSource.carDistance===3){
                    return true
                }else{
                    return false
                }
            }
            source: "qrc:/images_1st/Adas/carSpacingModel.png"
        }
        Image {
            id:carDistance5
            x:dataSource.carDistance===1?945:dataSource.carDistance===2?979:dataSource.carDistance===3?1013:0
            y:622
            visible: {if(dataSource.carDistance===0||noCheck.carDistanceop===1||dataSource.ChargeShow !== 0){
                    return false
                }else if(dataSource.carDistance===1||dataSource.carDistance===2||dataSource.carDistance===3){
                    return true
                }else{
                    return false
                }
            }
            source: "qrc:/images_1st/Adas/carSpacingModel.png"
        }
    }

    SequentialAnimation
    {
        id: lighting0
        running: dataSource.fcwFunction === 3
        loops: Animation.Infinite
        NumberAnimation { target: root; property: "imageOpacity0"; from: 1; to: 0; duration: 250 }
        NumberAnimation { target: root; property: "imageOpacity0"; from: 0; to: 1; duration: 250 }
    }

    SequentialAnimation
    {
        id: lighting
        running: dataSource.waterTemperature ===1||dataSource.driverSeatbeltWarning===1||
                 dataSource.passengerSeatbeltWarning===1||dataSource.safetyBelt3===1||dataSource.safetyBelt4===1||
                 dataSource.safetyBelt5===1||dataSource.epbParking===1|| dataSource.epbfault===1||dataSource.espInstructions===1
                 ||dataSource.tirePressureSystemFailure===1||dataSource.engineTheft===1||dataSource.epsPrompt === 1||
                 dataSource.abmAirbag === 1||dataSource.epbfault === 1|| dataSource.steepDescentHdc === 3
                 ||dataSource.waterTemperature === 3||dataSource.fcwFunction === 2||dataSource.aebFunctionIndicator === 3||
                 dataSource.tsrWarning === 3||dataSource.prespeedLimiting === 1||dataSource.prespeedLimiting === 2||dataSource.prespeedLimiting === 3||
                 dataSource.prespeedLimiting === 4||dataSource.prespeedLimiting === 5||dataSource.prespeedLimiting === 6||dataSource.prespeedLimiting === 9
                 ||dataSource.lasIndicatorLight === 3||dataSource.cableConnection === 2
        loops: Animation.Infinite
        NumberAnimation { target: root; property: "imageOpacity"; from: 1; to: 0; duration: 500 }
        NumberAnimation { target: root; property: "imageOpacity"; from: 0; to: 1; duration: 500 }
    }

    SequentialAnimation
    {
        id: lighting1
        running: dataSource.aebFunctionIndicator === 1
        loops: Animation.Infinite
        NumberAnimation { target: root; property: "imageOpacity1"; from: 1; to: 0; duration: 125 }
        NumberAnimation { target: root; property: "imageOpacity1"; from: 0; to: 1; duration: 125 }
    }

    Component.onCompleted: {
        if (qmlid === 0) {
            checkid=1;
            checktimer.restart()
        }
    }

    /*
     * 水、油表自检在水、油表各自qml模块中，如需修改请前往水、油表qml模块。
     */

}
