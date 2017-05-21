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

import java.math.BigDecimal;
import java.util.ArrayList;

/**
 * Class description
 *
 * @author Sarah Guarino
 * @version 1.0
 */

@Controller
public class HomeController {
    private int editedSpeciesIdInt;

    // maps the home.jsp file to be rendered as an html page with target path of /jdbcTestPAge
    @RequestMapping(value = "/")
    public String home() {
    return "home";
    }

    @RequestMapping(value="/admin")
    public ModelAndView adminPage() {
        ArrayList<SpeciesEntity> speciesList = loadSpeciesList();
        return new ModelAndView("admin", "speciesListEL", speciesList);
    }

    @RequestMapping(value="/species")
    public ModelAndView species() {
        ArrayList<SpeciesEntity> speciesList = loadSpeciesList();
        return new ModelAndView("species", "speciesListEL", speciesList);
    }

    @RequestMapping("/admin/action=editSpecies")
    public String editSpecies(@RequestParam("id") String editedSpeciesIdString, Model model) {
        Configuration speciesConfigurationObject = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory speciesSessionFactory = speciesConfigurationObject.buildSessionFactory();
        Session speciesSession = speciesSessionFactory.openSession();
        speciesSession.beginTransaction();

        editedSpeciesIdInt = Integer.parseInt(editedSpeciesIdString);
        SpeciesEntity editedSpecies = (SpeciesEntity)speciesSession.get(SpeciesEntity.class, editedSpeciesIdInt);

        model.addAttribute("editSpecies", editedSpecies);

        return "editSpecies";
    }

    @RequestMapping(value="/admin/speciesEdited")
    public String speciesEdited(@RequestParam("speciesname") String speciesName,
                                @RequestParam("picturelink") String pictureLink,
                                @RequestParam("temps") String temps,
                                @RequestParam("humidity") String humidity,
                                @RequestParam("price") BigDecimal price,
                                @RequestParam("diet") String diet,
                                @RequestParam("experiencelevel") String experienceLevel,
                                @RequestParam("region") String region,
                                @RequestParam("habitat") String habitat,
                                @RequestParam("description") String description,
                                @RequestParam("size") String size,
                                Model model) {

        Configuration speciesConfigurationObject = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory speciesSessionFactory = speciesConfigurationObject.buildSessionFactory();
        Session speciesSession = speciesSessionFactory.openSession();

        Transaction tx = speciesSession.beginTransaction();

        SpeciesEntity newSpecies = new SpeciesEntity();
        SpeciesEntity editedSpecies = (SpeciesEntity)speciesSession.get(SpeciesEntity.class, editedSpeciesIdInt);

        editedSpecies.setSpeciesname(speciesName);
        editedSpecies.setPicturelink(pictureLink);
        editedSpecies.setTemps(temps);
        editedSpecies.setHumidity(humidity);
        editedSpecies.setPrice(price);
        editedSpecies.setDiet(diet);
        editedSpecies.setExperiencelevel(experienceLevel);
        editedSpecies.setRegion(region);
        editedSpecies.setHabitat(habitat);
        editedSpecies.setDescription(description);
        editedSpecies.setSize(size);


        speciesSession.flush();
        tx.commit();

        Criteria speciesCriteria = speciesSession.createCriteria(SpeciesEntity.class);
        ArrayList<SpeciesEntity> speciesList = (ArrayList<SpeciesEntity>) speciesCriteria.list();
        model.addAttribute("speciesListEL", speciesList);
        speciesSession.close();

        return "admin";
    }

    @RequestMapping("/admin/action=deleteSpecies")
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

        return new ModelAndView("admin", "speciesListEL", speciesList);
    }

    @RequestMapping(value = "/admin/addSpecies", method = RequestMethod.GET)
    public String addSpecies() {
        return "addSpecies";
    }

    @RequestMapping(value = "/admin/speciesAdded", method = RequestMethod.POST)
    public String speciesAdded(@RequestParam("speciesname") String speciesName,
                            @RequestParam("picturelink") String pictureLink,
                            @RequestParam("temps") String temps,
                            @RequestParam("humidity") String humidity,
                            @RequestParam("price") BigDecimal price,
                            @RequestParam("diet") String diet,
                            @RequestParam("experiencelevel") String experienceLevel,
                            @RequestParam("region") String region,
                            @RequestParam("habitat") String habitat,
                            @RequestParam("description") String description,
                               @RequestParam("size") String size,
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
        newSpecies.setPrice(price);
        newSpecies.setDiet(diet);
        newSpecies.setExperiencelevel(experienceLevel);
        newSpecies.setRegion(region);
        newSpecies.setHabitat(habitat);
        newSpecies.setDescription(description);
        newSpecies.setSize(size);

        speciesSession.save(newSpecies);
        tx.commit();

        Criteria speciesCriteria = speciesSession.createCriteria(SpeciesEntity.class);
        ArrayList<SpeciesEntity> speciesList = (ArrayList<SpeciesEntity>) speciesCriteria.list();
        model.addAttribute("speciesListEL", speciesList);
        speciesSession.close();

        return "admin";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        return "register";
    }

    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public String userAdded(@RequestParam("fName") String fName,
                            @RequestParam("lName") String lName,
                            @RequestParam("username") String username,
                            @RequestParam("email") String email,
                            @RequestParam("firstPassword") String password,
                            Model model) {
        Configuration registerConfigurationObject = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory registerSessionFactory = registerConfigurationObject.buildSessionFactory();
        Session registerSession = registerSessionFactory.openSession();

        Transaction tx = registerSession.beginTransaction();

        UsersEntity newUser = new UsersEntity();
        newUser.setFname(fName);
        newUser.setLname(lName);
        newUser.setUsername(username);
        newUser.setEmail(email);
        newUser.setPassword(password);

        model.addAttribute("usergreeting", "Hello, " + username + "<br />");

        registerSession.save(newUser);
        tx.commit();
        registerSession.close();

        return "home";
    }

    public static ArrayList<SpeciesEntity> loadSpeciesList() {
        Configuration speciesConfigurationObject = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory speciesSessionFactory = speciesConfigurationObject.buildSessionFactory();
        Session speciesSession = speciesSessionFactory.openSession();
        speciesSession.beginTransaction();

        Criteria speciesCriteria = speciesSession.createCriteria(SpeciesEntity.class);
        ArrayList<SpeciesEntity> speciesList = (ArrayList<SpeciesEntity>) speciesCriteria.list();
        return speciesList;
    }
}