package mainPackage.source.dao;

import mainPackage.source.Detail;
import mainPackage.source.Enums.Filters;

import java.util.List;

public interface DaoDetail {
    public void addDetail(Detail d);
    public void updateDetail(Detail d);
    public void deleteDetail(Long id);
    public List<Detail> getDetailsByFilterAndPage(Filters filter,int page,int pageCount);
    public int getMaxPage(Filters filter,int pageCount);
    public int getMaxBuild();
    public Detail getDetailById(Long id);
    public Detail getDetaulByName(String name);
}
