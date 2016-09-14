package com.wangsong.service;

import java.util.List;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.Queue;
import javax.jms.Topic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangsong.dao.MUserMapper;
import com.wangsong.model.MUser;
import com.wangsong.service.MMessageServiceI;

@Service("mmessageService")
public class MMessageServiceImpl implements MMessageServiceI{
	@Autowired
	private MUserMapper muserMapper;
	
	 /**
     * spring消息发送模版
     */
    @Resource(name="queueJmsTemplate")
    private JmsTemplate jmsTemplate;

    /**
     * 消息目的地
     */
    @Resource(name = "queueDestination")
    private Queue defaultDestination;
 
	@Override
	public List<MUser> getAll() {
		return muserMapper.getAll();
	}
	@Transactional
	@Override
	public int insert(MUser muser) {
		int i = muserMapper.insert(muser);
		if(muser.getName().equals("1")){
			throw new RuntimeException();
		}
		return i;
	}

	@Override
	public int update(MUser muser) {
		
		return muserMapper.updateByPrimaryKey(muser);
	}

	@Override
	public int delete(String id) {
	
		return muserMapper.deleteByPrimaryKey(id);
	}

	@Override
	public MUser selectByPrimaryKey(String id) {
		
		return muserMapper.selectByPrimaryKey(id);
	}
	@Override
	public void activemq(MUser muser) {
		jmsTemplate.convertAndSend(this.defaultDestination, muser);
		
	}
	
    public void receive(MUser personInfo) throws JMSException {
        System.out.println();
        System.out.println("【消费者QueueReceiver3】收到queue的消息—->personInfo的用户名是:"  + personInfo.getName());
        activemq(personInfo);
    }
}
