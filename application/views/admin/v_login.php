<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?= $title; ?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?= base_url()?>assets/admin/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="<?= base_url()?>assets/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?= base_url()?>assets/admin/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="<?= base_url() ?>a_login"> <img src="<?= base_url() ?>assets/images/logo.png" alt="" width=150px;> </a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Login Admin</p>

        <div id="responseDiv3" class="alert alert-danger alert-mg-b" style="margin-left:20px; margin-right:20px;  display:none;">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">×</span>
            </button>
            <span id="message3"></span>
        </div>

      <form id="admin_login">
        <div class="input-group mb-3">
          <input type="text" name="username" class="form-control" placeholder="Username" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="password" class="form-control" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                Remember Me
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block"><span id="button_login"></span></button>
          </div>
          <!-- /.col -->
        </div>
      </form>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="<?= base_url()?>assets/admin/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src=".<?= base_url()?>assets/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<?= base_url()?>assets/admin/dist/js/adminlte.min.js"></script>



<script type="text/javascript">
$(document).ready(function(){
    var loader = '<?php echo base_url(); ?>assets/images/login.gif';
    $('#button_login').html('<i class="fa fa-sign-in"></i>&nbspMasuk');
    $('#admin_login').submit(function(e){
        e.preventDefault();
        $('#button_login').html('<img src="'+loader+'" width="30" height="30">...');
        var url = '<?php echo base_url(); ?>';
        var user = $('#admin_login').serialize();
        var login = function(){
            $.ajax({
                type: 'POST',
                url: url + 'admin/login',
                dataType: 'json',
                data: user,
                success:function(response){
                    $('#message3').html(response.message);
                    $('#button_login').html('<i class="fa fa-sign-in"></i>&nbspMasuk');
                    if(response.error){
                        $('#responseDiv3').removeClass('alert-success').addClass('alert-danger').show()
                    }
                    else{
                        $('#responseDiv3').removeClass('alert-danger').addClass('alert-success').show();
                        $('#admin_login')[0].reset();
                        setTimeout(function(){
                            location.href = "Admin/Dashboard";
                        }, 1000);
                    }
                }
            });
        };
        setTimeout(login, 1000);
    });
    $(document).on('click', '#clearMsg', function(){
        $('#responseDiv').hide();
    });
});
</script>

</body>
</html>
