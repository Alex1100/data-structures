import copy

class HashTable:

    def initiateHashTable(self):
        for i in range(self.limit):
            self.outerHash.append([])

    def __init__(self, limit):
        self.outerHash = []
        self.limit = limit
        self.count = 0
        self.initiateHashTable()


    def insert (self, k, v):
        if self.count >= self.limit * 0.75:
            backup = copy.copy(self.outerHash)
            self.outerHash = []
            self.limit += self.limit
            self.count = 0

            self.initiateHashTable()

            for bucket in backup:
                if len(bucket):
                    for el in bucket:
                        self.insert(el[0], el[1])
                        #self.count = self.count + 1
        print("K:" + str(k))
        index = self.hash(k)
        bucket = self.outerHash[index]

        if len(bucket):
            for el in bucket:
                if el[0] == k:
                    el[1] = v
                    return
        bucket.append((k,v))
        self.count = self.count + 1
        print("Appended. Count now:" + str(self.count))

    def get(self, k):
        index = self.hash(k)
        bucket = self.outerHash[index]

        for i in range(len(bucket)):
            if bucket[i][0] == k:
                return bucket[i][1]
        return 'not found'

    def hash(self, k):
        #get sum of strings ascii value and mod it
        #or use length of string and mod it
        if type(k) is str:
            return int(len(k)) % self.limit
        else:
            return int(k) % self.limit



coolHash = HashTable(1)
print(coolHash.count)
coolHash.insert('abc',1)
print(coolHash.count)
coolHash.insert('xyz',2)
print(coolHash.count)

print("Get Test")
print(coolHash.get('abc'))
print(coolHash.get('xyz'))
print(coolHash.get(3))
