package com.grandcircus.spring.models;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * Class description
 *
 * @author Sarah Guarino
 * @version 1.0
 */
@Entity
@Table(name = "species", schema = "coffeeshop", catalog = "")
public class SpeciesEntity {
    private int speciesid;
    private String speciesname;
    private String picturelink;
    private String temps;
    private String humidity;
    private String diet;
    private String experiencelevel;
    private String region;
    private String habitat;
    private String description;
    private BigDecimal price;
    private String size;

    @Id
    @Column(name = "speciesid", nullable = false)
    public int getSpeciesid() {
        return speciesid;
    }

    public void setSpeciesid(int speciesid) {
        this.speciesid = speciesid;
    }

    @Basic
    @Column(name = "speciesname", nullable = false, length = 50)
    public String getSpeciesname() {
        return speciesname;
    }

    public void setSpeciesname(String speciesname) {
        this.speciesname = speciesname;
    }

    @Basic
    @Column(name = "picturelink", nullable = true, length = 60)
    public String getPicturelink() {
        return picturelink;
    }

    public void setPicturelink(String picturelink) {
        this.picturelink = picturelink;
    }

    @Basic
    @Column(name = "temps", nullable = false, length = 16)
    public String getTemps() {
        return temps;
    }

    public void setTemps(String temps) {
        this.temps = temps;
    }

    @Basic
    @Column(name = "humidity", nullable = false, length = 16)
    public String getHumidity() {
        return humidity;
    }

    public void setHumidity(String humidity) {
        this.humidity = humidity;
    }

    @Basic
    @Column(name = "diet", nullable = false, length = -1)
    public String getDiet() {
        return diet;
    }

    public void setDiet(String diet) {
        this.diet = diet;
    }

    @Basic
    @Column(name = "experiencelevel", nullable = false, length = 45)
    public String getExperiencelevel() {
        return experiencelevel;
    }

    public void setExperiencelevel(String experiencelevel) {
        this.experiencelevel = experiencelevel;
    }

    @Basic
    @Column(name = "region", nullable = false, length = -1)
    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    @Basic
    @Column(name = "habitat", nullable = false, length = 45)
    public String getHabitat() {
        return habitat;
    }

    public void setHabitat(String habitat) {
        this.habitat = habitat;
    }

    @Basic
    @Column(name = "description", nullable = false, length = -1)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "price", nullable = false, precision = 2)
    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @Basic
    @Column(name = "size", nullable = false, length = 45)
    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SpeciesEntity that = (SpeciesEntity) o;

        if (speciesid != that.speciesid) return false;
        if (speciesname != null ? !speciesname.equals(that.speciesname) : that.speciesname != null) return false;
        if (picturelink != null ? !picturelink.equals(that.picturelink) : that.picturelink != null) return false;
        if (temps != null ? !temps.equals(that.temps) : that.temps != null) return false;
        if (humidity != null ? !humidity.equals(that.humidity) : that.humidity != null) return false;
        if (diet != null ? !diet.equals(that.diet) : that.diet != null) return false;
        if (experiencelevel != null ? !experiencelevel.equals(that.experiencelevel) : that.experiencelevel != null)
            return false;
        if (region != null ? !region.equals(that.region) : that.region != null) return false;
        if (habitat != null ? !habitat.equals(that.habitat) : that.habitat != null) return false;
        if (description != null ? !description.equals(that.description) : that.description != null) return false;
        if (price != null ? !price.equals(that.price) : that.price != null) return false;
        if (size != null ? !size.equals(that.size) : that.size != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = speciesid;
        result = 31 * result + (speciesname != null ? speciesname.hashCode() : 0);
        result = 31 * result + (picturelink != null ? picturelink.hashCode() : 0);
        result = 31 * result + (temps != null ? temps.hashCode() : 0);
        result = 31 * result + (humidity != null ? humidity.hashCode() : 0);
        result = 31 * result + (diet != null ? diet.hashCode() : 0);
        result = 31 * result + (experiencelevel != null ? experiencelevel.hashCode() : 0);
        result = 31 * result + (region != null ? region.hashCode() : 0);
        result = 31 * result + (habitat != null ? habitat.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        return result;
    }
}
