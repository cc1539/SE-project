/**
 * written, tested, and debugged by: Christopher Cheng
 */

class CarSpace {
	
	constructor() {
		this.state = "empty";
		this.account = null;
		this.disabled = false;
	}
	
	setAccount(value) { this.account = value; }
	setState(value) { this.state = value; }
	setDisabled(value) { this.disabled = value; }
	
	getAccount() { return this.account; }
	getState() { return this.state; }
	getDisabled() { return this.disabled; }
}
