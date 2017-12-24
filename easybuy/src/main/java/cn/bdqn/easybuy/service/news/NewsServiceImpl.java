package cn.bdqn.easybuy.service.news;


import cn.bdqn.easybuy.dao.news.NewsMapper;
import cn.bdqn.easybuy.entity.News;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/18 0018.
 */
@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsMapper newsMapper;

    @Override
    public List<News> queryAllNews() {
        return newsMapper.queryAllNews();
    }

    @Override
    public News queryNewsTitle(Integer id) {
        return newsMapper.queryNewsTitle(id);
    }

    @Override
    public PageInfo<News> queryAll(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<News> list = newsMapper.queryAll();
        PageInfo<News> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public Integer addNews(News news) {
        return newsMapper.addNews(news);
    }

    @Override
    public Integer updateNews(News news) {
        return newsMapper.updateNews(news);
    }

    @Override
    public Integer deleteMoreNews(List<Integer> ids) {
        return newsMapper.deleteMoreNews(ids);
    }

}
