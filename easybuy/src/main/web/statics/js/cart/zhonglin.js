$(document).ready(function() {
		/*数量加减*/
	$(".mid-sl .sl-right").click(function(event) {
		var vl = $(this).siblings("input").val();
		var dj = $(this).parent().siblings(".mid-dj").children('span').text();
		if (vl>0) {
			vl++;
			$(this).siblings("input").val(vl);
			$(this).parent().siblings(".mid-je").children('span').text(dj*vl);
		}
	});
	$(".mid-sl .sl-left").click(function(event) {
		var vl = $(this).siblings("input").val();
		var dj = $(this).parent().siblings(".mid-dj").children('span').text();
		if (vl>1) {
			vl--;
			$(this).siblings("input").val(vl);
			$(this).parent().siblings(".mid-je").children('span').text(dj*vl);
		}
	});






});


	







