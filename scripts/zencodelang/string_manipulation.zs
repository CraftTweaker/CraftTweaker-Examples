var test = "minecraft:oak_slab";

var x as usize = test.indexOf(":");
var y = test.length;
println(x);
println(y);
println(test[x .. y]);