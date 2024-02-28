public with sharing class Util {
    public static String getSObjectTypeName(SObject so) {
		return so.getSObjectType().getDescribe().getName();
	}
}