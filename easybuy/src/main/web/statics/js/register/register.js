/**
 * Created by bdqn on 2016/5/3.
 */
function register() {
	//��ȡ����ֶε�ֵ
	var loginName = $("input[name='loginName']").val();
	var userName = $("input[name='userName']").val();
	var password = $("input[name='password']").val();
	var confirmPassword = $("input[name='confirmPassword']").val();
	var email = $("input[name='email']").val();
	var mobile = $("input[name='mobile']").val();
	var identityCode = $("input[name='identityCode']").val();
	var address = $("input[name='address']").val();
	var sex = $("input[name='sex']:checked").val();
	//�ж������Ƿ�һ��
	if (loginName == null || loginName == "") {
		showMessage("�û�������Ϊ��.");
		return;
	}

	if (loginName.length < 2 || loginName > 10) {
		showMessage("��¼������С�������ַ����ߴ���ʮ���ַ�.");
		return;
	}

	if (userName == null || userName == "") {
		showMessage("��ʵ��������Ϊ��.");
		return;
	}

	if (userName.length < 2 || userName > 10) {
		showMessage("��ʵ��������С�������ַ����ߴ���ʮ���ַ�.");
		return;
	}

	if (password != confirmPassword) {
		showMessage("������������벻һ��.");
		return;
	}
	//�ж������Ƿ�Ϊ��
	if (password == "") {
		showMessage("���벻��Ϊ��");
		return;
	}
	//��֤�����ʽ
	if (email != null && email != "" && !checkMail(email)) {
		showMessage("�����ʽ����ȷ");
		return;
	}
	//��֤�����ʽ
	if (mobile != null && mobile != "" && !checkMobile(mobile)) {
		showMessage("�ֻ���ʽ����ȷ");
		return;
	}
	//��֤�����ʽ
	if (identityCode != null && identityCode != ""
			&& !checkIdentityCode(identityCode)) {
		showMessage("���֤�Ÿ�ʽ����ȷ");
		return;
	}

	$.ajax( {
		url : contextPath + "/Register",
		method : "post",
		data : {
			action : "login",
			loginName : loginName,
			userName : userName,
			password : password,
			sex : sex,
			email : email,
			mobile : mobile,
			action : 'saveUserToDatabase',
			identityCode : identityCode,
			address : address
		},
		success : function(jsonStr) {
			var result = eval("(" + jsonStr + ")");
			if (result.status == 1) {
				showMessage(result.message);
				window.location.href = contextPath + "/Login?action=toLogin";
			} else {
				showMessage(result.message);
			}
		}
	})
}

function checkMail(mail) {
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (filter.test(mail))
		return true;
	else {
		return false;
	}
}

function checkMobile(phone) {
	var filter = /^\d{5,11}$/;
	if (filter.test(phone))
		return true;
	else {
		return false;
	}
}

function checkIdentityCode(identityCode) {
	var filter = /^\w{18}$/;
	if (filter.test(identityCode))
		return true;
	else {
		return false;
	}
}
