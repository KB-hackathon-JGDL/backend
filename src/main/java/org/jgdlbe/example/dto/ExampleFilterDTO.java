package org.jgdlbe.example.dto;


import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.jgdlbe.common.dto.BaseFilterDTO;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@SuperBuilder
public class ExampleFilterDTO extends BaseFilterDTO {

    private String exampleCode;

    private String exampleString;

    private String keyword;

}
