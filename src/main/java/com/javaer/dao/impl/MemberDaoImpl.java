package com.javaer.dao.impl;

import com.javaer.dao.IMemberDao;
import com.javaer.model.Member;
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


@Repository("memberDao")
public class MemberDaoImpl  implements IMemberDao {
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

	private static final Logger log = LoggerFactory.getLogger(MemberDaoImpl.class);
	protected void initDao() {
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IMemberDao#save(com.mav.domain.Member)
	 */
	public void save(Member transientInstance) {
		log.debug("saving Member instance");
		try {
			this.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IMemberDao#delete(com.mav.domain.Member)
	 */
	public void delete(Member persistentInstance) {
		log.debug("deleting Member instance");
		try {
			this.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IMemberDao#findById(java.lang.Integer)
	 */
	public Member findById(java.lang.Integer id) {
		log.debug("getting Member instance with id: " + id);
		try {
			Member instance = (Member) this.getCurrentSession().get(
					"com.javaer.model.Member", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IMemberDao#findByExample(com.mav.domain.Member)
	 */
//	public List findByExample(Member instance) {
//		log.debug("finding Member instance by example");
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
	 * @see com.mav.dao.IMemberDao#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Member instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Member as domain where domain."
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
	 * @see com.mav.dao.IMemberDao#findByName(java.lang.Object)
	 */
//	public List findByName(Object name) {
//		return findByProperty(NAME, name);
//	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IMemberDao#findByAge(java.lang.Object)
	 */
//	public List findByAge(Object age) {
//		return findByProperty(AGE, age);
//	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IMemberDao#findByDeptId(java.lang.Object)
	 */
//	public List findByDeptId(Object deptId) {
//		return findByProperty(DEPT_ID, deptId);
//	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IMemberDao#findAll()
	 */
	public List findAll() {
		log.debug("finding all Member instances");
		try {
			String queryString = "from Member";
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
	 * @see com.mav.dao.IMemberDao#merge(com.mav.domain.Member)
	 */
	public Member merge(Member detachedInstance) {
		log.debug("merging Member instance");
		try {
			Member result = (Member) this.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IMemberDao#attachDirty(com.mav.domain.Member)
	 */
	public void attachDirty(Member instance) {
		log.debug("attaching dirty Member instance");
		try {
			this.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IMemberDao#attachClean(com.mav.domain.Member)
	 */
	public void attachClean(Member instance) {
		log.debug("attaching clean Member instance");
		try {
			this.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

//	public static IMemberDao getFromApplicationContext(ApplicationContext ctx) {
//		return (IMemberDao) ctx.getBean("MemberDAO");
//	}

	@Override
	public List findByExample(Member instance) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List findByMemberName(Object userName) {
		// TODO Auto-generated method stub
		return findByProperty("userName", userName);
	}

	@Override
	public List<Member> findMemberList(HttpServletRequest request, int pageNo,
                                       int pageSize) {
		// TODO Auto-generated method stub
		log.debug("findMemberList");
		try {
			String queryString = "from Member u where 1=1 ";
			//this.getCurrentSession().beginTransaction();
			
			  String userName = request.getParameter("userName");
			  String realName = request.getParameter("realName");
			  if(userName!=null&&!userName.equals("")){
				  queryString=queryString+" and u.userName like :userName";
			  }
			  if(realName!=null&&!realName.equals("")){
				  queryString=queryString+" and u.realName like :realName";
			  }
			  Query qry = this.getCurrentSession().createQuery(queryString);
			  if(userName!=null&&!userName.equals("")){
				  qry.setParameter("userName", "%"+userName+"%");
			  }
			  if(realName!=null&&!realName.equals("")){
				  qry.setParameter("realName", "%"+realName+"%");
			  }
		        return qry
		    	.setFirstResult(pageNo) 
		 		.setMaxResults(pageSize) 
		 		.list();
		} catch (RuntimeException re) {
			log.error("findMemberList failed", re);
			throw re;
		}
	}
	
	@Override
	public Integer findCountMemberList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		log.debug("findMemberList");
		try {
			String queryString = "select count(u) from Member u where 1=1 ";
			//this.getCurrentSession().beginTransaction();
			
			  String userName = request.getParameter("userName");
			  String realName = request.getParameter("realName");
			  if(userName!=null&&!userName.equals("")){
				  queryString=queryString+" and u.userName like :userName";
			  }
			  if(realName!=null&&!realName.equals("")){
				  queryString=queryString+" and u.realName like :realName";
			  }
			  Query qry = this.getCurrentSession().createQuery(queryString);
			  if(userName!=null&&!userName.equals("")){
				  qry.setParameter("userName", "%"+userName+"%");
			  }
			  if(realName!=null&&!realName.equals("")){
				  qry.setParameter("realName", "%"+realName+"%");
			  }
			  
    		Long l = (Long) qry.uniqueResult();
    		return l.intValue();
		} catch (RuntimeException re) {
			log.error("findMemberList failed", re);
			throw re;
		}
	}
}