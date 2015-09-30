function addGalImageFormOnFileSelect(){
	$('.gal_image_upload_field').change(function(){
		var all_full = true;
		$('.gal_image_upload_field').each(function(){
			if($(this).val() == ''){
				all_full = false;
			}	
		});
		
		if(all_full){
			$('.gal_image').not('.full').addClass('full');
			addBlankFarmGalImageForm();
			addGalImageFormOnRemoteUrlSelect();
		}
	});	
}

function addGalImageFormOnRemoteUrlSelect(){
	
}

function addBlankFarmGalImageForm(){		
	var new_id = new Date().getTime();
	var reg = new RegExp("new_gal_image", "g");
	
	$('#gal_image_row').prepend(blankFarmGalImageForm().replace(reg, new_id)).hide().fadeIn(1000);
	addGalImageFormOnFileSelect();
}