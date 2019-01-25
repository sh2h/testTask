package mainPackage.source.dao;

import mainPackage.source.Detail;
import mainPackage.source.Enums.Filters;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;
@Repository
@Transactional
public class DaoDetailImpl  implements DaoDetail{

    @PersistenceContext
    private EntityManager em;

    public void addDetail(Detail d) {
        em.persist(d);
    }

    public void updateDetail(Detail d) {
        em.merge(d);
    }

    public void deleteDetail(Long id) {
        Query query=em.createQuery("delete from Detail d where d.id=:id");
        query.setParameter("id",id);
        query.executeUpdate();
    }

    public List<Detail> getDetailsByFilterAndPage(Filters filter, int page,int pageCount) {
        Query query;
        switch (filter){
            case necessary:
                query=em.createQuery("select d from Detail d where d.necessary=true ");

                break;
            case optional:
                query=em.createQuery("select d from Detail d where d.necessary=false");
                break;
            default:
                query=em.createQuery("select d from Detail d");
        }
        if(page==0)
            return new ArrayList<Detail>();
        return query.setFirstResult(pageCount*(page-1)).setMaxResults(pageCount).getResultList();
    }

    public int getMaxPage(Filters filter,int pageCount) {
        Query query;
        switch (filter){
            case necessary:
                query=em.createQuery("select count(d.id) from Detail d where d.necessary=true ");
                break;
            case optional:
                query=em.createQuery("select count(d.id) from Detail d where d.necessary=false");
                break;
            default:
                query=em.createQuery("select count(d.id) from Detail d");
        }
        long countResult= (Long)query.getResultList().get(0);
        if(countResult==0)
            return 0;
        int result=(int)countResult/pageCount;
        if(countResult%pageCount!=0)
            result++;
        return result;
    }

    public int getMaxBuild() {
        Query query=query=em.createQuery("select count(d.id) from Detail d where d.necessary=true ");
        long countResult= (Long)query.getResultList().get(0);
        if(countResult==0)
            return 0;
        return (Integer) em.createQuery("select min(d.count) from Detail d where d.necessary=true")
                .getSingleResult();
    }

    public Detail getDetailById(Long id) {
        return em.find(Detail.class,id);
    }

    public Detail getDetaulByName(String name) {
        Query query=em.createQuery("select d from Detail d where d.name=:name");
        query.setParameter("name",name);
        List<Detail> detailList=query.getResultList();
        if(detailList.size()==0)
            return null;
        else
            return detailList.get(0);
    }
}
