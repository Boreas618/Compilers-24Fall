#pragma once

#include <cassert>
#include <iostream>
#include <map>
#include <set>
#include <unordered_map>
#include <vector>

#include "common.hh"

namespace utils {

template <typename T>
class Graph;

enum class NodeColor {
    kNone = 0,
    kSSGVisted = 1,  // Visited when generating single source graph.
    kDFSVisted = 1 << 1
};

using NodeSet = std::set<int>;

template <typename T>
class Node {
   public:
    Node(int id, Graph<T>* graph, T element, NodeColor color = NodeColor::kNone)
        : id_(id), graph_(graph), element_(std::move(element)), color_(color) {}

    T element() const { return element_; }
    Graph<T>* graph() const { return graph_; }
    NodeSet& successors() { return successors_; }
    NodeSet& predecessors() { return predecessors_; }
    int id() const { return id_; }
    int out_degree() { return successors().size(); }
    int in_degree() { return predecessors().size(); }
    NodeColor& color() { return color_; }

   private:
    int id_;
    Graph<T>* graph_;
    NodeSet successors_;
    NodeSet predecessors_;
    T element_;
    NodeColor color_;
};

template <typename T>
class Graph {
   public:
    Graph() : node_count_(0) {}

    const std::map<int, Box<Node<T>>>& nodes() const { return nodes_; }

    void TopologicalSortUtil(Box<Node<T>> node, std::set<int>& visited,
                             std::vector<Box<Node<T>>>& result);
    std::vector<Box<Node<T>>> TopologicalSort();

    Box<Node<T>> AddNode(T info);
    void RemoveNode(Box<Node<T>> node);
    void AddEdge(Box<Node<T>> from, Box<Node<T>> to);
    void RemoveEdge(Box<Node<T>> from, Box<Node<T>> to);
    bool HasEdge(const Box<Node<T>> from, const Box<Node<T>> to) const;

   private:
    std::map<int, Box<Node<T>>> nodes_;
    int node_count_;
};

template <typename T>
Box<Node<T>> Graph<T>::AddNode(T value) {
    auto node = std::make_shared<Node<T>>(node_count_++, this, std::move(value),
                                          NodeColor::kNone);
    nodes_.emplace(node->id(), node);
    return node;
}

template <typename T>
void Graph<T>::RemoveNode(Box<Node<T>> node) {
    //assert(node->out_degree() == 0);
    //assert(node->in_degree() == 0);
    nodes_.erase(node->id());
}

template <typename T>
void Graph<T>::AddEdge(Box<Node<T>> from, Box<Node<T>> to) {
    assert(from);
    assert(to);
    assert(from->graph() == to->graph());

    if (HasEdge(from, to)) return;
    to->predecessors().insert(from->id());
    from->successors().insert(to->id());
}

template <typename T>
void Graph<T>::RemoveEdge(Box<Node<T>> from, Box<Node<T>> to) {
    assert(from && to);
    to->predecessors().erase(from->id());
    from->successors().erase(to->id());
}

template <typename T>
bool Graph<T>::HasEdge(const Box<Node<T>> from, const Box<Node<T>> to) const {
    return from->successors().count(to->id()) > 0;
}

template <typename T>
void Graph<T>::TopologicalSortUtil(Box<Node<T>> node, std::set<int>& visited,
                                   std::vector<Box<Node<T>>>& result) {
    for (const auto id : node->successors()) {
        if (!visited.count(id)) {
            TopologicalSortUtil(node, visited, result);
        }
    }
    result.push_back(node);
    visited.insert(node->id());
}

template <typename T>
std::vector<Box<Node<T>>> Graph<T>::TopologicalSort() {
    std::vector<Box<Node<T>>> result;
    std::set<int> visited;

    for (const auto& [_, node] : nodes_) {
        if (!visited.count(node->id())) {
            TopologicalSortUtil(node, visited, result);
        }
    }
    std::reverse(result.begin(), result.end());
    return result;
}
}  // namespace utils
