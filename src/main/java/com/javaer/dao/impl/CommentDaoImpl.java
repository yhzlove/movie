package com.javaer.dao.impl;

import com.javaer.dao.ICommentDao;
import com.javaer.model.Comment;
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


@Repository("commentDao")
public class CommentDaoImpl  implements ICommentDao {
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

	private static final Logger log = LoggerFactory.getLogger(CommentDaoImpl.class);
	protected void initDao() {
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.ICommentDao#save(com.mav.domain.Comment)
	 */
	public void save(Comment transientInstance) {
		log.debug("saving Comment instance");
		try {
			this.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.ICommentDao#delete(com.mav.domain.Comment)
	 */
	public void delete(Comment persistentInstance) {
		log.debug("deleting Comment instance");
		try {
			this.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.ICommentDao#findById(java.lang.Integer)
	 */
	public Comment findById(java.lang.Integer id) {
		log.debug("getting Comment instance with id: " + id);
		try {
			Comment instance = (Comment) this.getCurrentSession().get(
					"com.javaer.model.Comment", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.ICommentDao#findByExample(com.mav.domain.Comment)
	 */
//	public List findByExample(Comment instance) {
//		log.debug("finding Comment instance by example");
//		try {
//			List results = getHibernateTemplate().findByExample(instance);
//			log.debug("find by example successful, result size: "
//					+ results.size());
//			return results;
//		} catch (RuntimeException re) {
//			log.error("find by example failed", re);
//			throw re;
//		}
//	}

	/* (non-Javadoc)
	 * @see com.mav.dao.ICommentDao#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Comment instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Comment as domain where domain."
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


	/* (non-Javadoc)
	 * @see com.mav.dao.ICommentDao#findAll()
	 */
	public List findAll() {
		log.debug("finding all Comment instances");
		try {
			String queryString = "from Comment";
			//this.getCurrentSession().beginTransaction();
			   Query qry = this.getCurrentSession().createQuery(queryString);
//			  qry.setParameter(0, value);
		        return qry.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.ICommentDao#merge(com.mav.domain.Comment)
	 */
	public Comment merge(Comment detachedInstance) {
		log.debug("merging Comment instance");
		try {
			Comment result = (Comment) this.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.ICommentDao#attachDirty(com.mav.domain.Comment)
	 */
	public void attachDirty(Comment instance) {
		log.debug("attaching dirty Comment instance");
		try {
			this.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.ICommentDao#attachClean(com.mav.domain.Comment)
	 */
	public void attachClean(Comment instance) {
		log.debug("attaching clean Comment instance");
		try {
			this.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

//	public static ICommentDao getFromApplicationContext(ApplicationContext ctx) {
//		return (ICommentDao) ctx.getBean("CommentDAO");
//	}

	@Override
	public List findByExample(Comment instance) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List findByName(Object name) {
		// TODO Auto-generated method stub
		return findByProperty("name", name);
	}

	@Override
	public List<Comment> findCommentList(HttpServletRequest request, int pageNo,
                                         int pageSize) {
		// TODO Auto-generated method stub
		log.debug("findCommentList");
		try {
			String queryString = "from Comment u where 1=1 ";
			
			 String movieName = request.getParameter("movieName");
			 String memberName = request.getParameter("memberName");
			 String memberId = request.getParameter("memberId");
			  if(movieName!=null&&!movieName.equals("")){
				  queryString=queryString+" and u.movie.movieName like :movieName";
			  }
			  if(memberName!=null&&!memberName.equals("")){
				  queryString=queryString+" and u.member.realName like :memberName";
			  }
			 if(memberId!=null&&!memberId.equals("")){
				queryString=queryString+" and u.member.id =:memberId";
			 }
			 queryString=queryString+" order by u.createTime desc";
			  Query qry = this.getCurrentSession().createQuery(queryString);
			  if(movieName!=null&&!movieName.equals("")){
				  qry.setParameter("movieName", "%"+movieName+"%");
			  }
			  if(memberName!=null&&!memberName.equals("")){
				  qry.setParameter("memberName", "%"+memberName+"%");
			  }
			  if(memberId!=null&&!memberId.equals("")){
					qry.setParameter("memberId", Integer.valueOf(memberId));
			  }
		        return qry
		    	.setFirstResult(pageNo) 
		 		.setMaxResults(pageSize) 
		 		.list();
		} catch (RuntimeException re) {
			log.error("findCommentList failed", re);
			throw re;
		}
	}
	
	@Override
	public Integer findCountCommentList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		log.debug("findCommentList");
		try {
			String queryString = "select count(u) from Comment u where 1=1 ";
			
			String movieName = request.getParameter("movieName");
			String memberName = request.getParameter("memberName");
			String memberId = request.getParameter("memberId");
			if(movieName!=null&&!movieName.equals("")){
				queryString=queryString+" and u.movie.movieName like :movieName";
			}
			if(memberName!=null&&!memberName.equals("")){
				queryString=queryString+" and u.member.realName like :memberName";
			}
			if(memberId!=null&&!memberId.equals("")){
				queryString=queryString+" and u.member.id =:memberId";
			}
			Query qry = this.getCurrentSession().createQuery(queryString);
			if(movieName!=null&&!movieName.equals("")){
				qry.setParameter("movieName", "%"+movieName+"%");
			}
			if(memberName!=null&&!memberName.equals("")){
				qry.setParameter("memberName", "%"+memberName+"%");
			}
			if(memberId!=null&&!memberId.equals("")){
				qry.setParameter("memberId", Integer.valueOf(memberId));
			}
			  
    		Long l = (Long) qry.uniqueResult();
    		return l.intValue();
		} catch (RuntimeException re) {
			log.error("findCommentList failed", re);
			throw re;
		}
	}
}