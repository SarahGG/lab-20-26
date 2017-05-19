package com.grandcircus.spring.controller;

import com.grandcircus.spring.models.SpeciesEntity;
import com.grandcircus.spring.models.UsersEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

/**
 * Class description
 *
 * @author Sarah Guarino
 * @version 1.0
 */

@Controller
public class HomeController {

    // maps the home.jsp file to be rendered as an html page with target path of /jdbcTestPAge
    @RequestMapping(value = "/")
    public String home() {
//        Configuration homeConfigurationObject = new Configuration().configure("hibernate.cfg.xml");
//        SessionFactory homeSessionFactory = homeConfigurationObject.buildSessionFactory();
//        Session homeSession = homeSessionFactory.openSession();
//        homeSession.beginTransaction();
//        Criteria homeCriteria = homeSession.createCriteria(ProductEntity.class);
//        ArrayList<ProductEntity> productList = (ArrayList<ProductEntity>) homeCriteria.list();
//        model.addAttribute("productListEL", productList);
//        Criteria usersCriteria = homeSession.createCriteria(UsersEntity.class);
//        ArrayList<UsersEntity> usersList = (ArrayList<UsersEntity>) usersCriteria.list();
//        model.addAttribute("usersListEL", usersList);

        return "home";
    }

    @RequestMapping(value="/species")
    public ModelAndView species() {
        Configuration speciesConfigurationObject = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory speciesSessionFactory = speciesConfigurationObject.buildSessionFactory();
        Session speciesSession = speciesSessionFactory.openSession();
        speciesSession.beginTransaction();

        Criteria speciesCriteria = speciesSession.createCriteria(SpeciesEntity.class);
        ArrayList<SpeciesEntity> speciesList = (ArrayList<SpeciesEntity>) speciesCriteria.list();

        return new ModelAndView("species", "speciesListEL", speciesList);
    }

    @RequestMapping(value = "/species/add", method = RequestMethod.GET)
    public String addSpecies() {
        return "addSpecies";
    }

    @RequestMapping(value = "/species/added", method = RequestMethod.POST)
    public String speciesAdded(@RequestParam("speciesname") String speciesName,
                            @RequestParam("picturelink") String pictureLink,
                            @RequestParam("temps") String temps,
                            @RequestParam("humidity") String humidity,
                            @RequestParam("diet") String diet,
                            @RequestParam("experiencelevel") String experienceLevel,
                            @RequestParam("region") String region,
                            @RequestParam("habitat") String habitat,
                            @RequestParam("description") String description,
                               Model model) {
        Configuration speciesConfigurationObject = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory speciesSessionFactory = speciesConfigurationObject.buildSessionFactory();
        Session speciesSession = speciesSessionFactory.openSession();

        Transaction tx = speciesSession.beginTransaction();

        SpeciesEntity newSpecies = new SpeciesEntity();
        newSpecies.setSpeciesname(speciesName);
        newSpecies.setPicturelink(pictureLink);
        newSpecies.setTemps(temps);
        newSpecies.setHumidity(humidity);
        newSpecies.setDiet(diet);
        newSpecies.setExperiencelevel(experienceLevel);
        newSpecies.setRegion(region);
        newSpecies.setHabitat(habitat);
        newSpecies.setDescription(description);

        speciesSession.save(newSpecies);
        tx.commit();

        Criteria speciesCriteria = speciesSession.createCriteria(SpeciesEntity.class);
        ArrayList<SpeciesEntity> speciesList = (ArrayList<SpeciesEntity>) speciesCriteria.list();
        model.addAttribute("speciesListEL", speciesList);
        speciesSession.close();

        return "species";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        return "register";
    }

    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public String userAdded(@RequestParam("fName") String fName,
                            @RequestParam("lName") String lName,
                            @RequestParam("username") String username,
                            Model model) {
        Configuration registerConfigurationObject = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory registerSessionFactory = registerConfigurationObject.buildSessionFactory();
        Session registerSession = registerSessionFactory.openSession();

        Transaction tx = registerSession.beginTransaction();

        UsersEntity newUser = new UsersEntity();
        newUser.setFname(fName);
        newUser.setLname(lName);
        newUser.setUsername(username);

        model.addAttribute("usergreeting", "Hello, " + username + "<br />");

        registerSession.save(newUser);
        tx.commit();
        registerSession.close();

        return "home";
    }

    @RequestMapping("/species/deleted")
    public ModelAndView deleteSpecies(@RequestParam("id") String deleteThisId) {
        // temp product entity object will store information that we want to delete
        SpeciesEntity deletedSpecies = new SpeciesEntity();
        deletedSpecies.setSpeciesid(Integer.parseInt(deleteThisId));

        Configuration speciesConfigurationObject = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory speciesSessionFactory = speciesConfigurationObject.buildSessionFactory();
        Session speciesSession = speciesSessionFactory.openSession();
        speciesSession.beginTransaction();

        // deleting the object
        speciesSession.delete(deletedSpecies); // prepares object for deletion
        speciesSession.getTransaction().commit(); // deleted the row from the database

        Criteria speciesCriteria = speciesSession.createCriteria(SpeciesEntity.class);
        ArrayList<SpeciesEntity> speciesList = (ArrayList<SpeciesEntity>) speciesCriteria.list();

        return new ModelAndView("species", "speciesListEL", speciesList);
    }

}