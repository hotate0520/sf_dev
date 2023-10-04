public class AccountQueryAction {
   @InvocableMethod(
       label='タスク作成' 
       description='取引先の状況によってタスクを作成します' 
       category='Account')
   public static void createTask(List<ID> ids) {
       List<Task> taskList = new List<Task>();
       for(Id i : ids){
           Task tsk = new Task();
           tsk.Subject = 'プロセスビルダーからのタスク';
           tsk.Status = 'Open';
           tsk.Priority = 'Normal';
           tsk.WhatId = i;
           taskList.add(tsk);
       }
       insert taskList;
       System.debug('■■プロセスビルダーからのタスク作成■■');
  }
}