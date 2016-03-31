$(document).ready(function() {

    $('.butt').on('click', function () {
      swal({   title: "Hang on!",   text: "You are the only group admin. Please make one of your friends a group admin before leaving this group.",   type: "error",   confirmButtonText: "OK" });
    });

    // $('.delete_event').on('click', function () {
    //   swal({   title: "Are you sure?",   text: "Deleting this event is permanent.",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Yes, delete it!",   closeOnConfirm: false }, function(){
    //      swal("Deleted!", "Your imaginary file has been deleted.", "success");
    //   });
    // });




})
