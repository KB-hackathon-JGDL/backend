package org.jgdlbe.favorite.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;
import java.util.UUID;

@Data @AllArgsConstructor @NoArgsConstructor
public class AddFavoriteResponse {
    private UUID favoriteId;
    private String type;
    private UUID targetId;
    private Instant createdAt;
    private boolean existed;
}
