function profileCard() { $(document).ready(function() {
  $(".btn-pref1 .btn").click(function () {
      console.log("hi");
      $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
      // $(".tab").addClass("active"); // instead of this do the below
      $(this).removeClass("btn-default").addClass("btn-primary");
  });
  });
}

export { profileCard }
