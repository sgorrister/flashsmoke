package com.flashsmoke.kursova2.exception;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    /*@ExceptionHandler(ChangeSetPersister.NotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ModelAndView handleNotFoundException(ChangeSetPersister.NotFoundException ex) {
        ModelAndView modelAndView = new ModelAndView("error");
        modelAndView.addObject("errorMessage", "The requested resource was not found");

        // Додатковий код для обробки винятку NotFoundException тут
        // Наприклад:
        logger.error("Requested resource not found: " + ex.getMessage());

        return modelAndView;
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ModelAndView handleValidationException(MethodArgumentNotValidException ex) {
        ModelAndView modelAndView = new ModelAndView("error");
        modelAndView.addObject("errorMessage", "Invalid data submitted");

        StringBuilder errors = new StringBuilder();
        for (FieldError error : ex.getBindingResult().getFieldErrors()) {
            errors.append(error.getField()).append(": ").append(error.getDefaultMessage()).append("; ");
        }

        modelAndView.addObject("validationErrors", errors.toString());
        // Додайте код для обробки винятку MethodArgumentNotValidException тут
        return modelAndView;
    }

    // Додайте інші методи обробки винятків, які вам потрібні

    */@ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ResponseEntity<ErrorDto> handleException(Exception ex) {
        return ResponseEntity.internalServerError().body(new ErrorDto(ex.getMessage()));

    }
    @AllArgsConstructor
    private static class ErrorDto{
        private String message;
    }
}
