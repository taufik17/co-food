<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_login extends CI_model {
	public function getloginadmin($u,$p)
	{
		$pwd = hash('sha512', $p . config_item('encryption_key'));
		$this->db->where('username',$u);
        $this->db->where('password',$pwd);
		$query = $this->db->get('user');
		if($query->num_rows()>0)
		{
			foreach ($query->result() as $row)
			{
				if ($row->role_user == 1) {
					$session_admin = array('username_admin'	=> $row->username,
								  'password'	=> $row->password);
					$this->session->set_userdata($session_admin);
					$output['message'] = 'Masuk. Silahkan tunggu...';
				}
			}
		}
			else{
				$output['error'] = true;
				$output['message'] = 'Masuk gagal. Email atau password salah';
			}
			echo json_encode($output);
	}

	public function hash($string)
    {
        return hash('sha512', $string . config_item('encryption_key'));
    }

}
