package org.autoescola.sae.validation;

import org.autoescola.sae.models.Aluno;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class AlunoValidation implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Aluno.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "nome", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "sobrenome", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "rua", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "cpf", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "bairro", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "cidade", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "identidade", "field.required");
		
		Aluno aluno = (Aluno) target;
		if(aluno.getNumero() <= 0) {
			errors.rejectValue("numero", "field.required");
		}
		
	}
}
