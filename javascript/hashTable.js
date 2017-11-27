const LimitedArray = function (limit) {
  let storage = [];

  let limitedArray = {};
  limitedArray.get = function (index) {
    checkLimit(index);
    return storage[index];
  };
  limitedArray.set = function (index, value) {
    checkLimit(index);
    storage[index] = value;
  };
  limitedArray.each = function (callback) {
    for (let i = 0; i < storage.length; i++) {
      callback(storage[i], i, storage);
    }
  };

  const checkLimit = function (index) {
    if (typeof index !== 'number') {
      throw new Error('setter requires a numeric index for its first argument');
    }
    if (limit <= index) {
      throw new Error('Error trying to access an over-the-limit index');
    }
  };

  return limitedArray;
};


const getIndexBelowMaxForKey = function (str, max) {
  let hash = 0;
  for (let i = 0; i < str.length; i++) {
    hash = (hash << 5) + hash + str.charCodeAt(i);
    hash = hash & hash;
    hash = Math.abs(hash);
  }

  return hash % max;
};


const HashTable = function () {
  this._limit = 8;
  this._storage = LimitedArray(this._limit);
  this._entries = 0;
};

HashTable.prototype.insert = function (k, v){
  var i = getIndexBelowMaxForKey(k, this._limit);
  if (!this._storage[i]) {
    this._storage[i] = [];
    this._storage[i].push([k,v]);
    this._entries++;
  } else if (this._storage[i].some(el => el[0] === k)) {
    this._storage[i].map((el, i) => {
      if (el[0] === k) {
        el[1] = v;
      }
    });
  } else {
    this._storage[i].push([k, v]);
    this._entries++;
  }
  if (this._entries > 0.75 * this._limit ) {
    this._limit *= 2;
    this._storage = changeHash(this._limit, this._storage);
  }
};

HashTable.prototype.retrieve = function (k) {
  var i = getIndexBelowMaxForKey(k, this._limit);
  if (this._storage[i]) {
    var bucket = this._storage[i];
    for (var j = 0; j < bucket.length; j++) {
      if (bucket[j][0] === k) {
        return bucket[j][1];
      }
    }
  }
};

HashTable.prototype.remove = function (k) {
  var i = getIndexBelowMaxForKey(k, this._limit);
  if (this._storage[i]) {
    var bucket = this._storage[i];
    for (var j = 0; j < bucket.length; j++) {
      if (bucket[j][0] === k) {
        var value = bucket[j][1];
        this._storage[i] = this._storage[i].filter(el => el[0] !== k && el[1] !== value);
        this._entries--;
        if (this._entries < 0.25 * this._limit) {
          this._limit /= 2;
          this._storage = changeHash(this._limit, this._storage);
        }

        return value;
      }
    }
  }
};

function changeHash(newLimit, oldStorage) {
  let newStorage = LimitedArray(newLimit);
  let bucketHashNumbers = Object.keys(oldStorage);
  bucketHashNumbers.forEach((bucketHash) => {
    let bucket = oldStorage[bucketHash];
    if (Array.isArray(bucket)) {
      bucket.forEach((keyvalue) => {
        let key = keyvalue[0];
        let value = keyvalue[1];
        let i = getIndexBelowMaxForKey(key, newLimit);
        if (!newStorage[i]) {
          newStorage[i] = [];
        }

        newStorage[i].push([key,value]);
      });
    }
  })
  return newStorage;
}
