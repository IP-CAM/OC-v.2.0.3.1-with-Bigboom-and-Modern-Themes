function removeTab(tab_id){	
	$('#table-add-tabs tbody').find('#tab'+tab_id).remove();
	$('#table-add-tabs tbody').find('#hidden'+tab_id).remove();
	$('#table-add-tabs tbody').find('#tab-config'+tab_id).remove();
}
