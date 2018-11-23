package com.javaer.dao.impl;

import com.javaer.dao.IMovieDao;
import com.javaer.model.Movie;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Repository("movieDao")
public class MovieDaoImpl  implements IMovieDao {
	// Spring 3.x 对 Hibernate 4.x 不提供
    // HibernateDaoSupport，所以在dao的实现层注入SessionFactory
    private SessionFactory sessionFactory;
    
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();// 增删改使用的session
    }

    public Session qryCurrentSesion() {
        return sessionFactory.openSession();// 查询使用的session
    }

	private static final Logger log = LoggerFactory.getLogger(MovieDaoImpl.class);
	protected void initDao() {
	}

	public void save(Movie transientInstance) {
		log.debug("saving Movie instance");
		try {
			this.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Movie persistentInstance) {
		log.debug("deleting Movie instance");
		try {
			this.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Movie findById(java.lang.Integer id) {
		log.debug("getting Movie instance with id: " + id);
		try {
			Movie instance = (Movie) this.getCurrentSession().get(
					"com.javaer.model.Movie", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}


	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Movie instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Movie as domain where domain."
					+ propertyName + "= ?";
//			return getHibernateTemplate().find(queryString, value);
			  Query qry = this.getCurrentSession().createQuery(queryString);
					  qry.setParameter(0, value);
		        return qry.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}


	public List findAll() {
		log.debug("finding all Movie instances");
		try {
			String queryString = "from Movie";
			   Query qry = this.getCurrentSession().createQuery(queryString);
		        return qry.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Movie merge(Movie detachedInstance) {
		log.debug("merging Movie instance");
		try {
			Movie result = (Movie) this.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Movie instance) {
		log.debug("attaching dirty Movie instance");
		try {
			this.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Movie instance) {
		log.debug("attaching clean Movie instance");
		try {
			this.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}


	@Override
	public List findByExample(Movie instance) {
		return null;
	}

	@Override
	public List findByName(Object name) {
		return findByProperty("name", name);
	}

	@Override
	public List<Movie> findMovieList(HttpServletRequest request, int pageNo,
                                     int pageSize) {
		log.debug("findMovieList");
		try {
			String queryString = "from Movie u where 1=1 ";
			
			 String movieName = request.getParameter("movieName");
			 String category = request.getParameter("category");
			  if(movieName!=null&&!movieName.equals("")){
				  queryString=queryString+" and u.movieName like :movieName";
			  }
			  if(category!=null&&!category.equals("")){
				  queryString=queryString+" and u.category like :category";
			  }
			  queryString=queryString+" order by u.showTime desc ";
			  Query qry = this.getCurrentSession().createQuery(queryString);
			  if(movieName!=null&&!movieName.equals("")){
				  qry.setParameter("movieName", "%"+movieName+"%");
			  }
			  if(category!=null&&!category.equals("")){
				  qry.setParameter("category", "%"+category+"%");
			  }
		        return qry
		    	.setFirstResult(pageNo) 
		 		.setMaxResults(pageSize) 
		 		.list();
		} catch (RuntimeException re) {
			log.error("findMovieList failed", re);
			throw re;
		}
	}
	
	@Override
	public Integer findCountMovieList(HttpServletRequest request) {
		log.debug("findMovieList");
		try {
			String queryString = "select count(u) from Movie u where 1=1 ";
			
			String movieName = request.getParameter("movieName");
			 String category = request.getParameter("category");
			  if(movieName!=null&&!movieName.equals("")){
				  queryString=queryString+" and u.movieName like :movieName";
			  }
			  if(category!=null&&!category.equals("")){
				  queryString=queryString+" and u.category like :category";
			  }
			  
			  Query qry = this.getCurrentSession().createQuery(queryString);
			  if(movieName!=null&&!movieName.equals("")){
				  qry.setParameter("movieName", "%"+movieName+"%");
			  }
			  if(category!=null&&!category.equals("")){
				  qry.setParameter("category", "%"+category+"%");
			  }
			Long l = (Long) qry.uniqueResult();
			return l.intValue();
		} catch (RuntimeException re) {
			log.error("findMovieList failed", re);
			throw re;
		}
	}
	
	public List<Object> findMovieBoxOffice(HttpServletRequest request, String dateType, String dateStr) {
		log.debug("findMovieBoxOffice");
		try {
			String queryString = "";
			if("day".equals(dateType)){
				queryString = "select movie.movieName,price from (select movie_id,sum(price) as price from sys_Order o where date_format(o.payTime,'%Y-%m-%d') = '"+dateStr+"' group by o.movie_id) as p left join sys_Movie movie on movie.id = p.movie_id order by price";
			}else if("mouth".equals(dateType)){
				queryString = "select movie.movieName,price from (select movie_id,sum(price) as price from sys_Order o where date_format(o.payTime,'%Y-%m') = '"+dateStr+"' group by o.movie_id) as p left join sys_Movie movie on movie.id = p.movie_id order by price";
			}else if("year".equals(dateType)){
				queryString = "select movie.movieName,price from (select movie_id,sum(price) as price from sys_Order o where date_format(o.payTime,'%Y') = '"+dateStr+"' group by o.movie_id) as p left join sys_Movie movie on movie.id = p.movie_id order by price";
			}else{
				queryString = "select movie.movieName,price from (select movie_id,sum(price) as price from sys_Order o where 1=1 group by o.movie_id) as p left join sys_Movie movie on movie.id = p.movie_id order by price";
			}
			
			
			Query qry = this.getCurrentSession().createSQLQuery(queryString);
			
			return qry
			    	.setFirstResult(0) 
			 		.setMaxResults(10) 
			 		.list();
		} catch (RuntimeException re) {
			log.error("findMovieBoxOffice failed", re);
			throw re;
		}
	}

	@Override
	public List<Movie> findMovieOrderList(String order, int pageNo, int pageSize) {
		try {
			String queryString = "from Movie u where 1=1 and u.flag =1 order by u."+order+" desc";
			
			Query qry = this.getCurrentSession().createQuery(queryString);
			  
			  
			return qry.setFirstResult(pageNo).setMaxResults(pageSize).list();
		} catch (RuntimeException re) {
			log.error("findMovieList failed", re);
			throw re;
		}
	}
	
}