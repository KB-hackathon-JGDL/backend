package org.jgdlbe.product.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.NONE)
class SavingIngestServiceTest {

    @Autowired
    SavingIngestService service;

    @Test
    void productSave() {
        var result = service.ingest(null);
        System.out.printf("ingest result => products=%d, rates=%d%n",
                result.products(), result.rates());
    }

}