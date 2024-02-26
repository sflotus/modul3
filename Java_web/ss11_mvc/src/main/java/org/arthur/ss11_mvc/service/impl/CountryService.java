package org.arthur.ss11_mvc.service.impl;

import org.arthur.ss11_mvc.model.Country;
import org.arthur.ss11_mvc.repository.ICountryRepo;
import org.arthur.ss11_mvc.repository.impl.CountryRepo;
import org.arthur.ss11_mvc.service.ICountryService;

import java.util.List;

public class CountryService implements ICountryService {
    ICountryRepo countryRepo = new CountryRepo();
    @Override
    public List<Country> getListCountry() {
        return countryRepo.getListCountry();
    }
}
