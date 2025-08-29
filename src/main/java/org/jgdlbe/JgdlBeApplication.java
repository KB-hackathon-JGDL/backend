package org.jgdlbe;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class JgdlBeApplication {

	public static void main(String[] args) {
		SpringApplication.run(JgdlBeApplication.class, args);
	}

}
