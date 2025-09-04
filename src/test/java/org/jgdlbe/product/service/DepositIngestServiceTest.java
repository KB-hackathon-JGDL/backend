package org.jgdlbe.product.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.NONE)
class DepositIngestServiceTest {

    @Autowired
    DepositIngestService service;

    @Test
    void productSave() {
        var result = service.ingest(null); // application.yml의 topFinGrpNo(020000) 사용
        System.out.printf("ingest result => products=%d, rates=%d%n",
                result.products(), result.rates());
    }

}