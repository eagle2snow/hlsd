package com.fh.util.token;

/**
 * 核心类Jwt实现Token的生成、验证机制
 * fileName: Jwt.java
 * @author zhangWenchao
 * @Created on 2017年05月02日 下午20:58:35
 * @version 1.0
 */
public enum TokenState {
	/**
	 * 过期,不需要重新登录
	 */
	EXPIRED("EXPIRED"),
	/**
	/**
	 * 过期或未登录过非法请求token认证令牌,需要重新登录
	 */
	EXPIRED_LOGIN("EXPIRED_LOGIN"),
	/**
	 * 无效(token不合法)
	 */
	INVALID("INVALID"),
	
	/**
	 * 无效( token 和 userId、serviceNo 不一致)
	 */
	DIFFER("DIFFER"),
	/**
	 * 有效的
	 */
	VALID("VALID");

	private String state;

	private TokenState(String state) {
		this.state = state;
	}

	/**
	 * 根据状态字符串获取token状态枚举对象
	 * 
	 * @param tokenState
	 * @return
	 */
	public static TokenState getTokenState(String tokenState) {
		TokenState[] states = TokenState.values();
		TokenState ts = null;
		for (TokenState state : states) {
			if (state.toString().equals(tokenState)) {
				ts = state;
				break;
			}
		}
		return ts;
	}

	public String toString() {
		return this.state;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
