Array.prototype.uniq = function(){
  let arr = [];
  for (let i = 0; i < this.length; i++){
    if (arr.indexOf(this[i]) === -1){
      arr.push(this[i]);
    }
  }
  return arr;
}

console.log([1, 1, 2, 2, 3, 3, 4, 4, 5, 5].uniq());


Array.prototype.twoSum = function(){
  let pairs = [];
  for (let i = 0; i < this.length; i++){
    for (let j = i + 1; j < this.length; j++){
      if (this[i] + this[j] === 0){
        pairs.push([i, j]);
      }
    }
  }
  return pairs;
}

console.log([-1, 0, 2, -2, 1].twoSum());