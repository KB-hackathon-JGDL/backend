package org.jgdlbe.common.filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jgdlbe.common.config.JwtConfig;
import org.jgdlbe.common.config.JwtTokenProvider;
import org.jgdlbe.user.domain.CustomUserDetails;
import org.jgdlbe.user.domain.UserRole;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
@RequiredArgsConstructor
@Slf4j
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final JwtTokenProvider jwtTokenProvider;
    private final JwtConfig jwtConfig;

    @Override
    protected void doFilterInternal(HttpServletRequest request,
        HttpServletResponse response,
        FilterChain filterChain)
        throws ServletException, IOException {

        try {
            // 헤더에서 JWT 토큰 추출
            String authHeader = request.getHeader(jwtConfig.getHeaderString());

            if (authHeader == null || !authHeader.startsWith(jwtConfig.getTokenPrefix())) {
                filterChain.doFilter(request, response);
                return;
            }

            // Bearer 접두사 제거
            String token = jwtTokenProvider.resolveToken(authHeader);

            // 토큰 유효성 검증
            if (token != null && jwtTokenProvider.validateToken(token)) {
                // 토큰에서 사용자 정보 추출
                String username = jwtTokenProvider.getUsernameFromToken(token);
                UUID userId = jwtTokenProvider.getUserIdFromToken(token);
                UserRole role = jwtTokenProvider.getRoleFromToken(token);

                // 권한 설정
                Collection<GrantedAuthority> authorities = getAuthorities(role);

                CustomUserDetails userDetails = new CustomUserDetails(
                    userId,
                    username,
                    role,
                    authorities
                );

                // SecurityContext에 인증 정보 저장
                UsernamePasswordAuthenticationToken authentication =
                    new UsernamePasswordAuthenticationToken(userDetails, null, authorities);

                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

                // SecurityContext에 인증 객체 저장
                SecurityContextHolder.getContext().setAuthentication(authentication);

                log.debug("JWT 인증 성공 - User: {}, Role: {}", username, role);
            }

        } catch (Exception e) {
            log.error("JWT 인증 실패: {}", e.getMessage());
        }

        filterChain.doFilter(request, response);
    }

    /**
     * UserRole을 Spring Security의 GrantedAuthority로 변환
     */
    private Collection<GrantedAuthority> getAuthorities(UserRole role) {
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(role.name()));

        // 역할 계층 구조 적용 (ADMIN은 MENTOR와 USER 권한도 가짐)
        if (role == UserRole.ROLE_ADMIN) {
            authorities.add(new SimpleGrantedAuthority(UserRole.ROLE_MENTOR.name()));
            authorities.add(new SimpleGrantedAuthority(UserRole.ROLE_USER.name()));
        } else if (role == UserRole.ROLE_MENTOR) {
            authorities.add(new SimpleGrantedAuthority(UserRole.ROLE_USER.name()));
        }

        return authorities;
    }
}