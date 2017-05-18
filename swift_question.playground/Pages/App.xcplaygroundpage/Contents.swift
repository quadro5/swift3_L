//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// 4. Median of Two Sorted Arrays Add to List

/* class Solution {
    public:
    
    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {
        int sum = nums1.size() + nums2.size();
        double ret;
        // test total size is odd or even
        // for odd size
        if (sum & 1) {
            ret = findKth(nums1, nums2, 0, 0, sum / 2 + 1);
        } else {
            // for even size
            ret = ((findKth(nums1, nums2, 0, 0, sum / 2)) +
                findKth(nums1, nums2, 0, 0, sum / 2 + 1)) / 2.0;
        }
        return ret;
    }
    double findKth(vector<int>& A, vector<int>& B, int A_st, int B_st, int k) {
        // consider the boundary condition, if any array is empty
        if (A_st >= A.size()) {
            return B[B_st + k - 1];
        }
        if (B_st >= B.size()) {
            return A[A_st + k - 1];
        }
        // when k == 1, min value of we find is the median
        if (k == 1) {
            return min(A[A_st], B[B_st]);
        }
        int A_key = A_st + k / 2 - 1 >= A.size() ? INT_MAX : A[A_st + k / 2 - 1];
        int B_key = B_st + k / 2 - 1 >= B.size() ? INT_MAX : B[B_st + k / 2 - 1];
        if (A_key < B_key) {
            return findKth(A, B, A_st + k / 2, B_st, k - k / 2);
        } else {
            return findKth(A, B, A_st, B_st + k / 2, k - k / 2);
        }
    }
};
*/


// 28 strStr

/*
class Solution {
    public:
    int strStr(const char *source, const char *target) {
        // write your code here
        if ( !target || !source ) {
            return -1;
        }
        if( strlen(target) == 0 ){
            return 0;
        }
        int n = strlen(source) - strlen(target) + 1;
        for(int i = 0 ; i<n; ++i){
            if(source[i] == target[0]){
                //test substr
                int j = 1;
                for( ; j < strlen(target); ++j ){
                    if( source[i+j] != target[j] ){
                        break;
                    }
                }
                // without break occurring
                if( j == strlen(target) ){
                    return i;
                }
            }
        }
        return -1;
    }
};
*/

// 36. Valid Sudoku

/* 
Three flags are used to check whether a number appear.
used1: check each row
used2: check each column
used3: check each sub-boxes
*/
/*
class Solution {
public:
    bool isValidSudoku(vector<vector<char> > &board) {
        int used1[9][9] = {0}; // row
        int used2[9][9] = {0}; // column
        int used3[9][9] = {0}; // 3*3 box

        for(int i = 0; i < board.size(); ++ i) {
            for(int j = 0; j < board[i].size(); ++ j)
                    if(board[i][j] != '.') {
                    // get number -> index
                        int num = board[i][j] - '0' - 1,
                        k = i / 3 * 3 + j / 3;
                        if(used1[i][num] || used2[j][num] || used3[k][num]) {
                            return false;
                        }
                        used1[i][num] = used2[j][num] = used3[k][num] = 1;
                    }
            }
        }
        return true;
    }
};
*/



// 42	Trapping Rain Water
    // two pass
    // one pass

// 48	Rotate Image

// 69	Sqrt(x)

// 70	Climbing Stairs
    // dp



// 102	Binary Tree Level Order Traversal
    // bfs + count depth
/*
class Solution {
public:
 vector<vector<int>> levelOrder(TreeNode *root) {
    // write your code here
    vector<vector<int>> result;
    if (!root) {
        return result;
    }
    int order = 0;
    int count = 1;
    queue<TreeNode*> q;
    q.push(root);
    while (!q.empty()) {
        TreeNode* cur = q.front();
        q.pop();
        count--;
        
        if (order+1 > result.size()) {
            result.push_back(vector<int>(1, cur->val));
        } else {
            result[order].push_back(cur->val);
        }
        if (cur->left) {
            q.push(cur->left);
        }
        if (cur->right) {
            q.push(cur->right);
        }
        if (count < 1) {
            ++order;
            count = q.size();
        }
        
    }
    return result;
 }
};
*/




// 104	Maximum Depth of Binary Tree
/*
class Solution {
    public:
    /**
     * @param root: The root of binary tree.
     * @return: An integer
     */
    int maxDepth(TreeNode *root) {
        // write your code here
        if (!root) {
            return 0;
        }
        // get max depth from left and right
        return max(maxDepth(root->left), maxDepth(root->right))+1;
    }
};
*/

// 118	Pascal's Triangle

// 147	Max Points on a Line

// 151	Reverse Words in a String

// 165	Compare Version Numbers

// 190	Reverse Bits

// 191	Number of 1 Bits

// 206	Reverse Linked List
/*
// iterator version
ListNode *reverse(ListNode *head) {
    // write your code here
    if (!head) {
        return nullptr;
    }
    ListNode* cur = nullptr;
    while (head) {
        ListNode* tmp = head->next;
        head->next = cur;
        cur = head;
        head = tmp;
    }
    return cur;
}
// recursive version
ListNode* reverse(ListNode* head) {
    if (!head) {
        return nullptr;
    }
    return helper(head, nullptr);
}
ListNode* helper(ListNode* head, ListNode* tail) {
    if (!head) {
        return tail;
    }
    ListNode* tmp = head->next;
    head->next = tail;
    tail = head;
    return helper(tmp, tail);
}
*/
 
 

// 207	Course Schedule

// 215	Kth Largest Element in an Array
    // quick select
    // maxHeap
/*
class Solution {
    public:
    /**
     * @param nums an integer unsorted array
     * @param k an integer from 1 to n
     * @return the kth largest element
     */
    int kthLargestElement2(vector<int> nums, int k) {
        // Write your code here
        priority_queue<int, vector<int>, greater<int> > que;
        int n = nums.size();
        for(int i = 0; i < n; i ++) {
            if(que.size() == k) {
                if(nums[i] > que.top()) {
                    que.pop();
                    que.push(nums[i]);
                }
            }else {
                que.push(nums[i]);
            }
        }
        return que.top();
    }
};
*/



// 221	Maximal Square
    //
/*
int maxSquare(vector<vector<int> > &matrix) {
    // write your code here
    int m = matrix.size(), 
    int n = matrix[0].size();
    vector<vector<int> > f(m, vector<int>(n));
    for (int i=0; i<n; ++i) {
        f[0][i] = matrix[0][i];
    }
    for (int i=1; i<m; ++i) {
        f[i][0] = matrix[i][0];
    }
    for (int i=1; i<m; ++i) {
        for (int j=1; j<n; ++j) {
            if (matrix[i][j]==0) {
               f[i][j] = 0;
            } else {
                f[i][j] = 1 + min(f[i-1][j], min(f[i-1][j-1], f[i][j-1]));
            }
        }
    }
    int ans = 0;
    for (int i=0; i<m; ++i) {
        for (int j=0; j<n; ++j) {
            ans = max(ans, f[i][j]);
        }
    }
    return ans*ans;
}
*/



// 236	Lowest Common Ancestor of a Binary Tree
/*
TreeNode *lowestCommonAncestor(TreeNode *root, TreeNode *A, TreeNode *B) {
    if (root == NULL) {
        return NULL;
    }
    if (root == A || root == B) {
        return root;
    }
    TreeNode *left = lowestCommonAncestor(root->left, A, B);
    TreeNode *right = lowestCommonAncestor(root->right, A, B);
    if (left != NULL && right != NULL) {
        return root;
    }
    if (left != NULL)
        return left;
    if (right != NULL)
        return right;
    return NULL;
}
*/
// 237	Delete Node in a Linked List

// 238	Product of Array Except Self
    // forward + backward traversal recording product



// 240	Search a 2D Matrix II
/*
int searchMatrix(vector<vector<int> > &matrix, int target) {
    // write your code here
    if (matrix.size() == 0 || matrix[0].size() == 0) {
        return 0;
    }
    int count = 0;
    int row = 0;
    int col = matrix[0].size() - 1;
    
    while (row < matrix.size() && col >= 0) {
        if (target > matrix[row][col]) {
            ++row;
        }
        else if (target < matrix[row][col]) {
            --col;
        }
        else {
            ++count;
            ++row;
        }
    }
    return count;
}
*/
// 257	Binary Tree Paths

// 284	Peeking Iterator

// 383	Ransom Note











