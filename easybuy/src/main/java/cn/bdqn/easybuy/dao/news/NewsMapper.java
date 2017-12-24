package cn.bdqn.easybuy.dao.news;

import cn.bdqn.easybuy.entity.News;

import java.util.List;

/**
 * Created by Administrator on 2017/12/18 0018.
 */
public interface NewsMapper {
    List<News> queryAllNews();

    News queryNewsTitle(Integer id);

    List<News> queryAll();

    Integer addNews(News news);

    Integer updateNews(News news);

    Integer deleteMoreNews(List<Integer> ids);
}
