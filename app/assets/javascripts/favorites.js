jQuery(function($) {

	$(".deleteFavorite").click( function() {
		var current_favorite_tr = $(this).parents('tr')[0];
		if(confirm("Точно удалить?")) {
			$.ajax({
				url: '/favorites/' + $(current_favorite_tr).attr('data-favorite_id1'),
				type: 'POST' ,
				data: { _method: 'destroyRef'},
				success: function() {
					$(current_favorite_tr).fadeOut(200);
				}
			});
		};

	});


});