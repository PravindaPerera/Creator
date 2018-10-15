package com.creator.services;
import com.creator.models.Backend;
import com.creator.models.UseCase;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class BackendService {
    private ArrayList<Backend> backendComponents = new ArrayList<Backend>();
    private ArrayList<String> processedFeatureCategories = new ArrayList<String>();
    private String currentFeatureCategory = null;
    private UseCase currentUseCase = null;

    public BackendService() {}

    public ArrayList<Backend> processBackendComponents(ArrayList<UseCase> useCases) {

        for (int i=0; i< useCases.size(); i++) {
            Backend backendComponent = new Backend();
            currentFeatureCategory = useCases.get(i).getFeatureCategory();
            if (!processedFeatureCategories.contains(currentFeatureCategory)) {
                for (int j=0; j< useCases.size(); j++) {
                    currentUseCase = useCases.get(j);
                    if (currentFeatureCategory.equals(currentUseCase.getFeatureCategory())) {
                        backendComponent.setFeatureCategory(currentFeatureCategory);
                        if (!backendComponent.getDb()) {
                            backendComponent.setDb(currentUseCase.getDb());
                        }
                        if (!backendComponent.getApi()) {
                            backendComponent.setApi(currentUseCase.getApi());
                        }
                        if (!backendComponent.getMS()) {
                            backendComponent.setMS(backendComponent.getDb() || backendComponent.getApi());
                        }
                        if (!backendComponent.getFE1()) {
                            backendComponent.setFE1(currentUseCase.getFE1());
                        }
                        if (!backendComponent.getFE2()) {
                            backendComponent.setFE2(currentUseCase.getFE2());
                        }
                    }
                }
                processedFeatureCategories.add(currentFeatureCategory);
                // logic to map useCases information to backend components
                backendComponents.add(backendComponent);
            }
        }

        return  backendComponents;
    }
}
