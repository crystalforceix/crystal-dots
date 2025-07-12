import QtQuick
import Quickshell
import Quickshell.Wayland
import Qt5Compat.GraphicalEffects
import "./../Helpers/"
import "./../Settings/"

ShellRoot {
    property string wallpaperSource: Settings.currentWallpaper !== "" ? Settings.currentWallpaper : "/home/lysec/nixos/assets/wallpapers/lantern.png"
    PanelWindow {
        anchors {
            top: true
            bottom: true
            right: true
            left: true
        }
        color: "transparent"
        WlrLayershell.layer: WlrLayer.Background
        WlrLayershell.exclusionMode: ExclusionMode.Ignore
        WlrLayershell.namespace: "quickshell-overview"
        Image {
            id: bgImage
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: wallpaperSource
            cache: true
            smooth: true
            visible: true // Show the original for FastBlur input
        }
        FastBlur {
            anchors.fill: parent
            source: bgImage
            radius: 24 // Adjust blur strength as needed
            transparentBorder: true
        }
    }
}
