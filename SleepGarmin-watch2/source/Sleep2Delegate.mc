using Toybox.WatchUi;

class Sleep2Delegate extends WatchUi.BehaviorDelegate {

	var ctx;
	
    function initialize(ctx) {
        BehaviorDelegate.initialize();
        self.ctx = ctx;
    }

    function onMenu() {
    	DebugManager.log("onMenu");
    	if (self.ctx.state.screenLocked) {
    		self.ctx.businessManager.unlockScreen();
    		return true;
    	}
    	
        WatchUi.pushView(new Rez.Menus.MainMenu(), new Sleep2MenuDelegate(self.ctx), WatchUi.SLIDE_UP);
        return true;
    }
    
    function onBack() {
    	return true;
    }
    
    function onKey(keyEvent){
    	var k = keyEvent.getKey();
//    	DebugManager.log("Got key event: " + k);
    	if (k == WatchUi.KEY_ESC || k == WatchUi.KEY_ENTER) { return true; }
    	return false;
    }

}