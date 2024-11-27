#pragma once

#include <cassert>
#include <iostream>
#include <map>
#include <set>
#include <unordered_map>
#include <vector>

#include "common.hh"

namespace utils {

enum class NodeColor {
    kNone = 0,
    kSSGVisted = 1,  // Visited when generating single source graph.
    kDFSVisted = 1 << 1
};

using NodeSet = std::set<int>;

template <typename T>
class Node {
   public:
    Node(int id, Box<Graph<T>> graph, T element,
         NodeColor color = NodeColor::kNone)
        : id_(id),
          graph_(std::move(graph)),
          element_(std::move(element)),
          color_(color) {}

    T element() const { return element_; }
    const NodeSet& successors() const { return successors_; }
    const NodeSet& predecessors() const { return predecessors_; }
    int id() const { return id_; }
    int out_degree() { return successors_.size(); }
    int in_degree() { return predecessors_.size(); }
    NodeColor& color() { return color_; }

   private:
    int id_;
    Box<Graph<T>> graph_;
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

    void TopologicalSortUtil(Box<Node<T>> node, std::set<Box<Node<T>>>& visited,
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

}  // namespace utils
