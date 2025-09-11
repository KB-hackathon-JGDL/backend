package org.jgdlbe.common.config;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {
    //http://localhost:8080/swagger-ui/index.html
    private static final String SECURITY_SCHEME_NAME = "bearerAuth";

    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
            .components(new Components()
                .addSecuritySchemes(SECURITY_SCHEME_NAME,
                    new SecurityScheme()
                        .name(SECURITY_SCHEME_NAME)
                        .type(SecurityScheme.Type.HTTP)   // HTTP 인증 방식
                        .scheme("bearer")                // Bearer 토큰
                        .bearerFormat("JWT")             // JWT 포맷
                )
            )
            .addSecurityItem(new SecurityRequirement().addList(SECURITY_SCHEME_NAME)) // 모든 API에 적용
            .info(info());
    }

    private Info info() {
        return new Info()
            .title("JGDL Basic API")
            .description("JGDL API Documentation")
            .version("1.0");
    }
}