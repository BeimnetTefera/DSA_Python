class Solution:
    def isCovered(self, ranges: List[List[int]], left: int, right: int) -> bool:
        ranges.sort()
        curr = left
        for min_range, max_range in ranges:
            if min_range > curr:
                return False

            if max_range >= curr:
                curr = max_range + 1

            if curr > right:
                return True

        return curr > right
