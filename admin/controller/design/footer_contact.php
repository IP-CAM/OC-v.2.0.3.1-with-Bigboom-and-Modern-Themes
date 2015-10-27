<?php 
	class ControllerDesignFooterContact extends Controller{
		public function index(){	
			$this->load->model('localisation/language');
			$this->load->model('design/footer_contact')	;


			$languages=$this->model_localisation_language->getLanguages();	
			$language_id=array();

			foreach ($languages as $language) {

				$this->model_design_footer_contact->addContact($language['language_id']);			

				array_push($language_id, $language['language_id']);
			}		

			$contact_info	=	$this->model_design_footer_contact->getContactInfo();	

			$data['heading_title']		=	"Contact Info";
			$data['entry_phone']		=	"Phone number";
			$data['entry_contact']		=	"Contact info";
			$data['footer_logo']		=	"Footer logo";
			$data['text_slogan']		=	"Footer slogan";
			$data['text_information']	= 	"Information";
			$data['entry_footer_text']	=	"Footer text";

			$data['button_save']=$this->language->get('button_save');
			$data['button_cancel']=$this->language->get('button_cancel');

			if($this->request->server['REQUEST_METHOD']=='POST'){				
				$this->model_design_footer_contact->editContact($this->request->post);
			}

			$this->load->model('localisation/language');
			$data['languages'] = $this->model_localisation_language->getLanguages();

			$this->load->model('tool/image');		

			if(isset($this->request->post['info'])){				
				$info=$this->request->post['info'];	
			}
			else if(!empty($contact_info)){
				$info=$contact_info;
			}
			else{
				$info	=array();
			}
			$data['placeholder']=$this->model_tool_image->resize('no_image.png',50,50);		

			$ypn=array();	
			foreach ($info as  $d) {				
				if(isset($d['footer_logo'])&&is_file(DIR_IMAGE.$d['footer_logo'])){	
					$image=$this->model_tool_image->resize($d['footer_logo'],50,50);
					$icon_image=$d['footer_logo'];
				}
				
				else{	
					$image=$this->model_tool_image->resize('no_image.png',50,50);
					$icon_image='';
				}

				$ypn[]=array(
					'footer_logo'	=>$image,
					'footer_slogan'	=>$d['footer_slogan'],
					'contact_info'	=>$d['contact_info'],
					'icon_image'	=>$icon_image,
					'footer_text'	=>$d['footer_text']
				);				
			}		
			//print_r($ypn);die;
			$data['info'] =array_combine($language_id, $ypn);
			//print_r($data['info']);die;

			$data['action'] =$this->url->link('design/footer_contact','token='.$this->session->data['token'],'SSL');

			$data['header']			=	$this->load->controller('common/header');
			$data['column_left']	=	$this->load->controller('common/column_left');
			$data['footer']			=	$this->load->controller('common/footer');
			$this->response->setOutput($this->load->view('design/footer_contact.tpl',$data));
		}
	}
 ?>