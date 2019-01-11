$(document).ready( function () {
  $('#awbtable').DataTable();
} );

$('#select').dataTable( {
    "order": [],
    "columnDefs": [ {
      "targets"  : 'no-sort',
      "orderable": false,
    }]
});

