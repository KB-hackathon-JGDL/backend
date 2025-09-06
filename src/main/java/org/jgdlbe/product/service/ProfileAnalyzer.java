package org.jgdlbe.product.service;

import org.jgdlbe.product.domain.ProfileType;
import org.jgdlbe.product.domain.ProfileVectors;
import org.jgdlbe.product.dto.ProfileScoreRequest;
import org.springframework.stereotype.Component;

import java.util.Comparator;
import java.util.Map;

@Component
public class ProfileAnalyzer {

    public ProfileType analyze(ProfileScoreRequest req) {
        double[] u = normalize(new double[]{
                req.getS1(),
                req.getS2(),
                req.getS3(),
                req.getS4()
        });

        return ProfileVectors.all().entrySet().stream()
                .max(Comparator.comparingDouble(e -> cosine(u, normalize(e.getValue()))))
                .map(Map.Entry::getKey)
                .orElse(ProfileType.PRACTICAL);
    }

    private double[] normalize(double[] v) {
        double norm = 0.0;
        for (double x : v) norm += x * x;
        norm = Math.sqrt(norm);
        double[] r = new double[v.length];
        for (int i = 0; i < v.length; i++) {
            r[i] = (norm == 0) ? 0 : v[i] / norm;
        }
        return r;
    }

    private double cosine(double[] a, double[] b) {
        double s = 0;
        for (int i = 0; i < a.length; i++) s += a[i] * b[i];
        return s;
    }
}
