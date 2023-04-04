<?php
    require_once 'DataBase.php';
    class Usuario{
        private $id; 
        private $email; 
        private $senha; 
        private $nome; 
        private $foto; 
        private $tel; 
        private $endereco; 
        private $cpf; 
        private $creation_time; 
        private $modification_time;
        
        public function getId() {
            return $this->id;
        }

        public function getEmail() {
            return $this->email;
        }

        public function setEmail($email) {
            $this->email = $email;
        }

        public function getSenha() {
            return $this->senha;
        }

        public function setSenha($senha) {
            $this->senha = $senha;
        }

        public function getNome() {
            return $this->nome;
        }

        public function setNome($nome) {
            $this->nome = $nome;
        }

        public function getFoto() {
            return $this->foto;
        }

        public function setFoto($foto) {
            $this->foto = $foto;
        }

        public function getTelefone() {
            return $this->tel;
        }

        public function setTelefone($tel) {
            $this->tel = $tel;
        }

        public function getEndereco() {
            return $this->endereco;
        }

        public function setEndereco($endereco) {
            $this->endereco = $endereco;
        }

        public function getCpf() {
            return $this->cpf;
        }

        public function setCpf($cpf) {
            $this->cpf = $cpf;
        }

        public function getCreationTime() {
            return $this->creation_time;
        }

        public function setCreationTime($creation_time) {
            $this->creation_time = $creation_time;
        }

        public function getModificationTime() {
            return $this->modification_time;
        }

        public function setModificationTime($modification_time) {
            $this->modification_time = $modification_time;
        }

        
    }