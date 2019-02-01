package mainPackage.source;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name = "Details")
public class Detail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "NAME",nullable = false)
    @NotNull(message = "Наименование не должно быть пустым.")
    @Size(min = 3,max = 15,message = "Укажите наименование детали длиной от 3 до 15 символов.")
    private String name;

    @Column(name = "COUNT")
    @NotNull(message = "Количество не должно быть пустым.")
    @Digits(integer = 5,fraction = 0,message = "Укажите число не более 5 знаков.")
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
