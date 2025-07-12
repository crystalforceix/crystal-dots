import QtQuick
import Quickshell
import "./../../Settings/"
import "./../../Components/"

Item {
    id: volumeDisplay
    property var shell
    property int volume: 0

    // The total width will match the pill's width
    width: pillIndicator.width
    height: pillIndicator.height

    PillIndicator {
        id: pillIndicator
        icon: volume === 0 ? "volume_off" : (volume < 30 ? "volume_down" : "volume_up")
        text: volume + "%"

        pillColor: Theme.surfaceVariant
        iconCircleColor: Theme.accentPrimary
        iconTextColor: Theme.backgroundPrimary
        textColor: Theme.textPrimary
    }

    Connections {
        target: shell ?? null
        function onVolumeChanged() {
            if (shell && shell.volume !== volume) {
                volume = shell.volume
                pillIndicator.text = volume + "%"
                pillIndicator.icon = volume === 0 ? "volume_off" : (volume < 30 ? "volume_down" : "volume_up")
                pillIndicator.show()
            }
        }
    }

    Component.onCompleted: {
        if (shell && shell.volume !== undefined) {
            volume = shell.volume
            pillIndicator.show()
        }
    }
}
