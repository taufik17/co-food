<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {    
	public function index()
	{
		$session_admin = $this->session->userdata('username_admin');
		$isi['title'] = "Co-Food | Admin Login";
		if(!empty($session_admin))
		{
			redirect('admin/dashboard');
		}else {
			$this->load->view('admin/v_login', $isi);
		}
    }

    function login(){
		$u = $this->input->post('username');
		$p = $this->input->post('password');
		$this->load->model('model_login');
		$this->model_userlogin->getloginadmin($u, $p);
	}
    
    function dashboard(){
		$this->model_keamanan->getkeamananadmin();
		$isi['title'] = "Co-Food | Admin Dashboard";
		$this->load->view('admin/v_dashboard',$isi);
    }

    function logout(){
		$this->session->sess_destroy();
		$this->session->unset_userdata($sess_admin);
		redirect('Admin');
	}
    
}
