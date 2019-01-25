package mainPackage.source;

import javax.persistence.*;

@Entity
@Table(name = "Details")
public class Detail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "NAME",nullable = false)
    private String name;

    @Column(name = "COUNT")
    private int count;

    @Column(name = "NECESSARY")
    private boolean necessary;

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public boolean isNecessary() {
        return necessary;
    }

    public void setNecessary(boolean necessary) {
        this.necessary = necessary;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return
                "id=" + id +
                ", наименование=" + name  +
                ", количество=" + count +
                ", необходимость=" + (necessary?"да":"нет") ;
    }
}
