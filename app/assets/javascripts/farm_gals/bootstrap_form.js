//= require farm_shed/all
//= require jquery-ui/sortable

function showUploadFromComputerGroup(group){
	$(group).find('.upload_from_computer_link').click(function(e){
		e.preventDefault();
		$(this).closest('.upload_from_url_group').hide(0, function(){
			$(this).closest('.gal_image_row').find('.upload_from_computer_group').show(200);	
		});
	});
}

function showUploadFromUrlGroup(group){
	$(group).find('.upload_from_url_link').click(function(e){
		e.preventDefault();
		$(this).closest('.upload_from_computer_group').hide(0, function(){
			$(this).closest('.gal_image_row').find('.upload_from_url_group').show(200);
		});
	});
}

function toggleUploadGroups(){
	var g = $('.gal_image_row');
	
	for(var i = 0; i < g.length; i++){
		toggleUploadGroup(g[i], 'computer');
	}
}

function toggleUploadGroup(group, initial_state){
	if(initial_state === 'computer'){
		$(group).find('.upload_from_url_group').hide();
		$(group).find('.upload_from_computer_group').show();		
	} else if(initial_state === 'url'){
		$('.upload_from_computer_group').hide();
		$('.upload_from_url_group').show();
	} else {
		throw 'initial_state must be "computer" or "url". Not: ' + initial_state;	
	}
	showUploadFromUrlGroup(group);
	showUploadFromComputerGroup(group);
}

function _addInvoiceItemRow(){
	var last_row = $('.gal_image_row').last();
	var row = last_row.clone();
	var index = new Date().getTime();
	row.html(row.html().replace(/_gal_attributes_gal_images_attributes_\d+_/g, '_gal_attributes_gal_images_attributes_' + index + '_'));
	row.html(row.html().replace(/\[gal_attributes\]\[gal_images_attributes\]\[\d+\]/g, '[gal_attributes][gal_images_attributes][' + index + ']'));
		
	$(row).insertAfter(last_row);	
	addInvoiceItemRowOnChange(row);
	return row;	
}

function addInvoiceItemRowOnChange(row){
	$(row).find('.upload_field').change(function(){
		
		if($(this).val() != false){
			var row = _addInvoiceItemRow();
			
			// need to refresh this behavior
			toggleUploadGroup($(row), "computer");	
			resetGalImageOrder();
		}
			
	});
}

function addInvoiceItemRows(){
	var rows = $('.gal_image_row');
	
	for(var i = 0; i < rows.length; i++){
		addInvoiceItemRowOnChange(rows[i]);		
	}
}

function prepareBootstrapForm(){
	toggleUploadGroups();
	var last_row = $('.gal_image_row').last();
	addInvoiceItemRowOnChange(last_row);
	activateSectionCloser('#bulk_uploader_row', '#bulk_uploader_closer');
	resetGalImageOrder();
	makeGalImageRowsSortable();
}
