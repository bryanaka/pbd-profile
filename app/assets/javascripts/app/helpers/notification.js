// this needs to get turned into a cool notification function
(function(){
	var $flash = $('.flash_notice');
	$(function(){
		if ($flash !== []){
			setTimeout(function(){
				$flash.slideUp(600);
			}, 3000);
		}
	});
})();

// Notifier is going to be an object that generates rails style notifications
// then kills them after a given amount of time
App.Helpers = {};
App.Helpers.Notifier = function () {
	var that = this;
	// this.template should accept a template
	// this.container should be jquery selector
	// this.childClass should be a class
	this.create = function (notificationType, message) {
		var $notificationBar = $('#notificationBar'),
			$notifications = $('.notification__item');

		function notificationItemTemplate(notificationClassModifier, itemMessage) {
			var id = generateNotificationId(),
				notificationClass = "notification__item--" + notificationClassModifier;
			return '<div id="' + id + '" class="notification__item ' + notificationClass + '">' + itemMessage + '</div>';
		}

		function generateNotificationId() {
			var id = Math.floor( Math.random() * Math.pow(10,5) ).toString();
			return "notification-" + id;
		}

		if ( $notification !== [] ) {
			var html = '',
				notificationClass = '';
			switch (notificationType) {
				case 'warn':
					html = notificationItemTemplate('warn', message);
					$notificationBar.append(html);
					break;
				case 'error':
					html = notificationItemTemplate('error', message);
					$notificationBar.append(html);
					break;
				case 'success':
					html = notificationItemTemplate('success', message);
					$notificationBar.append(html);
					break;
				case 'info':
					html = notificationItemTemplate('info', message);
					$notificationBar.append(html);
					break;
				default:
			}
		}
	};

	this.kill = function (notificationID, speed) {
		var animationSpeed = speed || 600 ;
		$(notificationID).slideUp(animationSpeed, function () {
			this.remove();
		});
	};

	this.defferedKill = function (notificationID, speed, timeout) {
		setTimeout(that.kill(notificationID, speed), timeout);
	};

};
