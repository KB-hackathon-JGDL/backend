package org.jgdlbe.example.controller;

import java.util.UUID;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.annotations.Parameter;
import org.jgdlbe.common.exception.BindingErrorException;
import org.jgdlbe.example.dto.ExampleCreateDTO;
import org.jgdlbe.example.dto.ExampleDTO;
import org.jgdlbe.example.dto.ExampleFilterDTO;
import org.jgdlbe.example.dto.ExampleUpdateDTO;
import org.jgdlbe.example.service.ExampleService;
import org.springframework.data.domain.Page;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
@Slf4j
public class ExampleController {

    private final ExampleService exampleService;

    @GetMapping("/examples/{exampleId}")
    public ExampleDTO getExample(@PathVariable("exampleId") UUID exampleId) {

        return exampleService.getExample(exampleId);
    }

    @GetMapping("/examples")
    public Page<ExampleDTO> getExampleList(@ModelAttribute ExampleFilterDTO filterDTO) {

        return exampleService.getExampleList(filterDTO);
    }

    @PostMapping("/examples")
    public ExampleDTO createExample(@RequestBody ExampleCreateDTO createDTO) {

        return exampleService.createExample(createDTO);
    }

    @PutMapping("/examples/{exampleId}")
    public ExampleDTO updateExample(@PathVariable("exampleId") UUID exampleId,
        @RequestBody ExampleUpdateDTO updateDTO) {

        updateDTO.setExampleId(exampleId);
        return exampleService.updateExample(updateDTO);
    }

    @DeleteMapping("/examples/{exampleId}")
    public void deleteExample(@PathVariable("exampleId") UUID exampleId) {

        exampleService.deleteExample(exampleId);
    }


}
