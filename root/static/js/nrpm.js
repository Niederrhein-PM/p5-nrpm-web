//
// Startup routine
//
$(function() {

	// All external links in new window
	$("a[href^='http']").each(function(){
		if(this.href.indexOf(location.hostname) == -1) {
			$(this).attr('target', '_blank');
		}
	});

});