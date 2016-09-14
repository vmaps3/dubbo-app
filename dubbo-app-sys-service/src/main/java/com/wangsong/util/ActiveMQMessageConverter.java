package com.wangsong.util;

import java.io.Serializable;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.ObjectMessage;
import javax.jms.Session;

import org.apache.activemq.command.ActiveMQObjectMessage;
import org.springframework.jms.support.converter.MessageConverter;
import org.springframework.stereotype.Component;

import com.wangsong.model.MUser;

/**
 * 消息转换器
 * 
 * 作者: zhoubang 
 * 日期：2015年9月28日 下午12:17:11
 */
@Component("activeMQMessageConverter")
public class ActiveMQMessageConverter implements MessageConverter {
    
    /**
     * 将发送的实体bean对象封装为Message消息
     *  对已经实现MessageListener接口的消费者产生作用
     * 
     * 作者: zhoubang 
     * 日期：2015年9月28日 上午10:46:31
     * @param obj
     * @param session
     * @return
     * @throws JMSException
     * (non-Javadoc)
     * @see org.springframework.jms.support.converter.MessageConverter#toMessage(java.lang.Object, javax.jms.Session)
     */
    public Message toMessage(Object obj, Session session) throws JMSException {
        ActiveMQObjectMessage msg = (ActiveMQObjectMessage) session.createObjectMessage();
        msg.setObject( (Serializable) obj);
        return msg;
    }
    
    /**
     * 将消息对象转换为对应的实体bean并返回
     *  只对未实现MessageListener接口的消息消费者产生作用，其他的已经实现MessageListener接口的，不会执行该方法
     * 
     * 作者: zhoubang 
     * 日期：2015年9月28日 上午10:46:59
     * @param message
     * @return
     * @throws JMSException
     * (non-Javadoc)
     * @see org.springframework.jms.support.converter.MessageConverter#fromMessage(javax.jms.Message)
     */
    public Object fromMessage(Message message) throws JMSException {
            ActiveMQObjectMessage aMsg = (ActiveMQObjectMessage) message;
            return aMsg.getObject();
    }

    
}
