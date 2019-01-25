package mainPackage.source.Controllers;

import mainPackage.source.Detail;
import mainPackage.source.Enums.Filters;
import mainPackage.source.dao.DaoDetail;
import mainPackage.source.dao.DaoDetailImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Transactional
public class MainController {

    @Autowired
    DaoDetail detailDao;


    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String index(Model model, HttpSession session, HttpServletRequest request){
        int pageCount=10;
        Filters filter=getFilter(request.getParameter("filter"),session);

        int maxPage=detailDao.getMaxPage(filter,pageCount);
        Integer page=getPage(request.getParameter("page"),session,maxPage);

        List<Detail> details=detailDao.getDetailsByFilterAndPage(filter,page,pageCount);
        model.addAttribute("details",details);
        model.addAttribute("canBuild",detailDao.getMaxBuild());
        model.addAttribute("maxPage",maxPage);

        if(!model.containsAttribute("updateDetail")){
            model.addAttribute("updateDetail",new Detail());
        }
        return "test";
    }
    private Integer getPage(String page,HttpSession session,int maxPage){
        Integer result=(Integer)session.getAttribute("page");
        result=page!=null?parseInt(page):result!=null?result:1;
        if(result<1)result=1;
        if(result>maxPage)result=maxPage;
        session.setAttribute("page",result);
        return result;
    }
    private int parseInt(String num){
        try {
            return Integer.parseInt(num);
        } catch (NumberFormatException e) {
            return 0;
        }
    }
    private Filters getFilter(String filter,HttpSession session){
        Filters result=(Filters) session.getAttribute("filters");
        result=filter!=null?Filters.values()[parseInt(filter)]:result!=null?result:Filters.none;
        session.setAttribute("filters",result);
        return result;
    }

    @RequestMapping(value = "/remove/{id}")
    public String remove(@PathVariable("id") Long id){
        detailDao.deleteDetail(id);
        return "redirect:/";
    }
    @RequestMapping(value = "/edit/{id}")
    public String update(@PathVariable("id") Long id,Model model,HttpSession session,HttpServletRequest request){
        Detail updateDetail=detailDao.getDetailById(id);
        model.addAttribute("updateDetail",updateDetail);
        return index(model,session,request);
    }
    @RequestMapping(value = "/seach")
    public String seach(Model model,HttpSession session,HttpServletRequest request){
       Detail detail=detailDao.getDetaulByName(request.getParameter("seachName"));
        if(detail==null)
            model.addAttribute("seachData","Компонента с данным названием нет в списке");
        else
            model.addAttribute("seachData","Найдена деталь:\t"+detail.toString());
        return index(model,session,request);
    }
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public  String add(@ModelAttribute("updateDetail")Detail detail){
        if(detail.getId() == null){
            detailDao.addDetail(detail);
        }else {
           detailDao.updateDetail(detail);
        }
        return "redirect:/";
    }

}
