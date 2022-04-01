// You are climbing a stair case. It takes n steps to reach to the top.

// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

// Note: Given n will be a positive integer.

// Example 1:


// Input: 2
// Output: 2
// Explanation: There are two ways to climb to the top.
// 1. 1 step + 1 step
// 2. 2 steps

// Example 2:


// Input: 3
// Output: 3
// Explanation: There are three ways to climb to the top.
// 1. 1 step + 1 step + 1 step
// 2. 1 step + 2 steps
// 3. 2 steps + 1 step


// function thisManyWays(n) {
//   let nums = [1, 2];
//   let clength = n;
//   let result = [];    

// }

// console.log(thisManyWays(4)) 

function generateCombinations(array, length) {
  var result = [];
  array.forEach(function iter(a) {
      var r = this.concat(a);
      if (r.length === length) {
          result.push(r);
          return;
      }
      array.forEach(iter, r);
  }, []);
  return result;
}

console.log(generateCombinations([1, 2, 3, 4, 5, 6], 3));


// Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

// Example:


// Input: [0,1,0,3,12]
// Output: [1,3,12,0,0]
// Note:

// Minimize the total number of operations.