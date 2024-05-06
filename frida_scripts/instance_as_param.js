//Target Application: ../apks/fridaInstAsParam.apk

Java.perform(function () {
  //getting the Item class reference
  var itemClassReference = Java.use('com.apphacking.fridainstance.Item')
  //using the reference to create an Instance: Item item = new Item(int i);
  var itemInstance = itemClassReference.$new(10000)

  // getting the Boss class reference
  var bossClassReference = Java.use('com.apphacking.fridainstance.Boss')
  //using the reference to create an Instance and pass Item Instance as param: Boss boss = new Boss(Item item);
  var bossInstance = bossClassReference(itemInstance)

})
