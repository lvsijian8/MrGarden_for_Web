package pot.entity;

import javax.persistence.*;

/**
 * Created by lvsijian8 on 2017/3/25.
 */
@Entity
@Table(name = "plant", schema = "flowerpot", catalog = "")
public class PlantEntity {
    private int plantId;
    private String chineseName;
    private String englishName;
    private String imageUrl;
    private String brief;
    private int watering;
    private int sunshine;
    private int temperatureMin;
    private int temperatureMax;
    private int fertilizer;
    private String text;

    @Id
    @Column(name = "plant_id", nullable = false)
    public int getPlantId() {
        return plantId;
    }

    public void setPlantId(int plantId) {
        this.plantId = plantId;
    }

    @Basic
    @Column(name = "chinese_name", nullable = false, length = 20)
    public String getChineseName() {
        return chineseName;
    }

    public void setChineseName(String chineseName) {
        this.chineseName = chineseName;
    }

    @Basic
    @Column(name = "english_name", nullable = false, length = 60)
    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    @Basic
    @Column(name = "image_url", nullable = false, length = 100)
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Basic
    @Column(name = "brief", nullable = false, length = 1000)
    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    @Basic
    @Column(name = "watering", nullable = false)
    public int getWatering() {
        return watering;
    }

    public void setWatering(int watering) {
        this.watering = watering;
    }

    @Basic
    @Column(name = "sunshine", nullable = false)
    public int getSunshine() {
        return sunshine;
    }

    public void setSunshine(int sunshine) {
        this.sunshine = sunshine;
    }

    @Basic
    @Column(name = "temperature_min", nullable = false)
    public int getTemperatureMin() {
        return temperatureMin;
    }

    public void setTemperatureMin(int temperatureMin) {
        this.temperatureMin = temperatureMin;
    }

    @Basic
    @Column(name = "temperature_max", nullable = false)
    public int getTemperatureMax() {
        return temperatureMax;
    }

    public void setTemperatureMax(int temperatureMax) {
        this.temperatureMax = temperatureMax;
    }

    @Basic
    @Column(name = "fertilizer", nullable = false)
    public int getFertilizer() {
        return fertilizer;
    }

    public void setFertilizer(int fertilizer) {
        this.fertilizer = fertilizer;
    }

    @Basic
    @Column(name = "text", nullable = false, length = 5000)
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PlantEntity that = (PlantEntity) o;

        if (plantId != that.plantId) return false;
        if (watering != that.watering) return false;
        if (sunshine != that.sunshine) return false;
        if (temperatureMin != that.temperatureMin) return false;
        if (temperatureMax != that.temperatureMax) return false;
        if (fertilizer != that.fertilizer) return false;
        if (chineseName != null ? !chineseName.equals(that.chineseName) : that.chineseName != null) return false;
        if (englishName != null ? !englishName.equals(that.englishName) : that.englishName != null) return false;
        if (imageUrl != null ? !imageUrl.equals(that.imageUrl) : that.imageUrl != null) return false;
        if (brief != null ? !brief.equals(that.brief) : that.brief != null) return false;
        return text != null ? text.equals(that.text) : that.text == null;
    }

    @Override
    public int hashCode() {
        int result = plantId;
        result = 31 * result + (chineseName != null ? chineseName.hashCode() : 0);
        result = 31 * result + (englishName != null ? englishName.hashCode() : 0);
        result = 31 * result + (imageUrl != null ? imageUrl.hashCode() : 0);
        result = 31 * result + (brief != null ? brief.hashCode() : 0);
        result = 31 * result + watering;
        result = 31 * result + sunshine;
        result = 31 * result + temperatureMin;
        result = 31 * result + temperatureMax;
        result = 31 * result + fertilizer;
        result = 31 * result + (text != null ? text.hashCode() : 0);
        return result;
    }
}
