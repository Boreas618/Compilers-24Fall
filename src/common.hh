#include <algorithm>
#include <unordered_set>

/**
 * The Box implementation here differs from Rust's Box as it allows shared
 * ownership. However, I am considering refactoring parts of the code to use
 * `unique_ptr`, which aligns more closely with Rust's Box semantics.
 */
template <typename T>
using Box = std::shared_ptr<T>;

namespace common {
template <typename T>
std::unordered_set<T> set_intersection(const std::unordered_set<T>& set1,
                                       const std::unordered_set<T>& set2) {
    const auto& smaller = (set1.size() < set2.size()) ? set1 : set2;
    const auto& larger = (set1.size() < set2.size()) ? set2 : set1;

    std::unordered_set<T> result;

    for (const auto& element : smaller) {
        if (larger.find(element) != larger.end()) {
            result.insert(element);
        }
    }

    return result;
}

template <typename T>
std::unordered_set<T> set_union(const std::unordered_set<T>& set1,
                                const std::unordered_set<T>& set2) {
    std::unordered_set<T> result = set1;
    result.insert(set2.begin(), set2.end());
    return result;
}
};  // namespace common
