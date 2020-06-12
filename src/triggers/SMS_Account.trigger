trigger SMS_Account on Account (after insert) {
    Map<Id,Account> newMap=Trigger.newMap;
    Set<Id> keys=newMap.keySet();
	Http_SMS_Example.afterInsert(keys);
}