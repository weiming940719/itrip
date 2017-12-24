package cn.bdqn.easybuy.service.news;

import cn.bdqn.easybuy.entity.News;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Administrator on 2017/12/18 0018.
 */
public interface NewsService {
    List<News> queryAllNews();

    News queryNewsTitle(Integer id);

    PageInfo<News> queryAll(Integer pageNum, Integer pageSize);

    Integer addNews(News news);

    Integer updateNews(News news);

    Integer deleteMoreNews(List<Integer> ids);
}
