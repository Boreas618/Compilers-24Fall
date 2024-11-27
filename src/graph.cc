#include "graph.hh"

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
}  // namespace utils