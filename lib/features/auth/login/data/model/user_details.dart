class UserDetails {
  UserDetails({
      this.httpschemasxmlsoaporgws200505identityclaimsname, 
      this.jti, 
      this.httpschemasxmlsoaporgws200505identityclaimsemailaddress, 
      this.httpschemasxmlsoaporgws200505identityclaimsnameidentifier, 
      this.httpschemasmicrosoftcomws200806identityclaimsrole, 
      this.exp, 
      this.iss, 
      this.aud,});

  UserDetails.fromJson(dynamic json) {
    httpschemasxmlsoaporgws200505identityclaimsname = json['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'];
    jti = json['jti'];
    httpschemasxmlsoaporgws200505identityclaimsemailaddress = json['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'];
    httpschemasxmlsoaporgws200505identityclaimsnameidentifier = json['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'];
    httpschemasmicrosoftcomws200806identityclaimsrole = json['http://schemas.microsoft.com/ws/2008/06/identity/claims/role'];
    exp = json['exp'];
    iss = json['iss'];
    aud = json['aud'];
  }
  String? httpschemasxmlsoaporgws200505identityclaimsname;
  String? jti;
  String? httpschemasxmlsoaporgws200505identityclaimsemailaddress;
  String? httpschemasxmlsoaporgws200505identityclaimsnameidentifier;
  String? httpschemasmicrosoftcomws200806identityclaimsrole;
  num? exp;
  String? iss;
  String? aud;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'] = httpschemasxmlsoaporgws200505identityclaimsname;
    map['jti'] = jti;
    map['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'] = httpschemasxmlsoaporgws200505identityclaimsemailaddress;
    map['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'] = httpschemasxmlsoaporgws200505identityclaimsnameidentifier;
    map['http://schemas.microsoft.com/ws/2008/06/identity/claims/role'] = httpschemasmicrosoftcomws200806identityclaimsrole;
    map['exp'] = exp;
    map['iss'] = iss;
    map['aud'] = aud;
    return map;
  }

}