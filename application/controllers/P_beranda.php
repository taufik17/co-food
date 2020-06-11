<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class P_beranda extends CI_Controller {
	public function index()
	{
		$this->load->view('publik/v_beranda');
	}
}
