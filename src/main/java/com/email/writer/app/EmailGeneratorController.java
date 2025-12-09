package com.email.writer.app;

import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

//@CrossOrigin(origins = "https://aaadil123.github.io")
@CrossOrigin
@RestController
@RequestMapping("/api/email")
@AllArgsConstructor
public class EmailGeneratorController   {

    private final EmailGeneratorService
            emailGeneratorService;

    @RequestMapping(value = "/generate", method = RequestMethod.OPTIONS)
    public ResponseEntity<?> handleOptions() {
        return ResponseEntity.ok().build();
    }

    @PostMapping("/generate")
    public ResponseEntity<String> generateEmail(@RequestBody EmailRequest emailRequest){
        String response = emailGeneratorService.generateEmailReply(emailRequest);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/test")
    public String test() {
        return "Working!";
    }

}
