#pragma once

#include <cassert>
#include <iostream>
#include <map>
#include <set>
#include <unordered_map>
#include <vector>

#include "common.h"

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
    for (auto id : node->predecessors()) {
        nodes_[id]->successors().erase(node->id());
    }
    for (auto id : node->successors()) {
        nodes_[id]->predecessors().erase(node->id());
    }
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
    if (visited.count(node->id())) {
        return;  // Node is already visited
    }

    visited.insert(node->id());  // Mark the node as visited

    // Recur for all the successors (children) of the node
    for (int successor_id : node->successors()) {
        Box<Node<T>> successor = nodes_.at(successor_id);
        TopologicalSortUtil(successor, visited, result);
    }

    // Push the current node to the result stack (postorder)
    result.push_back(node);
}

template <typename T>
std::vector<Box<Node<T>>> Graph<T>::TopologicalSort() {
    std::set<int> visited;
    std::vector<Box<Node<T>>> result;

    // Perform DFS for each node to ensure all components are visited
    for (const auto& pair : nodes_) {
        Box<Node<T>> node = pair.second;
        if (visited.count(node->id()) == 0) {
            TopologicalSortUtil(node, visited, result);
        }
    }

    // The result is in reverse order (postorder), so we reverse it to get
    // topological order
    std::reverse(result.begin(), result.end());

    return result;
}
}  // namespace utils
