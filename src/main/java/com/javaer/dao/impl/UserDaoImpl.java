package com.javaer.dao.impl;

import com.javaer.dao.IUserDao;
import com.javaer.model.User;
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


@Repository("userDao")
public class UserDaoImpl  implements IUserDao {
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

	private static final Logger log = LoggerFactory.getLogger(UserDaoImpl.class);
	protected void initDao() {
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IUserDao#save(com.mav.domain.User)
	 */
	public void save(User transientInstance) {
		log.debug("saving User instance");
		try {
			this.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IUserDao#delete(com.mav.domain.User)
	 */
	public void delete(User persistentInstance) {
		log.debug("deleting User instance");
		try {
			this.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IUserDao#findById(java.lang.Integer)
	 */
	public User findById(java.lang.Integer id) {
		log.debug("getting User instance with id: " + id);
		try {
			User instance = (User) this.getCurrentSession().get(
					"com.javaer.model.User", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IUserDao#findByExample(com.mav.domain.User)
	 */
//	public List findByExample(User instance) {
//		log.debug("finding User instance by example");
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
	 * @see com.mav.dao.IUserDao#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding User instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from User as domain where domain."
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
	 * @see com.mav.dao.IUserDao#findByName(java.lang.Object)
	 */
//	public List findByName(Object name) {
//		return findByProperty(NAME, name);
//	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IUserDao#findByAge(java.lang.Object)
	 */
//	public List findByAge(Object age) {
//		return findByProperty(AGE, age);
//	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IUserDao#findByDeptId(java.lang.Object)
	 */
//	public List findByDeptId(Object deptId) {
//		return findByProperty(DEPT_ID, deptId);
//	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IUserDao#findAll()
	 */
	public List findAll() {
		log.debug("finding all User instances");
		try {
			String queryString = "from User";
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
	 * @see com.mav.dao.IUserDao#merge(com.mav.domain.User)
	 */
	public User merge(User detachedInstance) {
		log.debug("merging User instance");
		try {
			User result = (User) this.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IUserDao#attachDirty(com.mav.domain.User)
	 */
	public void attachDirty(User instance) {
		log.debug("attaching dirty User instance");
		try {
			this.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IUserDao#attachClean(com.mav.domain.User)
	 */
	public void attachClean(User instance) {
		log.debug("attaching clean User instance");
		try {
			this.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

//	public static IUserDao getFromApplicationContext(ApplicationContext ctx) {
//		return (IUserDao) ctx.getBean("UserDAO");
//	}

	@Override
	public List findByExample(User instance) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List findByUserName(Object userName) {
		// TODO Auto-generated method stub
		return findByProperty("userName", userName);
	}

	@Override
	public List<User> findUserList(HttpServletRequest request, int pageNo,
                                   int pageSize) {
		// TODO Auto-generated method stub
		log.debug("findUserList");
		try {
			String queryString = "from User u where 1=1 ";
			//this.getCurrentSession().beginTransaction();
			
			  String userName = request.getParameter("userName");
			  String realName = request.getParameter("realName");
			  if(userName!=null&&!userName.equals("")){
				  queryString=queryString+" and u.userName like :username";
			  }
			  if(realName!=null&&!realName.equals("")){
				  queryString=queryString+" and u.realName like :realName";
			  }
			  Query qry = this.getCurrentSession().createQuery(queryString);
			  if(userName!=null&&!userName.equals("")){
				  qry.setParameter("username", "%"+userName+"%");
			  }
			  if(realName!=null&&!realName.equals("")){
				  qry.setParameter("realName", "%"+realName+"%");
			  }
		        return qry
		    	.setFirstResult(pageNo) 
		 		.setMaxResults(pageSize) 
		 		.list();
		} catch (RuntimeException re) {
			log.error("findUserList failed", re);
			throw re;
		}
	}
	
	@Override
	public Integer findCountUserList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		log.debug("findUserList");
		try {
			String queryString = "select count(u) from User u where 1=1 ";
			//this.getCurrentSession().beginTransaction();
			
			  String userName = request.getParameter("userName");
			  String realName = request.getParameter("realName");
			  if(userName!=null&&!userName.equals("")){
				  queryString=queryString+" and u.userName like :username";
			  }
			  if(realName!=null&&!realName.equals("")){
				  queryString=queryString+" and u.realName like :realName";
			  }
			  Query qry = this.getCurrentSession().createQuery(queryString);
			  if(userName!=null&&!userName.equals("")){
				  qry.setParameter("username", "%"+userName+"%");
			  }
			  if(realName!=null&&!realName.equals("")){
				  qry.setParameter("realName", "%"+realName+"%");
			  }
		        		Long l = (Long) qry.uniqueResult();
		        		return l.intValue();
		} catch (RuntimeException re) {
			log.error("findUserList failed", re);
			throw re;
		}
	}
}