/* ----------------------------------
jQuery Timelinr 0.9.3

tested with jQuery v1.6+
©2011 CSSLab.cl
free for any use, of course... :D
instructions: http://www.csslab.cl/2011/08/18/jquery-timelinr/
---------------------------------- */
jQuery.fn.timelinr = function(options){
	// default plugin settings
	settings = jQuery.extend({
		orientation: 				'horizontal',		// value: horizontal | vertical, default to horizontal
		containerDiv: 				'#timeline',		// value: any HTML tag or #id, default to #timeline
		datesDiv: 					'#dates',			// value: any HTML tag or #id, default to #dates
		datesSelectedClass: 		'selected',			// value: any class, default to selected
		datesSpeed: 				500,				// value: integer between 100 and 1000 (recommended), default to 500 (normal)
		lrzj_lineDiv: 					'#lrzj_line',			// value: any HTML tag or #id, default to #lrzj_line
		lrzj_lineSelectedClass: 		'selected',			// value: any class, default to selected
		lrzj_lineSpeed: 				200,				// value: integer between 100 and 1000 (recommended), default to 200 (fast)
		lrzj_lineTransparency: 		0.2,				// value: integer between 0 and 1 (recommended), default to 0.2
		lrzj_lineTransparencySpeed: 	500,				// value: integer between 100 and 1000 (recommended), default to 500 (normal)
		prevButton: 				'#prev',			// value: any HTML tag or #id, default to #prev
		nextButton: 				'#next',			// value: any HTML tag or #id, default to #next
		arrowKeys: 					'false',			// value: true/false, default to false
		startAt: 					1					// value: integer, default to 1 (first)
	}, options);

	$(function(){
		// setting variables... many of them
		var howManyDates = $(settings.datesDiv+' li').length;
		var howManylrzj_line = $(settings.lrzj_lineDiv+' li').length;
		var currentDate = $(settings.datesDiv).find('a.'+settings.datesSelectedClass);
		var currentIssue = $(settings.lrzj_lineDiv).find('li.'+settings.lrzj_lineSelectedClass);
		var widthContainer = $(settings.containerDiv).width();
		var heightContainer = $(settings.containerDiv).height();
		var widthlrzj_line = $(settings.lrzj_lineDiv).width();
		var heightlrzj_line = $(settings.lrzj_lineDiv).height();
		var widthIssue = $(settings.lrzj_lineDiv+' li').width();
		var heightIssue = $(settings.lrzj_lineDiv+' li').height();
		var widthDates = $(settings.datesDiv).width();
		var heightDates = $(settings.datesDiv).height();
		var widthDate = $(settings.datesDiv+' li').width();
		var heightDate = $(settings.datesDiv+' li').height();
		
		// set positions!
		if(settings.orientation == 'horizontal') {	
			$(settings.lrzj_lineDiv).width(widthIssue*howManylrzj_line);
			$(settings.datesDiv).width(widthDate*howManyDates).css('marginLeft',widthContainer/2-widthDate/2);
			var defaultPositionDates = parseInt($(settings.datesDiv).css('marginLeft').substring(0,$(settings.datesDiv).css('marginLeft').indexOf('px')));
		} else if(settings.orientation == 'vertical') {
			$(settings.lrzj_lineDiv).height(heightIssue*howManylrzj_line);
			$(settings.datesDiv).height(heightDate*howManyDates).css('marginTop',heightContainer/2-heightDate/2);
			var defaultPositionDates = parseInt($(settings.datesDiv).css('marginTop').substring(0,$(settings.datesDiv).css('marginTop').indexOf('px')));
		}
		/* 代码整理：懒人之家 www.lanrenzhijia.com  转载请注明出处 */
		$(settings.datesDiv+' a').click(function(event){
			event.preventDefault();
			// first vars
			var whichIssue = $(this).text();
			var currentIndex = $(this).parent().prevAll().length;

			// moving the elements
			if(settings.orientation == 'horizontal') {
				$(settings.lrzj_lineDiv).animate({'marginLeft':-widthIssue*currentIndex},{queue:false, duration:settings.lrzj_lineSpeed});
			} else if(settings.orientation == 'vertical') {
				$(settings.lrzj_lineDiv).animate({'marginTop':-heightIssue*currentIndex},{queue:false, duration:settings.lrzj_lineSpeed});
			}
			$(settings.lrzj_lineDiv+' li').animate({'opacity':settings.lrzj_lineTransparency},{queue:false, duration:settings.lrzj_lineSpeed}).removeClass(settings.lrzj_lineSelectedClass).eq(currentIndex).addClass(settings.lrzj_lineSelectedClass).fadeTo(settings.lrzj_lineTransparencySpeed,1);
			
			// now moving the dates
			$(settings.datesDiv+' a').removeClass(settings.datesSelectedClass);
			$(this).addClass(settings.datesSelectedClass);
			if(settings.orientation == 'horizontal') {
				$(settings.datesDiv).animate({'marginLeft':defaultPositionDates-(widthDate*currentIndex)},{queue:false, duration:settings.datesSpeed});
			} else if(settings.orientation == 'vertical') {
				$(settings.datesDiv).animate({'marginTop':defaultPositionDates-(heightDate*currentIndex)},{queue:false, duration:settings.datesSpeed});
			}
		});
/* 代码整理：懒人之家 www.lanrenzhijia.com  转载请注明出处 */
		$(settings.nextButton).bind('click', function(event){
			event.preventDefault();
			if(settings.orientation == 'horizontal') {
				var currentPositionlrzj_line = parseInt($(settings.lrzj_lineDiv).css('marginLeft').substring(0,$(settings.lrzj_lineDiv).css('marginLeft').indexOf('px')));
				var currentIssueIndex = currentPositionlrzj_line/widthIssue;
				var currentPositionDates = parseInt($(settings.datesDiv).css('marginLeft').substring(0,$(settings.datesDiv).css('marginLeft').indexOf('px')));
				var currentIssueDate = currentPositionDates-widthDate;
				if(currentPositionlrzj_line <= -(widthIssue*howManylrzj_line-(widthIssue))) {
					$(settings.lrzj_lineDiv).stop();
					$(settings.datesDiv+' li:last-child a').click();
				} else {
					if (!$(settings.lrzj_lineDiv).is(':animated')) {
						$(settings.lrzj_lineDiv).animate({'marginLeft':currentPositionlrzj_line-widthIssue},{queue:false, duration:settings.lrzj_lineSpeed});
						$(settings.lrzj_lineDiv+' li').animate({'opacity':settings.lrzj_lineTransparency},{queue:false, duration:settings.lrzj_lineSpeed});
						$(settings.lrzj_lineDiv+' li.'+settings.lrzj_lineSelectedClass).removeClass(settings.lrzj_lineSelectedClass).next().fadeTo(settings.lrzj_lineTransparencySpeed, 1).addClass(settings.lrzj_lineSelectedClass);
						$(settings.datesDiv).animate({'marginLeft':currentIssueDate},{queue:false, duration:settings.datesSpeed});
						$(settings.datesDiv+' a.'+settings.datesSelectedClass).removeClass(settings.datesSelectedClass).parent().next().children().addClass(settings.datesSelectedClass);
					}
				}
			} else if(settings.orientation == 'vertical') {
				var currentPositionlrzj_line = parseInt($(settings.lrzj_lineDiv).css('marginTop').substring(0,$(settings.lrzj_lineDiv).css('marginTop').indexOf('px')));
				var currentIssueIndex = currentPositionlrzj_line/heightIssue;
				var currentPositionDates = parseInt($(settings.datesDiv).css('marginTop').substring(0,$(settings.datesDiv).css('marginTop').indexOf('px')));
				var currentIssueDate = currentPositionDates-heightDate;
				if(currentPositionlrzj_line <= -(heightIssue*howManylrzj_line-(heightIssue))) {
					$(settings.lrzj_lineDiv).stop();
					$(settings.datesDiv+' li:last-child a').click();
				} else {
					if (!$(settings.lrzj_lineDiv).is(':animated')) {
						$(settings.lrzj_lineDiv).animate({'marginTop':currentPositionlrzj_line-heightIssue},{queue:false, duration:settings.lrzj_lineSpeed});
						$(settings.lrzj_lineDiv+' li').animate({'opacity':settings.lrzj_lineTransparency},{queue:false, duration:settings.lrzj_lineSpeed});
						$(settings.lrzj_lineDiv+' li.'+settings.lrzj_lineSelectedClass).removeClass(settings.lrzj_lineSelectedClass).next().fadeTo(settings.lrzj_lineTransparencySpeed, 1).addClass(settings.lrzj_lineSelectedClass);
						$(settings.datesDiv).animate({'marginTop':currentIssueDate},{queue:false, duration:settings.datesSpeed});
						$(settings.datesDiv+' a.'+settings.datesSelectedClass).removeClass(settings.datesSelectedClass).parent().next().children().addClass(settings.datesSelectedClass);
					}
				}
			}
		});
/* 代码整理：懒人之家 www.lanrenzhijia.com  转载请注明出处 */
		$(settings.prevButton).click(function(event){
			event.preventDefault();
			if(settings.orientation == 'horizontal') {
				var currentPositionlrzj_line = parseInt($(settings.lrzj_lineDiv).css('marginLeft').substring(0,$(settings.lrzj_lineDiv).css('marginLeft').indexOf('px')));
				var currentIssueIndex = currentPositionlrzj_line/widthIssue;
				var currentPositionDates = parseInt($(settings.datesDiv).css('marginLeft').substring(0,$(settings.datesDiv).css('marginLeft').indexOf('px')));
				var currentIssueDate = currentPositionDates+widthDate;
				if(currentPositionlrzj_line >= 0) {
					$(settings.lrzj_lineDiv).stop();
					$(settings.datesDiv+' li:first-child a').click();
				} else {
					if (!$(settings.lrzj_lineDiv).is(':animated')) {
						$(settings.lrzj_lineDiv).animate({'marginLeft':currentPositionlrzj_line+widthIssue},{queue:false, duration:settings.lrzj_lineSpeed});
						$(settings.lrzj_lineDiv+' li').animate({'opacity':settings.lrzj_lineTransparency},{queue:false, duration:settings.lrzj_lineSpeed});
						$(settings.lrzj_lineDiv+' li.'+settings.lrzj_lineSelectedClass).removeClass(settings.lrzj_lineSelectedClass).prev().fadeTo(settings.lrzj_lineTransparencySpeed, 1).addClass(settings.lrzj_lineSelectedClass);
						$(settings.datesDiv).animate({'marginLeft':currentIssueDate},{queue:false, duration:settings.datesSpeed});
						$(settings.datesDiv+' a.'+settings.datesSelectedClass).removeClass(settings.datesSelectedClass).parent().prev().children().addClass(settings.datesSelectedClass);
					}
				}
			} else if(settings.orientation == 'vertical') {
				var currentPositionlrzj_line = parseInt($(settings.lrzj_lineDiv).css('marginTop').substring(0,$(settings.lrzj_lineDiv).css('marginTop').indexOf('px')));
				var currentIssueIndex = currentPositionlrzj_line/heightIssue;
				var currentPositionDates = parseInt($(settings.datesDiv).css('marginTop').substring(0,$(settings.datesDiv).css('marginTop').indexOf('px')));
				var currentIssueDate = currentPositionDates+heightDate;
				if(currentPositionlrzj_line >= 0) {
					$(settings.lrzj_lineDiv).stop();
					$(settings.datesDiv+' li:first-child a').click();
				} else {
					if (!$(settings.lrzj_lineDiv).is(':animated')) {
						$(settings.lrzj_lineDiv).animate({'marginTop':currentPositionlrzj_line+heightIssue},{queue:false, duration:settings.lrzj_lineSpeed});
						$(settings.lrzj_lineDiv+' li').animate({'opacity':settings.lrzj_lineTransparency},{queue:false, duration:settings.lrzj_lineSpeed});
						$(settings.lrzj_lineDiv+' li.'+settings.lrzj_lineSelectedClass).removeClass(settings.lrzj_lineSelectedClass).prev().fadeTo(settings.lrzj_lineTransparencySpeed, 1).addClass(settings.lrzj_lineSelectedClass);
						$(settings.datesDiv).animate({'marginTop':currentIssueDate},{queue:false, duration:settings.datesSpeed},{queue:false, duration:settings.lrzj_lineSpeed});
						$(settings.datesDiv+' a.'+settings.datesSelectedClass).removeClass(settings.datesSelectedClass).parent().prev().children().addClass(settings.datesSelectedClass);
					}
				}
			}
		});
		/* 代码整理：懒人之家 www.lanrenzhijia.com  转载请注明出处 */
		// keyboard navigation, added since 0.9.1
		if(settings.arrowKeys=='true') {
			if(settings.orientation=='horizontal') {
				$(document).keydown(function(event){
					if (event.keyCode == 39) { 
				       $(settings.nextButton).click();
				    }
					if (event.keyCode == 37) { 
				       $(settings.prevButton).click();
				    }
				});
			} else if(settings.orientation=='vertical') {
				$(document).keydown(function(event){
					if (event.keyCode == 40) { 
				       $(settings.nextButton).click();
				    }
					if (event.keyCode == 38) { 
				       $(settings.prevButton).click();
				    }
				});
			}
		}
		/* 代码整理：懒人之家 www.lanrenzhijia.com  转载请注明出处 */
		// default position startAt, added since 0.9.3
		$(settings.datesDiv+' li').eq(settings.startAt-1).find('a').trigger('click');

	});

};
/* 代码整理：懒人之家 www.lanrenzhijia.com  转载请注明出处 */