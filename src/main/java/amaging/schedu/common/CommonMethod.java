package amaging.schedu.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;


public class CommonMethod {
	
	@Autowired
	protected ProjectUtils pu;
	@Autowired
	protected Encryption enc;
	@Autowired
	protected DataSourceTransactionManager tx;
	protected TransactionStatus txStatus;
	protected DefaultTransactionDefinition txDef;
	public CommonMethod() {
	}
	public boolean convertToBoolean(int number) {
		return number>0?true:false;
	}
	protected void setTransactionConf(int propa, int iso, boolean isRead) {
		this.txDef= new DefaultTransactionDefinition();
		this.txDef.setPropagationBehavior(propa);
		this.txDef.setIsolationLevel(iso);
		this.txDef.setReadOnly(isRead);
		this.txStatus=this.tx.getTransaction(txDef);
	}
	protected void setTransactionEnd(boolean tran){
		if(tran)this.tx.commit(txStatus);
		else this.tx.rollback(txStatus);
	}
}
