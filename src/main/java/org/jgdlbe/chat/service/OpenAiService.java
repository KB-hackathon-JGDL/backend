package org.jgdlbe.chat.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.*;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientResponseException;
import org.springframework.web.client.RestTemplate;

import java.time.Duration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class OpenAiService {

    private final RestTemplate restTemplate;

    @Value("${gpt.openApiKey}")
    private String OPENAI_API_KEY;

    private static final String OPENAI_URL = "https://api.openai.com/v1/chat/completions";

    public OpenAiService(RestTemplateBuilder builder) {
        this.restTemplate = builder
                .requestCustomizers(factory -> {
                    if (factory instanceof SimpleClientHttpRequestFactory simple) {
                        simple.setConnectTimeout((int) Duration.ofSeconds(5).toMillis());
                        simple.setReadTimeout((int) Duration.ofSeconds(30).toMillis());
                    }
                })
                .build();
    }

    public String askOpenAi(String userInput) {
        try {
            Map<String, String> systemMsg = Map.of(
                    "role", "system",
                    "content", String.join("\n",
                            "너는 자립준비청년을 위한 전문 상담 챗봇이야.",
                            "주거, 금융, 진로, 일상생활, 복지지원 제도 등 청년이 독립하는 과정에서 필요한 정보를 잘 안내할 수 있어야 해.",
                            "사용자가 힘든 상황을 이야기하면 공감하고, 위로와 함께 도움이 될 수 있는 구체적인 방법이나 제도를 알려줘.",
                            "전문 용어나 제도 이름이 나오면 초보자도 이해할 수 있도록 쉽게 풀어서 설명해.",
                            "필요하다면 실제 사례나 간단한 예시를 들어 이해를 돕고, 링크나 안내 경로도 알려줄 수 있어.",
                            "말투는 따뜻하고 친절한 상담원이 이야기하듯 유지해.",
                            "질문이 불명확할 경우 '조금 더 자세히 말씀해주시면 더 정확하게 도와드릴 수 있어요.'처럼 정중하게 요청해줘.",
                            "목표는 자립준비청년이 안전하게 정보를 얻고, 스스로 미래를 준비할 수 있도록 돕는 것이야.",
                            "답변은 지나치게 길지 않게, 핵심을 3~4문장 이내로 간결히 전달해."
                    )
            );
            Map<String, String> userMsg = Map.of("role", "user", "content", userInput);

            List<Map<String, String>> messages = List.of(systemMsg, userMsg);
            Map<String, Object> body = new HashMap<>();
            body.put("model", "gpt-4o");
            body.put("messages", messages);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.setBearerAuth(OPENAI_API_KEY);

            ResponseEntity<Map> response = restTemplate.exchange(
                    OPENAI_URL, HttpMethod.POST, new HttpEntity<>(body, headers), Map.class);

            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                Map<String, Object> responseBody = response.getBody();
                List<Map<String, Object>> choices = (List<Map<String, Object>>) responseBody.get("choices");
                if (choices != null && !choices.isEmpty()) {
                    Map<String, Object> message = (Map<String, Object>) choices.get(0).get("message");
                    Object content = message.get("content");
                    if (content != null) return content.toString().trim();
                }
                log.warn("OpenAI 응답 구조 예상과 다름: {}", responseBody);
                return "응답을 해석하지 못했어요. 잠시 후 다시 시도해 주세요.";
            } else {
                log.error("OpenAI 응답 실패: {}", response);
                return "OpenAI 호출에 실패했습니다.";
            }
        } catch (RestClientResponseException ex) {
            log.error("OpenAI API 에러: status={} body={}", ex.getRawStatusCode(), ex.getResponseBodyAsString(), ex);
            return "AI 응답 중 오류가 발생했습니다.";
        } catch (Exception e) {
            log.error("OpenAI 호출 중 예외", e);
            return "AI 응답 중 예기치 못한 오류가 발생했습니다.";
        }
    }
}
