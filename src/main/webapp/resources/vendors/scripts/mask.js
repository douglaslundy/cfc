/* Máscaras ER */
function mascara(o,f){
	v_obj=o
	v_fun=f
	setTimeout("execmascara()",1)
	}

	function execmascara(){
	v_obj.value=v_fun(v_obj.value)
	}

	function leech(v){
	v=v.replace(/o/gi,"0")
	v=v.replace(/i/gi,"1")
	v=v.replace(/z/gi,"2")
	v=v.replace(/e/gi,"3")
	v=v.replace(/a/gi,"4")
	v=v.replace(/s/gi,"5")
	v=v.replace(/t/gi,"7")
	return v
	}

	function soNumeros(v){
	return v.replace(/\D/g,"")
	}
	
	function moeda(v){
	v=v.replace(/\D/g,"") // permite digitar apenas numero
	v=v.replace(/(\d{1})(\d{15})$/,"$1.$2") // coloca ponto antes dos ultimos digitos
	v=v.replace(/(\d{1})(\d{11})$/,"$1.$2") // coloca ponto antes dos ultimos 13 digitos
	v=v.replace(/(\d{1})(\d{8})$/,"$1.$2") // coloca ponto antes dos ultimos 10 digitos
	v=v.replace(/(\d{1})(\d{5})$/,"$1.$2") // coloca ponto antes dos ultimos 7 digitos
	v=v.replace(/(\d{1})(\d{1,2})$/,"$1,$2") // coloca virgula antes dos ultimos 4 digitos
	return v;
	}
	
	function mtelefone(v){
	    v=v.replace(/\D/g,"");             //Remove tudo o que não é dígito
		v=v.replace(/(\d{1})(\d{10})$/,"($1$2") // coloca ponto antes dos ultimos digitos
		v=v.replace(/(\d{1})(\d{9})$/,"$1)$2") // coloca ponto antes dos ultimos digitos
		v=v.replace(/(\d{1})(\d{4})$/,"$1-$2") // coloca ponto antes dos ultimos digitos
	    return v;
	}

	function mcpf(v){
		v=v.replace(/\D/g,"") // permite digitar apenas numero		
		v=v.replace(/(\d{1})(\d{8})$/,"$1.$2") // coloca ponto antes dos ultimos digitos
		v=v.replace(/(\d{1})(\d{5})$/,"$1.$2") // coloca ponto antes dos ultimos digitos
		v=v.replace(/(\d{1})(\d{2})$/,"$1-$2") // coloca ponto antes dos ultimos digitos
		return v;
	}
	
	function mdata(v){
		v=v.replace(/\D/g,"") // permite digitar apenas numero		
		v=v.replace(/(\d{1})(\d{6})$/,"$1/$2") // coloca ponto antes dos ultimos digitos
		v=v.replace(/(\d{1})(\d{4})$/,"$1/$2") // coloca ponto antes dos ultimos digitos
		return v;
	}
	
