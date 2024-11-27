/*#include "graph.hh"

namespace utils {

template <typename T>
Box<Node<T>> Graph<T>::AddNode(T value) {
    auto node =
        std::make_shared<Node<T>>(node_count_++, this, std::move(value), 0);
    nodes_.emplace(node->key(), node);
    return node;
}

template <typename T>
void Graph<T>::RemoveNode(Box<Node<T>> node) {
    assert(node->out_degree() == 0);
    assert(node->in_degree() == 0);
    nodes_.erase(node->key());
    delete node;
}

template <typename T>
void Graph<T>::AddEdge(Box<Node<T>> from, Box<Node<T>> to) {
    assert(from);
    assert(to);
    assert(from->graph_ == to->graph_);

    if (HasEdge(from, to)) return;
    to->predecessors_.insert(from->key());
    from->successors_.insert(to->key());
}

template <typename T>
void Graph<T>::RemoveEdge(Box<Node<T>> from, Box<Node<T>> to) {
    assert(from && to);
    to->predecessors_.erase(from->key());
    from->successors_.erase(to->key());
}

template <typename T>
bool Graph<T>::HasEdge(const Box<Node<T>> from, const Box<Node<T>> to) const {
    return from->successors().count(to->key()) > 0;
}

template <typename T>
void Graph<T>::TopologicalSortUtil(Box<Node<T>> node,
                                   std::set<Box<Node<T>>>& visited,
                                   std::vector<Box<Node<T>>>& result) {
    for (const auto id : node->successors()) {
        if (!visited.count(id)) {
            TopologicalSortUtil(node, visited, result);
        }
    }
    result.push_back(node);
    visited.insert(node);
}

template <typename T>
std::vector<Box<Node<T>>> Graph<T>::TopologicalSort() {
    std::vector<Box<Node<T>>> result;
    std::set<Box<Node<T>>> visited;

    for (const auto& [_, node] : nodes_) {
        if (!visited.count(node->id())) {
            TopologicalSortUtil(node, visited, result);
        }
    }
    std::reverse(result.begin(), result.end());
    return result;
}

}  // namespace utils*/