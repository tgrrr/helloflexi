jQuery(document).ready(function($) {
	if($('#infinite-scrolling').size() > 0)
	{
		$('.pagination').hide();
	    $(window).scroll(function(){
	      	more_posts_url = $('.pagination a.next_page').attr('href');
	        if(more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 250){
	        	$('.pagination-loading').html('Loading...');
	            $.getScript(more_posts_url);
	        }
	  		return;
	  	});
	}
})

