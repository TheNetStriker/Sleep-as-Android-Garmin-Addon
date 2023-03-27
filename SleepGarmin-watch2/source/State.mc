using Toybox.System;
using Toybox.WatchUi;

class State {

	private var batchSize = 1;
	var deliveryInProgress = false;
    var deliveryErrorCount = 0;
    var deliveryPauseCount = 0;
	var lastTransmitTs = 0;
	var lastMinute = -1;
		
	var doingHint = false;
	var doingAlarm = false;
	var tracking = false;
	
	var screenLocked = true;
	var screenLockedAt = 0;
	
	var onTrackingScreen = true;
	
	var currentTime;
	var alarmTime = "--:--";
	
	var httpCommunicationMode = false; // Tracks how we currently communicate with the phone
	
	function initialize() {
		//DebugManager.log("State initialized");
		updateTime();
	}
	
	function setBatchSize(batchSize) {
		self.batchSize = batchSize;
	}
	
	function getBatchSize() {
		return self.batchSize;
	}
	
	function canGrabAttention() {
		return !self.doingHint && !self.doingAlarm;
	}
	
	function updateTime() {
        var now = System.getClockTime();

		if (lastMinute != now.min) {
			currentTime = now.hour + ":" + now.min.format("%02d");	
			lastMinute = now.min;

			return true;
		}

		return false;
	}
	
	function updateAlarmTime(time) {
		self.alarmTime = time;
	}
	
	function isAlarmRunning() {
		return self.doingAlarm;
	}

	function updateIsAlarmRunning(isAlarmRunning) {
		self.doingAlarm = isAlarmRunning;
	}
	
	function isHttpCommunicationMode() {
		return self.httpCommunicationMode;
	}
}