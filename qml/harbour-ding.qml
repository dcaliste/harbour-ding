import QtQuick 2.2
import Sailfish.Silica 1.0
import Nemo.Ngf 1.0
                 
ApplicationWindow
{                    
    initialPage: page

    property int count: 0
          
    Page {      
        id: page
                
        Button {                    
            anchors.centerIn: parent
            text: "Ding !"
            enabled: ding.status != NonGraphicalFeedback.Playing
            onClicked: ding.play()
            // Component.onCompleted: ding.play()
        }
    }

    NonGraphicalFeedback {
        id: ding
        event: "email_exists" // "calendar" //"battery_low" //"email_exists"
        onStatusChanged: {
            if (status == NonGraphicalFeedback.Playing) {
                count += 1
                stop()
            } else if (status == NonGraphicalFeedback.Stopped && count < 10) {
                play()
            }
        }
    }

    Label {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.paddingLarge
        anchors.horizontalCenter: parent.horizontalCenter
        text: count
    }
}

