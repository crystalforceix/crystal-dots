//@ pragma UseQApplication
import qtQuick
import Quickshell
import "./clients/bar/"

shellroot{
    id: root
    
    

    Loader {
	active: true
	sourceComponent: bar{}
    }


}
