package com.creator.services;

import com.creator.models.Backend;
import com.creator.models.UseCase;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class UseCaseService {
    private ArrayList<UseCase> useCases = new ArrayList<UseCase>();

    public UseCaseService() {}

    public ArrayList<UseCase> processUseCases(ArrayList<String> names, ArrayList<String> featureCategory, ArrayList<Boolean> isDb,
                                              ArrayList<Boolean> isApi, ArrayList<Boolean> isFE1, ArrayList<Boolean> isFE2) {

        for (int i=0; i< names.size(); i++) {
            UseCase useCase = new UseCase();
            useCase.setName(names.get(i));
            useCase.setFeatureCategory(featureCategory.get(i));
            useCase.setDb(isDb.get(i));
            useCase.setApi(isApi.get(i));
            useCase.setFE1(isFE1.get(i));
            useCase.setFE2(isFE2.get(i));
            useCases.add(useCase);
        }

       return  useCases;
    }

}
