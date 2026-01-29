class Solution:
    def buildArray(self, nums: List[int]) -> List[int]:
        result = []
        for i in range(len(nums)):
            result.append(nums[nums[i]])
        return result
        
"""
nums = 0, 2, 1, 5, 3, 4
idx =. 0, 1, 2, 3, 4, 5

nums[nums[0]] =nums[0] = 0
nums[nums[1]] =nums[2] = 1
nums[nums[2]] =nums[1] = 2
nums[nums[3]] =nums[5] = 4
nums[nums[4]] =nums[3] = 5
nums[nums[5]] =nums[4] = 3

0,1,2,4,5,3
"""